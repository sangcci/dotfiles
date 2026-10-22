"""Exercise the real stdio proxy with local JDK and Gradle source artifacts."""
import json
import select
import subprocess
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse


def read(stream):
    size = None
    while line := stream.readline():
        if line == b'\r\n':
            break
        if line.lower().startswith(b'content-length:'):
            size = int(line.split(b':', 1)[1])
    return json.loads(stream.read(size)) if size is not None else None


def write(stream, message):
    body = json.dumps(message).encode()
    stream.write(f'Content-Length: {len(body)}\r\n\r\n'.encode() + body)
    stream.flush()


if len(sys.argv) > 1 and sys.argv[1] == '--server':
    while message := read(sys.stdin.buffer):
        if message['method'] == 'exit':
            break
        write(sys.stdout.buffer, {
            'jsonrpc': '2.0', 'id': message['id'],
            'result': {'uri': message['params']['uri'], 'range': {
                'start': {'line': 15, 'character': 0},
                'end': {'line': 15, 'character': 1},
            }},
        })
    sys.exit(0)

root = Path(__file__).resolve().parents[1]
proc = subprocess.Popen(
    [str(root / 'target/release/kotlin-lsp-proxy'), sys.executable,
     str(Path(__file__).resolve()), '--server'],
    stdin=subprocess.PIPE, stdout=subprocess.PIPE,
)
cases = [
    ('file://' + str(Path.home() / '.sdkman/candidates/java/25.0.1-tem/lib/src.zip')
     + '!/java.net.http/java/net/http/HttpClient.java', 'abstract class HttpClient', False),
]
base = Path.home() / '.gradle/caches/modules-2/files-2.1/com.nimbusds/nimbus-jose-jwt/10.9.1'
binary = next(base.glob('*/nimbus-jose-jwt-10.9.1.jar'))
cases.append(('jar://' + str(binary) + '!/com/nimbusds/jwt/proc/DefaultJWTProcessor.class',
              'class DefaultJWTProcessor', True))
try:
    for request_id, (uri, expected, reset) in enumerate(cases, 1):
        write(proc.stdin, {'jsonrpc': '2.0', 'id': request_id,
                          'method': 'textDocument/definition', 'params': {'uri': uri}})
        while True:
            assert select.select([proc.stdout], [], [], 10)[0], 'proxy response timed out'
            reply = read(proc.stdout)
            if reply.get('id') == request_id:
                break
        target = reply['result']
        path = Path(unquote(urlparse(target['uri']).path))
        assert '!/' not in target['uri'], target
        assert expected in path.read_text(), path
        assert target['range']['start']['line'] == (0 if reset else 15)
        print(f'PASS: {expected} -> readable {path.suffix} source')
    write(proc.stdin, {'jsonrpc': '2.0', 'method': 'exit'})
    proc.wait(timeout=10)
    assert proc.returncode == 0
finally:
    if proc.poll() is None:
        proc.kill()
        proc.wait()

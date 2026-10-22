# Temporary Kotlin LSP archive proxy

Based on https://github.com/zed-extensions/kotlin/pull/107 at commit
`4ff9f361a2b26ecd2ac15accc2f9f05284e20a9b` (MIT).
Only the standalone proxy is vendored; the installed Zed extension is unchanged.

Build on macOS:

```sh
CARGO_TARGET_AARCH64_APPLE_DARWIN_LINKER=/usr/bin/cc SDKROOT="$(xcrun --show-sdk-path)" cargo build --release --locked --manifest-path zed/kotlin-lsp-proxy/Cargo.toml
```

Zed settings launch the proxy with the installed `bin/intellij-server --stdio`.
Update that argument when the installed Kotlin server version changes.
Remove `lsp.kotlin-lsp.binary` to return to the extension-managed launch.

Local addition: Gradle `.jar!/...class` targets resolve to matching Java source
in a sibling `-sources.jar`, including nested classes. The source opens at line 1
because bytecode positions cannot be reused for source. No decompiler is included;
classes without attached Java source remain unresolved.

Extracted files are cached under `$TMPDIR/kotlin-lsp-sources`.

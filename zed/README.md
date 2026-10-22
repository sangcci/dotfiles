# zed

Zed settings, Vim key bindings, tasks, and the Kanso theme, managed with Stow.

Markdown previews use `.SystemUIFont` for prose and Jetendard for code. In Vim Normal mode, `Space m p` opens the preview; `-` focuses the project panel from the editor or preview.

`tasks.json` provides Gradle tasks for all tests or the current Kotest spec. JVM navigation uses the local Java SDK and a temporary Kotlin archive proxy; see [kotlin-lsp-proxy/README.md](kotlin-lsp-proxy/README.md) for its build command and limitations. Build the proxy before using the configured Kotlin language server, and update the server argument when the installed Kotlin server version changes.

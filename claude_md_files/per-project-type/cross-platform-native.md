# Cross-Platform Native Project Guide

> **Scope**: projects that compile to native binaries or mobile apps across Linux, macOS, Windows, and/or Android/iOS.
> **Examples**: CLI tools, desktop services, screenshot/screen-capture utilities, system utilities.

---

## 1. Repository Layout

Keep platform-specific code isolated and share common logic through a thin abstraction layer.

```
project/
├── README.md
├── docs/
│   ├── platforms.md          # Platform capability matrix and quirks
│   └── build.md              # Cross-compilation instructions
├── src/ or internal/
│   ├── core/                 # Platform-agnostic business logic
│   ├── platform/
│   │   ├── linux.rs|go|py
│   │   ├── macos.rs|go|py
│   │   ├── windows.rs|go|py
│   │   └── android/...
│   └── main.rs / main.go / __main__.py
├── scripts/
│   ├── build.sh              # Native build for current host
│   ├── build-all.sh          # Cross-compile matrix
│   ├── test.sh
│   └── release.sh
├── config.toml.example
└── .gitignore
```

## 2. Platform Abstraction

- Define a single interface for the cross-platform behavior.
- Implement the interface once per platform in `src/platform/<os>/`.
- Gate platform files with build tags (`//go:build`, `#[cfg(target_os)]`, etc.).
- Keep platform modules small; most code lives in `core/`.

## 3. Build and Cross-Compilation

- Pin toolchain versions (Go, Rust, NDK, Xcode, MSVC).
- Document cross-compilation dependencies (zig, osxcross, MinGW, Android NDK).
- Keep a `scripts/build-all.sh` that emits artifacts to `dist/` or `build/`.
- Name release artifacts with OS, architecture, and version: `myapp-v1.2.0-linux-amd64`.
- Run smoke tests on target platforms when possible (CI matrix or manual).

## 4. Testing

- Unit tests for `core/` must run on every platform.
- Platform tests live next to platform code and may be skipped on other OSes.
- Use CI matrix builds (GitHub Actions, GitLab CI) for Linux/macOS/Windows.
- For features that can't run headless (e.g., screen capture), write manual test scripts and record expected behavior.

## 5. Configuration and Environment

- Use config files and env vars; avoid hard-coded paths, IPs, or ports.
- Platform-specific defaults (temp dir, config dir, log dir) should resolve through standard libraries (`directories`, `os.User*Dir`, `appdirs`).
- Respect OS conventions for config locations (`~/.config/`, `~/Library/Application Support/`, `%APPDATA%`).

## 6. Logging and Observability

- Structured logs with correlation/request IDs.
- Platform capability detection should be logged at startup (OS, display server, permissions).
- Capture verbose logs to a rotating temp file for debugging.
- When platform APIs behave differently, log the actual behavior observed.

## 7. Permissions and Sandboxing

- Document required permissions per platform (screen recording, accessibility, admin/root).
- Provide setup scripts or manual steps to grant permissions.
- On macOS, handle `CGRequestScreenCaptureAccess` and `TCC` prompts.
- On Wayland, prefer `xdg-desktop-portal` APIs; gracefully degrade if unavailable.
- On Windows, handle DPI awareness and multi-monitor geometry correctly.

## 8. Release Artifacts

- Build statically linked binaries where feasible for portability.
- Include a checksum file and release notes.
- Keep debug symbols for released binaries when size allows; otherwise separate them.
- Never commit build artifacts or release binaries to the main branch.

## 9. Agent-Friendly Conventions

- Keep platform detection logic explicit and logged.
- Use feature flags or build tags rather than runtime OS checks when the decision is compile-time.
- Document known platform gotchas in `docs/platforms.md`.
- Write manual test scripts for behaviors that cannot be exercised headlessly.
- Update `docs/platforms.md` whenever a new platform quirk is discovered.

## 10. Common Gotchas

- **Linux**: X11 vs. Wayland detection; prefer portal APIs for Wayland.
- **macOS**: Sandboxing, screen capture permissions, retina display scaling.
- **Windows**: DPI awareness, multiple monitors with different scaling, admin elevation.
- **Android**: Service lifecycle, foreground notification permissions, NDK ABI matrix.
- **Cross-compile**: CGO, C runtime linking, and SDK paths are the usual failure points.

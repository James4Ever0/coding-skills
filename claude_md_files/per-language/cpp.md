# C / C++ Guide

> **Scope**: systems programming, embedded, game engines, and performance-critical applications.

---

## 1. Project Layout

```text
.
├── src/                  # Source files
├── include/              # Public headers
├── tests/                # Test sources
├── third_party/          # Vendored dependencies
├── CMakeLists.txt        # or meson.build
├── conanfile.txt         # or vcpkg.json
├── scripts/
│   ├── build.sh
│   └── test.sh
└── README.md
```

---

## 2. Build System

- Use CMake, Meson, or Bazel depending on team familiarity.
- Pin compiler versions and toolchain files.
- Support out-of-source builds (`mkdir build && cd build && cmake ..`).
- Provide Debug and Release presets.

---

## 3. Code Style

- Use `clang-format` with a checked-in `.clang-format`.
- Use `clang-tidy` with a checked-in `.clang-tidy`.
- Prefer RAII and smart pointers over raw `new`/`delete` in C++.
- Avoid undefined behavior: initialize variables, check bounds, and respect object lifetimes.

---

## 4. Safety

- Validate array indices and pointer dereferences.
- Use safe string/buffer functions (`std::string`, `snprintf`, `std::span`).
- Run sanitizers in CI: AddressSanitizer, UndefinedBehaviorSanitizer, ThreadSanitizer.
- Fuzz-test parsers and network-facing code.

---

## 5. Testing

- Use GoogleTest, Catch2, or doctest.
- Keep tests fast; mock hardware or OS dependencies.
- Run tests under sanitizers regularly.

---

## 6. Cross-Compilation

- Use toolchain files for target platforms.
- Abstract platform differences behind a thin OS layer.
- CI should build for all supported targets.

---

## 7. Dependency Management

- Prefer vendoring or lockfile-based package managers (Conan, vcpkg).
- Pin dependency versions and checksums.
- Document build-time and runtime dependencies separately.

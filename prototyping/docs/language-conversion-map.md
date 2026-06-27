# Language Conversion Map

Guides agent-guided semantic translation between languages. Conversion is **optional** — prototypes can live in one language forever.

## Python → Go

| Python | Go | Notes |
|--------|----|-------|
| `def func()` | `func Func()` | Exported functions are PascalCase |
| `dataclass` | `struct` | Use constructor function `New*()` |
| `Optional[T]` | `*T` or `T` with zero value | Go has no `None`; use pointer or sentinel |
| `list[T]` | `[]T` | |
| `dict[K, V]` | `map[K]V` | |
| `Exception` | `error` | Return error as second value |
| `unittest.TestCase` | `testing.T` | Standard library in both |
| `if not x:` | `if x == nil` or zero check | Go has no truthiness |

## Python → Rust

| Python | Rust | Notes |
|--------|------|-------|
| `def func()` | `fn func()` | |
| `dataclass` | `struct` + `impl` | Derive `Debug`, `PartialEq` |
| `Optional[T]` | `Option<T>` | Idiomatic Rust |
| `list[T]` | `Vec<T>` | |
| `dict[K, V]` | `HashMap<K, V>` | |
| `Exception` | `Result<T, E>` / `panic!` | Prefer `Result` for recoverable errors |
| `unittest.TestCase` | `#[test]` | Attribute-based |
| `if not x:` | `if !x` | Same syntax |

## Python → C

| Python | C | Notes |
|--------|---|-------|
| `def func()` | `int func(void)` | Manual memory management |
| `dataclass` | `struct` | |
| `list[T]` | Array + size | Must track length manually |
| `dict[K, V]` | Hash table lib | No built-in |
| `Exception` | Error codes / `errno` | Return int, check errno |
| `unittest.TestCase` | Custom test harness | Use `assert()` macros |

## Python → Java

| Python | Java | Notes |
|--------|------|-------|
| `def func()` | `public void func()` | Methods belong to classes |
| `dataclass` | `record` (Java 16+) or class | |
| `Optional[T]` | `Optional<T>` (java.util) | |
| `list[T]` | `List<T>` (ArrayList) | |
| `dict[K, V]` | `Map<K, V>` (HashMap) | |
| `Exception` | Exception (checked/unchecked) | try-catch-finally |
| `unittest.TestCase` | JUnit | Though JUnit is a dependency |

## Test Structure Mapping

**Python** (stdlib only):

```python
import sys, unittest
suite = unittest.TestLoader().discover(".")
unittest.TextTestRunner().run(suite)
```

**Go** (stdlib only):

```go
// go test ./... does automatic discovery
func TestXxx(t *testing.T) { /* ... */ }
```

**Rust** (stdlib only):

```rust
// cargo test does automatic discovery
#[test]
fn test_xxx() { /* ... */ }
```

**C** (custom harness):

```c
// Define test macros, compile and run manually
#include <assert.h>
void test_xxx() { assert(1 + 1 == 2); }
```

**Java** (stdlib or JUnit):

```java
// Prefer JUnit for non-trivial tests
// With stdlib: custom assert + main() runner
```

# Testing References

*Topic: Testing patterns, assertions, test organization.*
*Last updated: 2026-06-27*

## Philosophy

Tests run standalone with the language's standard library. No framework coupling.

## Python

```python
import unittest

class TestMyFeature(unittest.TestCase):
    def test_something(self):
        self.assertEqual(1 + 1, 2)

if __name__ == "__main__":
    unittest.main()
```

Runner: `run_all.py` using `unittest.TestLoader().discover()`.

## Bash

```bash
set -euo pipefail
source lib/helpers.sh

fail_count=0
assert_eq() { ... }
# Test body, exit 0 or non-zero
```

Runner: `run_all.sh` loops over `test_*.sh`.

## Go

```go
import "testing"

func TestMyFeature(t *testing.T) {
    if 1+1 != 2 {
        t.Errorf("expected 2, got %d", 1+1)
    }
}
```

Runner: `go test ./...`

## Rust

```rust
#[test]
fn test_my_feature() {
    assert_eq!(1 + 1, 2);
}
```

Runner: `cargo test`

## Reference Links

- *(Add web links here when you find relevant reference projects or demos)*

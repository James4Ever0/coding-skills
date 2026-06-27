# CLI Argument Parsing References

*Topic: CLI argument parsing patterns across languages.*
*Last updated: 2026-06-27*

## Python

Standard library: `argparse`

```python
import argparse

parser = argparse.ArgumentParser(description="My tool")
parser.add_argument("name", help="The thing to process")
parser.add_argument("--verbose", "-v", action="store_true")
args = parser.parse_args()
```

## Bash

Manual parsing with `getopts` or `$1`, `$2`, etc.

```bash
while getopts "v" opt; do
    case "$opt" in
        v) VERBOSE=1 ;;
        *) exit 1 ;;
    esac
done
shift $((OPTIND - 1))
```

## Go

Standard library: `flag`

```go
import "flag"
var verbose = flag.Bool("v", false, "verbose output")
flag.Parse()
```

## Rust

Crate: `clap` (or manual `std::env::args()`)

```rust
let args: Vec<String> = std::env::args().collect();
```

## C

Standard: `getopt` from `unistd.h`

## Java

Standard: no built-in parser. Common choices: `picocli`, `args4j`.

## Reference Links

- *(Add web links here when you find relevant reference projects or demos)*

---

*Maintained by the prototyping workflow. Update when you find new patterns or reference projects.*

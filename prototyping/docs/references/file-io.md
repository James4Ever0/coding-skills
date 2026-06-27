# File I/O References

*Topic: File reading/writing, path handling, streaming.*
*Last updated: 2026-06-27*

## Python

```python
# Read entire file
with open("path.txt") as f:
    content = f.read()

# Write entire file
with open("path.txt", "w") as f:
    f.write(content)

# Read JSON
import json
with open("data.json") as f:
    data = json.load(f)
```

## Bash

```bash
# Read file
content=$(cat "path.txt")

# Write file
echo "content" > "path.txt"

# Check existence
if [ -f "path.txt" ]; then ...
```

## Go

```go
import "os"
content, err := os.ReadFile("path.txt")
err = os.WriteFile("path.txt", []byte("content"), 0644)
```

## Rust

```rust
use std::fs;
let content = fs::read_to_string("path.txt")?;
fs::write("path.txt", "content")?;
```

## Reference Links

- *(Add web links here when you find relevant reference projects or demos)*

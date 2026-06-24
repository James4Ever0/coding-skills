# Python Guide

## Tooling

- **Runtime manager**: `pyenv`, `uv`, or `mise`
- **Virtual env**: `venv` (built-in) or `uv venv`
- **Package manager**: `uv pip` or `pip`
- **Formatter**: `ruff format` or `black`
- **Linter**: `ruff check` or `flake8`
- **Type checker**: `mypy` or `pyright`
- **Test runner**: `pytest`
- **Coverage**: `pytest-cov`

## Project Layout

```
project/
├── pyproject.toml
├── README.md
├── src/
│   └── project/
│       ├── __init__.py
│       └── main.py
├── tests/
│   ├── __init__.py
│   └── test_main.py
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── start.sh
└── .gitignore
```

## China Mirrors

```toml
# pyproject.toml or pip.conf
[[tool.uv.index]]
url = "https://pypi.tuna.tsinghua.edu.cn/simple"
default = true
```

## Conventions

- Use `pyproject.toml` for project metadata and tool config.
- Activate the virtual env before every install/run command.
- Write type hints for public functions.
- Use `pathlib` over `os.path`.
- Use `pydantic` or `dataclasses` for data shapes.
- Use `structlog` or standard `logging` with a config file.

## Scripts

```bash
# scripts/install.sh
python -m venv .venv
source .venv/bin/activate
pip install -e ".[dev]"

# scripts/test.sh
source .venv/bin/activate
pytest --cov=src --cov-report=term-missing

# scripts/start.sh
source .venv/bin/activate
python -m project.main
```

## Common Gotchas

- Don't commit `.venv/`, `__pycache__/`, `.pytest_cache/`, or `.mypy_cache/`.
- Avoid mutable default arguments.
- Don't use `print` for debug logs; use a logger.

## Logging

Use the standard `logging` module with `RotatingFileHandler` or `TimedRotatingFileHandler`, or `structlog` for structured logs. Keep logs in `logs/` or `/tmp` and never commit them.

## Reference Projects

When exploring unfamiliar domains, clone reference Python projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.

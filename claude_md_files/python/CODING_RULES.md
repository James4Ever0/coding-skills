# CODING_RULES.md — Python Projects

> Python-specific rules for agentic and manual development.

## 1. Environment

- Use a virtual environment (`venv` or `conda`) for every project.
- Pin Python version in:
  - `pyproject.toml` (`requires-python`)
  - `.python-version` or `.tool-versions`
  - README/SETUP.md
- Activate the environment in every script (`scripts/setup.sh`, `scripts/test.sh`, etc.).

## 2. Dependency management

- Prefer `pyproject.toml` with `requirements.txt` or `requirements/` for locking.
- Pin versions: `fastapi==0.111.0`, `pydantic==2.7.4`, etc.
- Use a regional mirror if appropriate:
  - `pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`
  - Or set per-command: `pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt`
- Keep `requirements-dev.txt` for test/formatting tools.

## 3. Code style

- Use `ruff` for linting and formatting.
- Use `black` only if the project already relies on it.
- Run type checking with `mypy` or `pyright`.
- Follow PEP 8 naming: `snake_case` for functions/variables, `PascalCase` for classes, `UPPER_CASE` for constants.

## 4. Project structure

```
my_project/
├── pyproject.toml
├── requirements.txt
├── README.md
├── src/
│   └── my_project/
│       ├── __init__.py
│       ├── main.py
│       └── ...
├── tests/
│   ├── __init__.py
│   ├── conftest.py
│   └── test_*.py
├── scripts/
│   ├── setup.sh
│   ├── test.sh
│   └── start.sh
└── tmp/          # gitignored
```

## 5. Testing

- Use `pytest`.
- Put fixtures in `tests/conftest.py`.
- Aim for ≥ 70% coverage on new code.
- Run: `pytest -q --cov=src --cov-report=term-missing`.
- Mock external HTTP calls, DB, time, and randomness.

## 6. Async code

- Use `async`/`await` consistently; do not mix blocking calls into async paths.
- Prefer `httpx` over `requests` in async code.
- Use `aiosqlite`, `asyncpg`, or similar for async DB access.

## 7. Configuration and secrets

- Use `pydantic-settings`, environment variables, or a config file for settings.
- Never commit `.env` files or real API keys.
- Provide a `.env.example` with dummy values.

## 8. Logging

- Use the standard `logging` module.
- Support a `DEBUG`/`VERBOSE` flag.
- Write verbose logs to `tmp/` or `logs/`; add to `.gitignore`.

## 9. Entry points

- Define console scripts in `pyproject.toml` when appropriate.
- Provide `scripts/start.sh` that activates the venv and runs the app.

## 10. Common commands

```bash
# setup
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# test
pytest -q --cov=src --cov-report=term-missing

# lint
ruff check .
ruff format .
mypy src
```

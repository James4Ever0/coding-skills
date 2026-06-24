# Data Pipeline Projects

> **Scope**: ETL, batch processing, streaming, ML data prep, and analytics workflows.

---

## 1. Project Layout

```text
.
├── pipelines/            # Individual pipeline definitions
├── jobs/                 # Batch or streaming job code
├── transforms/           # Reusable data transformations
├── schemas/              # Avro / JSON Schema / Protobuf definitions
├── tests/
│   ├── fixtures/         # Sample input data
│   └── integration/      # End-to-end pipeline tests
├── scripts/
│   ├── run-local.sh
│   └── run-prod.sh
├── docs/
└── README.md
```

---

## 2. Data Contracts

- Define schemas explicitly and validate at ingestion.
- Version schemas and support backward-compatible evolution.
- Keep a data dictionary in `docs/data-dictionary.md`.

---

## 3. Idempotency and Fault Tolerance

- Design jobs to be rerunnable without side effects.
- Use checkpointing or write-ahead logs for long-running jobs.
- Handle partial failures gracefully; record failed records to a dead-letter queue.

---

## 4. Testing

- Unit-test transforms with small fixtures.
- Integration-test pipelines against a local or in-memory runner.
- Assert output schemas and row counts, not just absence of crashes.

---

## 5. Observability

- Log record counts, throughput, and latency per stage.
- Emit metrics for rows in, rows out, and errors.
- Make logs and intermediate outputs inspectable by agents.

---

## 6. Environment Isolation

- Separate development, staging, and production data sources.
- Never run production transformations against development data, or vice versa.
- Use temporary tables or namespaces for experiments.

---

## 7. Performance

- Profile before optimizing.
- Prefer streaming over loading entire datasets into memory.
- Partition and parallelize where the execution engine supports it.

# Java Guide

## Tooling

- **Runtime manager**: SDKMAN or mise
- **Build tool**: Maven or Gradle
- **Formatter**: google-java-format, Spotless, or palantir-java-format
- **Linter**: Checkstyle, SpotBugs, PMD
- **Test runner**: JUnit 5, AssertJ
- **Coverage**: JaCoCo

## Project Layout

```
project/
├── pom.xml / build.gradle.kts
├── README.md
├── src/
│   ├── main/java/com/example/project/
│   │   └── Main.java
│   └── test/java/com/example/project/
│       └── MainTest.java
├── scripts/
│   ├── install.sh
│   ├── test.sh
│   └── start.sh
└── .gitignore
```

## China Mirrors

```xml
<!-- ~/.m2/settings.xml mirror section -->
<mirror>
  <id>aliyunmaven</id>
  <mirrorOf>central</mirrorOf>
  <name>Aliyun Maven</name>
  <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

## Conventions

- Pin Maven/Gradle wrapper versions.
- Prefer immutable domain models, records (Java 16+), or Lombok-free POJOs.
- Use constructor injection with Spring/Jakarta.
- Validate input at the API boundary.
- Keep packages aligned with architecture layers.
- Use SLF4J + Logback for logging.

## Scripts

```bash
# scripts/install.sh
./mvnw -q dependency:resolve

# scripts/test.sh
./mvnw test

# scripts/start.sh
./mvnw spring-boot:run
```

## Common Gotchas

- Don't commit `target/`, `build/`, `.idea/`, `.classpath`, or `.env`.
- Don't hard-code database credentials; use env vars or config profiles.
- Use `Optional` carefully; avoid returning `null` from public APIs.
- Close resources with try-with-resources.

## Logging

Use SLF4J + Logback with rolling policies (`TimeBasedRollingPolicy` or `SizeBasedTriggeringPolicy`). Keep logs in `logs/` or `/tmp` and never commit them.

## Reference Projects

When exploring enterprise patterns, clone reference Java projects into `reference/` and summarize reusable patterns in `docs/library-notes/`.

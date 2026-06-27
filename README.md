# coding-skills

A distribution kit of reusable **Claude Code skills** and **context/guidance files**. There is no application source here — every file is something you copy into a project's (or your global) `.claude/` setup to shape how Claude Code behaves.

Two kinds of content:

- **Skills** (`historical_skills/`) — invoked on demand with `/name`. Each is a prompt + workflow.
- **Guidance** (`claude_md_files/`) — passive context auto-injected via `CLAUDE.md` / `AGENTS.md`. Never invoked.

## Layout

```
coding-skills-github/
├── INSTALL.md            # install guide — toolkit-first, then full set, then guides
├── SKILL_INSTALL.md      # alternate skill-centric install guide (overlaps INSTALL.md)
├── historical_skills/    # the skills
│   ├── <skill-name>/SKILL.md          # 33 atomic skills, one workflow each
│   └── coding-agent-toolkit/          # curated bundle (start here)
│       ├── README.md  INSTALL.md      # bundle's own grouped inventory + install
│       └── skills/*.md                # 26 consolidated skills
└── claude_md_files/      # guidance files (passive context)
    ├── CLAUDE.md                      # universal agent behavior + session routine
    ├── CODING_RULES.md                # universal coding standards
    ├── AGENTS.md.template             # per-project entry-point map (fill in, keep short)
    ├── README.md                      # index of the guidance files
    ├── per-language/*.md              # python, typescript, javascript, go, rust, java, bash, sql, cpp, docker
    ├── per-project-type/*.md          # web-app, api-service, cli-tool, data-pipeline, cross-platform-native
    └── <domain>/CODING_RULES.md       # universal, python, web, docker_and_devops, api_and_docs, agentic_workflows
├── prototyping/          # skill prototyping workspace (template)
│   ├── README.md                       # workspace overview
│   ├── PROTOTYPING_HOWTO.md            # how to use as a template
│   ├── MILESTONE.md                    # milestone tracker
│   ├── docs/                           # milestone schema, conversion map, testing strategy
│   │   └── references/                 # topic-based reference files
│   ├── python/                         # Python prototype template
│   ├── bash/                           # Bash prototype template
│   ├── golang/                         # Go conversion target
│   └── rust/                           # Rust conversion target
```

## The two skill sets

`historical_skills/` holds **33 single-purpose skill folders** (`<name>/SKILL.md`, installable one at a time) **and** `coding-agent-toolkit/`, a **curated re-packaging** of them as **26 flat `.md` skills**.

The toolkit merges and renames — e.g. `git-commit-history` → `/git-and-history`, `library-analysis` → `/analyze-before-use`, `project-init` → `/project-planning`, `code-review` → `/quality-review`. So skill names differ between the two sets; they are not a 1:1 match.

**Which to use:** install the **toolkit** for everyday coding (it's the curated, grouped set). Reach into the individual `historical_skills/` folders only for the extra experimental/specialized skills not bundled in the toolkit.

## Usage

```bash
PROJECT=/path/to/your/project

# Skills — toolkit, project-local
mkdir -p "$PROJECT/.claude/skills"
cp historical_skills/coding-agent-toolkit/skills/*.md "$PROJECT/.claude/skills/"

# Guidance — minimum recommended set
cp claude_md_files/CLAUDE.md          "$PROJECT/CLAUDE.md"
cp claude_md_files/CODING_RULES.md    "$PROJECT/CODING_RULES.md"
cp claude_md_files/AGENTS.md.template "$PROJECT/AGENTS.md"   # then fill in placeholders
```

Restart Claude Code to load skills, then verify with `/skills` or invoke one (`/plan-mode`, `/verify-run`). For global install, symlink-based development, per-language/per-type guides, and the full skill list, see **`INSTALL.md`**. For grouped skill inventories see **`coding-agent-toolkit/README.md`** and **`claude_md_files/README.md`**.

> **Note on overlap:** `INSTALL.md` and `SKILL_INSTALL.md` cover the same ground from different angles — prefer `INSTALL.md`. Likewise the toolkit duplicates many `historical_skills/` entries; don't install both copies of the same skill.

## Conventions

- Skills are single Markdown files with YAML frontmatter (`name`, `description`, `kind`, `user-invocable`); keep one workflow per skill, under ~300 lines.
- No machine-specific absolute paths or secrets in any file — ask for IPs/ports/keys at runtime or read from env.
- Keep `AGENTS.md` a short map; put depth in `docs/` and cross-link rather than duplicate.

## Prototyping

`prototyping/` — template workspace for creating new skills (Plan → Prototype → Test → Convert → Finalize). Key entry points:

- `prototyping/PROTOTYPING_HOWTO.md` — how to use this folder as a template
- `prototyping/README.md` — workspace overview
- `prototyping/MILESTONE.md` — status tracker
- `claude_md_files/prototyping/CODING_RULES.md` — coding rules
- `claude_md_files/prototyping/WORKFLOW.md` — detailed 5-phase workflow
- `claude_md_files/prototyping/MEMORY_SETUP.md` — memory file conventions
- `historical_skills/coding-skill-prototyping/SKILL.md` — atomic skill
- `historical_skills/coding-agent-toolkit/skills/coding-skill-prototyping.md` — toolkit skill

# PROGRESS.md

<!-- HANDOFF_START -->
## HANDOFF ZONE
Handoff-Version: v1
Updated: 2026-02-25 04:37 UTC

### Goal
Reflect OpenClaw subscription-capable onboarding guidance in repository docs.

### State
- Branch: main
- Files: README.md, AGENTS.md, PROGRESS.md
- Last command: apply_patch (create AGENTS.md)

### Next (ordered)
1. Update README.md with subscription-based onboarding commands.
2. Verify final document consistency and command examples.
3. Append completion log entry after edits.

### Blockers
- None.

### Guardrails
- Do not add or commit any secrets.
- Keep guidance compatible with existing WSL setup flow.
<!-- HANDOFF_END -->

## LOG (append only, English, never delete)
<!-- LOG_START -->
### 2026-02-25 04:37 UTC
**Done:**
- Inspected repository root and current documentation.
- Confirmed `AGENTS.md` and `PROGRESS.md` were missing.
- Created `AGENTS.md` with project constraints and decision log.

**Decided:**
- Add subscription-auth onboarding guidance in README: user asked to "reflect it".

**Next:**
- Patch README.md to include OpenClaw subscription auth options.
- Update HANDOFF `Last command` and append completion details.

**Context for next AI:**
- Existing README currently points to `openclaw onboard --install-daemon`.
- User context indicates interest in subscriber-based usage (OpenAI/Anthropic).
<!-- LOG_END -->

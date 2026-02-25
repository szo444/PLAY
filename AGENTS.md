# AGENTS.md
## One-liner
Utilities and setup scripts for local OpenClaw onboarding and experiments.

## Success Metrics (max 3)
1. A fresh machine can complete OpenClaw setup with one documented command flow.
2. Documentation reflects current authentication options without ambiguity.
3. Handoff state is always recoverable from `PROGRESS.md`.

## Constraints
- Tech: PowerShell + WSL Ubuntu 22.04, shell scripts, OpenClaw CLI workflows
- Cost: Prefer subscription-auth flows before paid API-key provisioning where available
- Security: Never commit secrets, tokens, or private keys
- Forbidden: Force-push, destructive git resets, or deleting user files without explicit request

## Decision Log
| Date | Decision | Why | Alternatives | Impact |
|------|----------|-----|--------------|--------|
| 2026-02-25 | Document subscription-based auth for OpenClaw onboarding | User requested reflecting latest auth path | Keep API-key-only flow | Faster onboarding and less friction for ChatGPT/Claude subscribers |

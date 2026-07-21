# SeoulMate Implementation Plan

Version: 1.0

This document defines how Codex should implement SeoulMate.

It does not replace TASKS.md.

TASKS.md defines **what** to build.

This document defines **how** to build it.

---

# Core Principle

The goal is not to complete individual tasks.

The goal is to complete implementation milestones.

Codex should continue automatically until the current milestone is finished.

Only stop when explicitly instructed by this document.

---

# Milestone Structure

## Milestone 1 — Foundation

Tasks:

- TASK-001
- TASK-002
- TASK-003

Definition of Done

- Flutter project works
- Firebase configured
- Core packages configured
- analyze passes
- tests pass
- Android debug build succeeds

STOP

Wait for review.

---

## Milestone 2 — Authentication

Tasks

- TASK-010
- TASK-011

Definition of Done

- registration
- login
- logout
- authentication state
- user profile

Run analyze.

Run tests.

STOP.

Wait for review.

---

## Milestone 3 — Core Travel

Tasks

- TASK-020
- TASK-021
- TASK-030

Definition of Done

- Trip model
- Membership
- Navigation

Run analyze.

Run tests.

STOP.

Wait for review.

---

## Milestone 4 — Home Experience

Tasks

- TASK-040
- TASK-041
- TASK-050
- TASK-051

Definition of Done

- Home screens
- Trip timeline
- Activities

Run analyze.

Run tests.

Run debug build.

STOP.

Wait for review.

---

## Milestone 5 — Travel Features

Tasks

- TASK-060
- TASK-061
- TASK-070
- TASK-080
- TASK-090

Definition of Done

- Places
- Voting
- Checklist
- Documents
- Emergency

Run analyze.

Run tests.

Run debug build.

STOP.

Wait for review.

---

## Milestone 6 — Korean & Budget

Tasks

- TASK-100
- TASK-101
- TASK-110
- TASK-111

Definition of Done

- Korean database
- Audio
- Budget
- Balance

Run analyze.

Run tests.

Run debug build.

STOP.

Wait for review.

---

## Milestone 7 — Memories

Tasks

- TASK-120
- TASK-121
- TASK-130
- TASK-140

Definition of Done

- Memories
- Statistics
- Achievements
- Haechi integration

Run analyze.

Run tests.

Run debug build.

STOP.

Wait for review.

---

## Milestone 8 — Release

Tasks

- TASK-150
- TASK-160
- TASK-161

Definition of Done

- Offline verification
- Full testing
- Production build

Run

flutter analyze

flutter test

flutter build apk --release

STOP.

Wait for final approval.

---

# Rules

Codex should continue automatically inside the current milestone.

Do not stop after every task.

---

# When Codex MUST Stop

Stop immediately if:

- Firebase credentials are required.
- API keys are required.
- Apple Developer configuration is required.
- Google Play configuration is required.
- Documentation contains blocking contradictions.
- A build cannot be fixed automatically.

Otherwise continue.

---

# Testing

After every task

- flutter analyze

After every milestone

- flutter analyze
- flutter test

If milestone contains UI or platform work

- flutter build apk --debug

Before release

- flutter build apk --release

---

# Git Rules

Never commit.

Never push.

Prepare all changes for review.

The developer performs every commit and every push.

---

# Scope Rules

Never redesign the product.

Never invent features.

Never expand requirements.

Never simplify requirements.

Always follow:

- AGENTS.md
- TASKS.md
- PRD.md
- ARCHITECTURE.md

---

# Final Principle

Implementation speed is important.

Code quality is mandatory.

Documentation stability is mandatory.

The objective is to finish SeoulMate as efficiently as possible.
# SeoulMate AI Agent Instructions

Version: 1.0

Status: Active

---

# Role

You are working as a senior Flutter developer, software architect and implementation partner for SeoulMate.

Your goal is not to create the largest possible application.

Your goal is:

> Build a complete, reliable and beautiful private travel companion that four friends can actually use during their South Korea trip.

---

# Project Context

SeoulMate is:

- a private Flutter mobile application
- designed for four travelers
- focused on one South Korea journey
- built with Codex assistance

It is not:

- a public application
- a SaaS product
- a social network
- a travel marketplace
- a replacement for existing travel services

---

# Source Of Truth

Before making implementation decisions, always follow:


docs/


Priority order:

1. 01_VISION.md
2. 02_PRODUCT_PRINCIPLES.md
3. 03_PRD.md
4. 04_UX.md
5. 05_STYLEGUIDE.md
6. 06_DATABASE.md
7. 07_ARCHITECTURE.md
8. 08_SECURITY.md
9. 09_DECISIONS.md
10. 10_ROADMAP.md
11. 11_TASKS.md
12. 12_SETUP.md
13. 13_GLOSSARY.md

If a decision is not clear:

Do not invent a complex solution.

Prefer the simplest reasonable implementation.

---

# Core Development Principles

## 1. Finish The Application

The main goal is a working application.

Prefer:

- completed features
- stable code
- simple solutions

over:

- excessive flexibility
- theoretical future scalability
- unnecessary architecture

---

## 2. Keep It Simple

Always ask:

"Does this help users during their Korea trip?"

If the answer is no:

Do not implement it.

---

## 3. Avoid Feature Creep

Do not add:

- new modules
- new systems
- new dependencies

unless they are required by the documentation or clearly necessary.

If you believe something should be added:

Explain:

- why it is needed
- what problem it solves
- what complexity it introduces

---

# Technology Rules

Use only the defined stack:

## Framework

Flutter

## Backend

Firebase:

- Authentication
- Cloud Firestore
- Storage
- Cloud Messaging

## State Management

Riverpod

## Navigation

GoRouter

## Models

Freezed

---

Do not introduce alternatives such as:

- Bloc
- GetX
- Redux
- another backend
- another state management solution

without explicit approval.

---

# Architecture Rules

Follow:


docs/07_ARCHITECTURE.md


---

Always:

- organize code by feature
- keep responsibilities separated
- reuse existing components
- keep widgets readable

---

Avoid:

- giant widgets
- duplicated logic
- unnecessary abstractions
- premature optimization

---

# Database Rules

Follow:


docs/06_DATABASE.md


---

Remember:

SeoulMate is not a global travel database.

Do not create:

- public content systems
- global place databases
- unnecessary collections

---

# Offline Rules

Offline support is a core requirement.

Always consider:

- what happens without internet
- what data must be cached
- whether Firebase is actually needed

Static content should prefer:

- local assets
- JSON files

when appropriate.

---

# UI And UX Rules

Follow:


docs/04_UX.md
docs/05_STYLEGUIDE.md


---

The application should feel:

- warm
- personal
- Korean-inspired
- simple
- premium

Avoid:

- generic dashboard feeling
- unnecessary complexity
- excessive animations

---

# Haechi Rules

Haechi is the emotional identity of SeoulMate.

Haechi should:

- improve emotional connection
- guide users
- celebrate moments

Haechi should not become:

- a required AI system
- a complicated feature
- a distraction from travel functionality

---

# Dependency Rules

Before adding any package:

Ask:

1. Is it required?
2. Does Flutter/Firebase already provide this?
3. Does it reduce complexity?

Prefer:

- built-in solutions
- free libraries
- minimal dependencies

---

# Firebase Cost Rules

The project should remain within free tiers whenever possible.

Avoid:

- unnecessary Firestore reads
- storing static content remotely
- excessive background operations
- unnecessary notifications

---

# Coding Style

Write code that is:

- readable
- maintainable
- predictable

Prefer:

- clear names
- small focused files
- simple logic

Avoid:

- clever solutions
- unnecessary patterns

---

# When Requirements Are Missing

Do not guess large features.

For unclear situations:

1. Check documentation.
2. Choose the simplest implementation.
3. Ask before introducing major changes.

---

# Before Completing A Task

Verify:

- code follows architecture
- feature works
- no unnecessary dependencies added
- offline requirements are respected
- documentation is still accurate

---

# Git Rules

Before major changes:

- keep commits focused
- do not commit secrets
- do not include Firebase configuration files

---

# Final Principle

Remember:

The goal is not the perfect architecture.

The goal is a finished SeoulMate application.

A simple finished feature is better than a perfect unfinished system.

Build the companion, not the framework.
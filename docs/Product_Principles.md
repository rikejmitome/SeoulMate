# SeoulMate Product Principles

## How we make decisions

Version: 1.0

Status: Active

---

# Purpose

This document defines the decision-making principles for SeoulMate.

Vision explains what SeoulMate is.

Product Principles explain how we decide what belongs in the application and how it should be built.

Every feature, technical decision, and design choice should be evaluated against these principles.

The goal is not to create the largest application.

The goal is to create the best possible Korean travel companion.

---

# Core Principles

---

# 1. Companion Over Tool

SeoulMate should feel like a personal travel companion, not a collection of unrelated utilities.

Features should support the emotional experience of the journey.

A feature is valuable when it helps users:

- prepare for Korea
- enjoy Korea
- remember Korea

Decision rule:

Before adding a feature, ask:

> "Does this make the journey feel easier, warmer, or more memorable?"

If not, the feature should be questioned.

---

# 2. Complete Over Perfect

A finished and reliable feature is better than an unfinished ambitious feature.

SeoulMate should prioritize:

- working functionality
- stability
- usability

over:

- unnecessary complexity
- endless refinement
- theoretical possibilities

Decision rule:

When choosing between two solutions:

Prefer the simpler solution that fully solves the user's problem.

---

# 3. Simplicity Over Complexity

Simple does not mean limited.

Simple means understandable, maintainable, and reliable.

Every feature should justify:

- development complexity
- maintenance cost
- user value

Decision rule:

A complex solution is acceptable only when it provides meaningful improvement over a simpler alternative.

---

# 4. Experience Over Technology

Technology exists to support the travel experience.

Users should never feel the architecture behind the application.

Decision rule:

Choose technology based on:

- reliability
- simplicity
- user benefit

not because it is new or technically impressive.

---

# 5. Personal Experience Over Public Product

SeoulMate is created for a private group of travelers.

The application does not need features designed for millions of users.

Decision rule:

Prioritize:

- shared experiences
- personal memories
- group collaboration

over:

- public profiles
- social networking
- unnecessary scalability

---

# 6. Offline Reliability

Travel conditions are unpredictable.

Important information should remain accessible even with poor connectivity.

Examples:

- itinerary
- saved places
- Korean phrases
- important travel information

Decision rule:

Critical travel information should have a reliable offline experience whenever practical.

---

# 7. Connect Existing Services Instead Of Replacing Them

SeoulMate should work together with specialized services.

It should not recreate solutions that already work well.

Examples:

Use:

- Google Maps
- Naver Maps
- Kakao Maps
- Kakao Taxi
- translation services

when they provide a better experience.

Decision rule:

Build the travel experience layer.

Do not rebuild existing infrastructure.

---

# 8. Meaningful Features Over Feature Quantity

A larger number of features does not automatically create a better application.

Every feature should have a clear purpose.

A feature can be valuable if it improves:

- preparation
- navigation
- communication
- memories
- group experience
- emotional connection

Decision rule:

Do not reject a feature because it is fun.

Reject features that do not provide enough value compared to their complexity.

---

# 9. Smart Use Of External Services

External services may improve SeoulMate.

However, they should be chosen carefully.

Priorities:

1. Free solutions
2. Open source solutions
3. Local solutions
4. Paid services only when clearly justified

Decision rule:

Before adding an external service, evaluate:

- Is there a free alternative?
- Is it necessary?
- Does the value justify the dependency?

---

# 10. Simple Gamification With Purpose

Gamification can improve motivation and memories when used correctly.

It should support the travel experience, not become the main purpose of the application.

Good examples:

- travel milestones
- visited places
- learned Korean phrases
- shared achievements
- memory collections

Avoid:

- unnecessary complexity
- artificial progression systems
- mechanics unrelated to travel

Decision rule:

Gamification should create emotional value, not additional management work.

---

# Feature Decision Framework

Before adding a new feature, ask:

## 1. Does it support the Korea journey?

Does it improve:

- preparation?
- daily travel?
- memories?

---

## 2. Does it fit the SeoulMate identity?

Does it make the application feel more like a Korean travel companion?

---

## 3. Will users realistically use it?

A theoretically interesting feature is not enough.

---

## 4. Is there a simpler solution?

Prefer simplicity when the result is similar.

---

## 5. Does the value justify the complexity?

Complex features are acceptable when they provide meaningful value.

---

# AI Development Rules

When working with Codex:

1. Follow existing documentation before creating new solutions.
2. Prefer simple and maintainable implementations.
3. Avoid unnecessary dependencies.
4. Avoid paid services unless explicitly justified.
5. Do not expand project scope without updating documentation.
6. When uncertain, choose the solution that best supports the user experience with the least complexity.

---

# Final Principle

SeoulMate is not built to be the biggest travel application.

It is built to be the best companion for one unforgettable Korean journey.

The goal is not fewer features.

The goal is meaningful features.
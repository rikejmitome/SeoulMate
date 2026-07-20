# SeoulMate Decisions

## Product and technical decision records

Version: 1.0

Status: Active

---

# Purpose

This document records important decisions made during SeoulMate development.

The purpose is to:

- preserve project direction
- prevent unnecessary complexity
- help Codex understand existing choices
- explain why certain alternatives were rejected

These decisions can change only when there is a clear improvement for the product.

---

# Decision Format

Each decision contains:

- Decision
- Reason
- Alternatives considered

---

# Decision 001

# Flutter As The Application Framework

## Decision

SeoulMate is built using Flutter.

---

## Reason

Flutter provides:

- single codebase
- fast development
- strong mobile support
- good UI capabilities
- compatibility with AI-assisted development

Flutter allows building a polished mobile application without maintaining separate iOS and Android codebases.

---

## Alternatives Considered

### Native iOS + Android

Rejected.

Reason:

- requires two codebases
- increases development effort

---

### React Native

Rejected.

Reason:

Flutter better matches the desired custom UI experience.

---

# Decision 002

# Firebase As Backend

## Decision

SeoulMate uses Firebase.

Services:

- Authentication
- Cloud Firestore
- Storage
- Cloud Messaging

---

## Reason

Firebase provides:

- fast implementation
- free tier suitable for private usage
- authentication
- offline Firestore support
- minimal backend maintenance

---

## Alternatives Considered

### Custom Backend

Rejected.

Reason:

- unnecessary complexity
- additional hosting
- more maintenance

---

# Decision 003

# Firestore Instead Of SQL Database

## Decision

Cloud Firestore is the primary database.

---

## Reason

SeoulMate data structure fits document-based storage.

Advantages:

- offline support
- simple synchronization
- easy Firebase integration

---

## Alternatives Considered

### PostgreSQL

Rejected.

Reason:

The project does not need complex relational queries.

---

# Decision 004

# Feature-Based Architecture

## Decision

The Flutter project uses feature-based organization.

---

## Reason

Features represent how users experience the application.

Examples:

- Trip
- Places
- Budget
- Korean Companion

This keeps development understandable for humans and AI agents.

---

## Alternatives Considered

### Pure Layer Architecture

Rejected.

Reason:

Can create unnecessary complexity for a small application.

---

# Decision 005

# Riverpod For State Management

## Decision

Riverpod is the only state management solution.

---

## Reason

Riverpod provides:

- modern Flutter approach
- predictable state handling
- good Firebase integration

---

## Alternatives Considered

### Bloc

Rejected.

Reason:

More structure than needed.

---

### Multiple State Solutions

Rejected.

Reason:

Creates inconsistency.

---

# Decision 006

# GoRouter For Navigation

## Decision

GoRouter manages application navigation.

---

## Reason

Provides:

- clear routes
- authentication redirects
- maintainable navigation

---

# Decision 007

# Freezed For Models

## Decision

Freezed is used for core data models.

---

## Reason

Provides:

- immutable models
- safer updates
- generated serialization

---

# Decision 008

# Private Group Model

## Decision

SeoulMate is designed for one private travel group.

---

## Reason

The application is not a public travel platform.

The priority is:

- simplicity
- shared experience
- reliability

---

## Alternatives Considered

### Public User System

Rejected.

Reason:

Not needed.

---

# Decision 009

# No Global Places Database

## Decision

Places belong to individual trips.

Structure:


Trip
└── Places


---

## Reason

SeoulMate is not:

- TripAdvisor
- Google Maps
- a travel marketplace

The application stores the group's journey, not the world's places.

---

## Alternatives Considered

### Global Location Database

Rejected.

Reason:

Creates unnecessary complexity.

---

# Decision 010

# Integrate Existing Map Services

## Decision

SeoulMate connects to:

- Google Maps
- Naver Maps
- Kakao Maps

It does not replace them.

---

## Reason

Existing Korean map services are already excellent.

SeoulMate should organize the journey around them.

---

## Alternatives Considered

### Building Own Maps

Rejected.

Reason:

Impossible value-to-complexity ratio.

---

# Decision 011

# Offline First Approach

## Decision

Important travel information works offline.

---

## Reason

Travel situations include:

- weak signal
- roaming issues
- underground transport
- unfamiliar environments

---

Offline priority:

- itinerary
- saved places
- dictionary
- documents
- checklist

---

# Decision 012

# Static Content Stored Locally

## Decision

Static content uses local assets.

Examples:

- Korean dictionary
- Korea guide
- food encyclopedia

---

## Reason

Benefits:

- offline availability
- no Firebase costs
- faster loading

---

## Alternatives Considered

### Firestore For Everything

Rejected.

Reason:

Creates unnecessary database usage.

---

# Decision 013

# Haechi As Emotional Identity

## Decision

Haechi is the SeoulMate companion.

---

## Reason

The application should feel personal.

Haechi represents:

- guidance
- protection
- Korean identity
- friendship

---

## Decision

Hybrid visual approach:

- premium 3D mascot
- 2D UI illustrations

---

# Decision 014

# AI Is Optional, Not Core Dependency

## Decision

SeoulMate must work without AI.

---

## Reason

Core travel functionality should not depend on:

- paid AI APIs
- external availability
- unpredictable costs

---

## Future Possibility

Haechi may become an AI companion if:

- free or affordable solution exists
- it provides real value

---

# Decision 015

# No Replacement Of Existing Travel Services

## Decision

SeoulMate complements existing applications.

It does not replace:

- Google Maps
- Naver Maps
- Kakao Maps
- Booking platforms
- translation tools

---

## Reason

Building replacements creates unnecessary complexity.

---

# Decision 016

# No Advertising

## Decision

SeoulMate contains no advertisements.

---

## Reason

The application is a private experience.

Ads would damage:

- trust
- emotional connection
- simplicity

---

# Decision 017

# Minimal Notifications

## Decision

Notifications must provide meaningful value.

Allowed:

- important reminders
- activities
- Haechi moments

Avoid:

- engagement spam
- unnecessary alerts

---

# Decision 018

# Simplicity Over Feature Count

## Decision

A smaller polished feature set is preferred over many unfinished features.

---

## Reason

The goal is:

A completed application used during a real Korea trip.

Not:

A large unfinished platform.

---

# Final Decision Principle

When choosing between:

More features

vs

Better execution

Choose better execution.

When choosing between:

Complex solution

vs

Simple reliable solution

Choose simple reliable solution.

SeoulMate succeeds by becoming a trusted companion for one unforgettable Korean journey.
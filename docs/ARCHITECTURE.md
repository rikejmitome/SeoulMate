# SeoulMate Architecture

## Flutter application architecture

Version: 1.0

Status: Active

---

# Purpose

This document defines the technical architecture of SeoulMate.

The goal is to provide Codex and developers with clear rules for building and maintaining the application.

The architecture should support:

- simple development
- reliable production usage
- offline functionality
- long-term maintainability
- clear separation of responsibilities

---

# Architecture Philosophy

## Simple Architecture Over Enterprise Architecture

SeoulMate is a private travel companion application.

It is not:

- a SaaS platform
- a social network
- a large-scale consumer product

The architecture should solve real problems, not hypothetical future problems.

---

# Core Architecture Principles

## 1. Feature First

The project should be organized around user features.

Examples:

- Trip
- Places
- Budget
- Korean Companion
- Documents
- Memories

Not around technical layers only.

---

## 2. Clear Responsibilities

Each part of the application has one responsibility.

UI:

Displays information and handles user interaction.

State:

Manages application state.

Repository:

Handles data access.

Services:

Integrate external systems.

---

## 3. Avoid Unnecessary Abstraction

Do not create abstractions without a real need.

Avoid:

- empty interfaces
- unnecessary wrappers
- duplicate models
- complex dependency systems

---

## 4. Offline Is A Requirement

The application must remain useful without reliable internet.

Architecture decisions should consider:

- cached data
- local assets
- delayed synchronization

---

# Technology Stack

## Framework

Flutter

---

## Language

Dart

---

## State Management

Riverpod

---

## Navigation

GoRouter

---

## Models

Freezed

---

## Backend

Firebase:

- Authentication
- Cloud Firestore
- Cloud Storage
- Cloud Messaging

---

# High-Level Architecture

The application follows a feature-based architecture with simple Clean Architecture principles.

Data flow:


User Interface

↓

Riverpod State

↓

Repository Layer

↓

Data Sources

↓

Firebase / Local Storage


---

# Project Structure

Recommended structure:


lib/

├── core/
│
├── shared/
│
├── features/
│
└── main.dart


---

# Core Folder

Purpose:

Contains application-wide functionality.

Example:


core/

├── routing/
├── theme/
├── constants/
├── errors/
├── utils/
├── services/


---

Contains:

- app configuration
- navigation
- theme
- common utilities
- shared services

---

# Shared Folder

Purpose:

Reusable components used across multiple features.

Example:


shared/

├── widgets/
├── models/
├── extensions/


---

Examples:

- buttons
- cards
- loading widgets
- common dialogs

---

# Features Folder

Main application structure.

Example:


features/

├── auth/

├── home/

├── trip/

├── places/

├── budget/

├── korean/

├── documents/

├── emergency/

├── memories/

└── settings/


---

# Feature Structure

Each feature should follow:


feature/

├── data/

├── domain/

└── presentation/


---

# Data Layer

Responsible for:

- Firebase communication
- local storage
- data mapping

Contains:

- repositories
- data sources
- DTO models

---

# Domain Layer

Contains business logic.

Examples:

- expense calculations
- achievement rules
- trip logic

---

Avoid putting business logic directly inside widgets.

---

# Presentation Layer

Contains:

- screens
- widgets
- Riverpod providers
- UI state

---

# Example Feature

Example:


places/

├── data/
│ ├── place_repository.dart
│
├── domain/
│ └── place.dart
│
└── presentation/
├── places_screen.dart
├── place_card.dart
└── providers.dart


---

# State Management

## Riverpod

Riverpod is the single state management solution.

Do not introduce:

- Provider package
- Bloc
- GetX
- other state systems

---

# Riverpod Responsibilities

Riverpod manages:

- async loading states
- application state
- dependency access
- reactive UI updates

---

# State Pattern

Preferred:


UI

↓

ConsumerWidget

↓

Provider

↓

Repository

↓

Data


---

# Navigation

## GoRouter

All navigation is handled through GoRouter.

---

Routes:


/login

/home

/trip

/places

/budget

/more

/korean

/documents

/emergency

/memories


---

# Navigation Principles

Avoid:

- manual navigation everywhere
- duplicated route definitions

---

# Authentication Flow


Application Start

↓

Check Authentication

↓

Authenticated?

YES
↓
Home

NO
↓
Login


---

# Firebase Architecture

Firebase should never be accessed directly from UI.

---

Incorrect:

```dart
FirebaseFirestore.instance
.collection()

inside widgets.

Correct:

Widget

↓

Provider

↓

Repository

↓

Firebase
Firebase Authentication

Used for:

user identity
private trip access

Authentication should remain simple.

No:

public profiles
social login requirements unless needed
Cloud Firestore

Used for:

Dynamic user data.

Examples:

trips
activities
places
expenses
memories
Firebase Storage

Used for:

photos
documents
user images
Firebase Cloud Messaging

Used only for meaningful notifications.

Examples:

upcoming activity
important reminder
Haechi message
Local Data

Static content should not depend on Firebase.

Stored locally:

assets/

Examples:

Korean dictionary
food encyclopedia
Korea guide
achievement definitions

Benefits:

offline support
faster loading
no unnecessary costs
Model Architecture

Use:

Freezed

for immutable models.

Examples:

User

Trip

Place

Activity

Expense

Memory

Models should support:

JSON serialization
Firestore conversion
copyWith
Repository Pattern

Repositories are the only access point to data.

Example:

PlaceRepository

TripRepository

ExpenseRepository

Responsibilities:

retrieve data
save data
combine local and remote sources

Repositories should not contain UI logic.

Offline Strategy

Offline support uses:

Firestore Offline Persistence

For:

trip data
places
activities
expenses
Local Assets

For:

dictionary
guides
static content
Local File Cache

For:

documents
important images
Synchronization

When connection returns:

The application should:

sync automatically
avoid duplicate writes
preserve user changes
Error Handling

All features should use a consistent approach.

States:

Loading

Success

Error

Recommended:

Riverpod AsyncValue.

Errors should be:

understandable
user friendly
actionable

Avoid showing technical errors.

Dependency Management

Keep dependencies minimal.

Before adding a package ask:

Does Flutter already solve this?
Is there a free alternative?
Does it reduce complexity?

Avoid unnecessary packages.

Testing Strategy

Testing should focus on important functionality.

Unit Tests

Required for:

expense calculations
voting logic
achievements
business rules
Widget Tests

Required for critical screens:

Home
Trip
Places
Korean Companion
Integration Tests

Only where valuable.

Do not create tests only for coverage numbers.

Environment Configuration

Support:

development

production

Used for:

Firebase configuration
environment variables
Coding Rules For Codex

Codex must:

Always:

follow existing architecture
reuse existing components
keep code simple
prefer readable solutions

Codex must not:

create new architecture patterns
add dependencies without approval
rewrite working systems
duplicate functionality
create unnecessary abstractions
Architecture Anti Patterns

Avoid:

Direct Firebase Calls In UI

Problem:

Creates tightly coupled code.

Giant Widgets

Problem:

Hard to maintain.

Over Engineering

Problem:

Adds complexity without value.

Too Many Layers

Problem:

Slows development.

Unnecessary Packages

Problem:

Creates maintenance burden.

Final Architecture Goal

The best architecture for SeoulMate is not the most advanced architecture.

It is the simplest architecture that allows a small team and AI coding agent to build a beautiful, reliable travel companion.

The architecture should disappear behind the experience.

Users should only see SeoulMate.
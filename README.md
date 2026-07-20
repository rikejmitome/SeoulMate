# SeoulMate 🇰🇷🐯

## A private Korean travel companion

Version: 1.0

---

# About SeoulMate

SeoulMate is a private Flutter mobile application created for a group of friends traveling through South Korea.

It is not a travel planner replacement.

It is a personal digital companion that helps travelers:

- prepare before the journey
- navigate daily experiences in Korea
- preserve memories after returning home

The goal is simple:

> Everything our group needs for Korea should exist in one beautiful, personal place.

---

# Project Purpose

During travel, important information is usually scattered across:

- chat conversations
- screenshots
- notes
- documents
- maps
- spreadsheets

SeoulMate creates one shared place for:

- plans
- places
- expenses
- documents
- Korean phrases
- memories

---

# Product Identity

SeoulMate is inspired by:

- modern Korean lifestyle
- Korean hospitality
- traditional symbolism
- simple premium design

The emotional companion of the application is Haechi (해치):

a modern interpretation of the Korean guardian creature that represents:

- guidance
- protection
- good fortune

---

# Main Features

Current application scope:

## Travel Planning

- shared itinerary
- daily activities
- saved places
- group voting

## Preparation

- travel checklist
- important documents
- emergency information

## During Travel

- Korean phrase companion
- expenses
- daily travel dashboard
- useful Korea information

## Memories

- photos
- travel statistics
- achievements

---

# Technology Stack

SeoulMate is built with:

## Frontend

- Flutter

## Backend

Firebase:

- Authentication
- Cloud Firestore
- Storage
- Cloud Messaging

## Architecture

- Riverpod
- GoRouter
- Freezed

---

# Project Structure


SeoulMate/

├── lib/
│
├── docs/
│ ├── 01_VISION.md
│ ├── 02_PRODUCT_PRINCIPLES.md
│ ├── 03_PRD.md
│ ├── 04_UX.md
│ ├── 05_STYLEGUIDE.md
│ ├── 06_DATABASE.md
│ ├── 07_ARCHITECTURE.md
│ ├── 08_SECURITY.md
│ ├── 09_DECISIONS.md
│ ├── 10_ROADMAP.md
│ ├── 11_TASKS.md
│ ├── 12_SETUP.md
│ └── 13_GLOSSARY.md
│
├── AGENTS.md
├── README.md
└── LICENSE


---

# Documentation

The documentation is the source of truth for development.

Important documents:

## Vision

Defines why SeoulMate exists.


docs/01_VISION.md


---

## Product Requirements

Defines what the application should do.


docs/03_PRD.md


---

## Architecture

Defines how the application is built.


docs/07_ARCHITECTURE.md


---

## AI Development Rules

Instructions for Codex:


AGENTS.md


---

# Setup

For development setup instructions see:


docs/12_SETUP.md


Basic flow:

```bash
flutter pub get

dart run build_runner build --delete-conflicting-outputs

flutter run
Development Principles

SeoulMate follows these principles:

Keep It Simple

A completed simple feature is better than an unfinished complex feature.

Companion Over Tool

The application should feel like a travel companion, not only a utility.

Private By Design

SeoulMate is created for a small private group.

No:

advertisements
public profiles
unnecessary social features
Offline First

Important travel information should remain available without reliable internet.

Development With AI

SeoulMate is developed with assistance from Codex.

AI development follows:

existing documentation
defined architecture
simple implementation choices

The goal is not to generate as much code as possible.

The goal is to create a reliable application.

License

This project is private software.

See:

LICENSE

for details.

Final Goal

SeoulMate should become:

Before Korea:

"Something amazing is coming."

During Korea:

"I am prepared."

After Korea:

"I will always remember this."

🇰🇷🐯
# SeoulMate Application Flow

## Complete application lifecycle and navigation

Version: 1.0

Status: Active

---

# Purpose

This document defines how users move through SeoulMate.

While the Product Requirements Document defines what the application does, this document defines how the application behaves.

The goal is to provide a complete navigation and state model that allows the application to be implemented consistently.

This document should eliminate ambiguity for developers and AI coding agents.

---

# Application Philosophy

Users should never wonder:

- Where am I?
- What should I do next?
- Why am I seeing this screen?

Every screen should naturally lead to the next action.

Navigation should feel effortless.

---

# Application Lifecycle

The entire application revolves around three travel phases.

Dream

↓

Adventure

↓

Memories

The current phase is determined automatically from the Trip dates.

---

# Phase 1 — Dream

Condition

Current date < Trip Start Date

Purpose

Preparation.

Primary focus

- excitement
- planning
- learning Korean
- organizing documents
- preparing checklist

Home Dashboard shows

- countdown
- preparation progress
- Haechi greeting
- checklist
- today's preparation

Quick Actions

- Checklist
- Korean Companion
- Documents
- Places

---

# Phase 2 — Adventure

Condition

Trip Start Date <= Current Date <= Trip End Date

Purpose

Daily travel companion.

Primary focus

- itinerary
- navigation
- expenses
- emergency
- Korean phrases

Home Dashboard shows

- today's schedule
- weather
- daily phrase
- today's expenses
- quick navigation

Quick Actions

- Maps
- Emergency
- Budget
- Dictionary

---

# Phase 3 — Memories

Condition

Current date > Trip End Date

Purpose

Preserve memories.

Primary focus

- photos
- visited places
- statistics
- achievements

Home Dashboard shows

- memories
- photo highlights
- trip statistics
- achievements
- favorite places

Quick Actions

- Memories
- Statistics
- Photo Journal

---

# Startup Flow

Application Launch

↓

Initialize Flutter

↓

Initialize Firebase

↓

Load Local Cache

↓

Check Authentication

↓

Authenticated?

YES

↓

Load User

↓

Load Trip

↓

Determine Current Phase

↓

Open Home

NO

↓

Login

---

# Authentication Flow

Launch

↓

Login Screen

↓

Email / Password

↓

Authentication Success

↓

Load User

↓

Trip Exists?

YES

↓

Home

NO

↓

Create Trip

Authentication Failure

↓

Display Error

↓

Retry

---

# Trip Creation Flow

User Profile

↓

Create Trip

↓

Trip Information

- Name
- Destination
- Dates

↓

Create Firestore Documents

↓

Become First Member

↓

Home Dashboard

---

# Main Navigation

Bottom Navigation

HOME

TRIP

PLACES

BUDGET

MORE

Navigation should always preserve user state.

Changing tabs should never recreate completed forms.

---

# Home Flow

Home adapts automatically.

Dream

↓

Preparation Dashboard

Adventure

↓

Travel Dashboard

Memories

↓

Memory Dashboard

The user never manually switches modes.

---

# Trip Flow

Trip

↓

Select Day

↓

Activities

↓

Activity Detail

↓

Edit Activity

↓

Save

↓

Return

---

# Places Flow

Places

↓

Categories

↓

Place

↓

Actions

- Save
- Vote
- Add To Trip
- Open Maps

---

# Korean Companion Flow

Dictionary

↓

Category

↓

Phrase

↓

Audio

↓

Favorite

↓

Learning Progress

---

# Budget Flow

Budget

↓

Expenses

↓

Expense Detail

↓

Add Expense

↓

Split Between Members

↓

Balance Updated

---

# Documents Flow

Documents

↓

Category

↓

Document

↓

Preview

↓

Download

---

# Emergency Flow

Emergency

↓

Emergency Numbers

Embassy

Hospitals

Emergency Korean

Everything should remain available offline whenever possible.

---

# Memories Flow

Memories

↓

Timeline

↓

Memory

↓

Photos

↓

Notes

↓

Favorite

---

# Settings Flow

Settings

↓

Profile

↓

Notifications

↓

Offline Data

↓

About

---

# Offline Flow

Application detects connection loss.

↓

Show Offline Banner

↓

Continue Using Cached Data

↓

Queue Local Changes

↓

Connection Restored

↓

Synchronize

↓

Hide Banner

The application should remain useful during poor connectivity.

---

# Notification Flow

Push Notification

↓

Open Application

↓

Determine Notification Type

↓

Navigate To Related Screen

Examples

Expense

↓

Budget

Activity Reminder

↓

Trip

Memory

↓

Memories

---

# Error Recovery Flow

Unexpected Error

↓

Display Friendly Error

↓

Retry

↓

If Retry Fails

↓

Return To Previous Stable Screen

The application should never crash to a blank screen.

---

# Global Navigation Rules

Every screen should provide

- clear title
- obvious primary action
- consistent back navigation
- loading state
- error state
- empty state when applicable

Important actions should require no more than three taps.

---

# Screen Access Rules

| Screen | Login | Trip | Offline | Editable |
|---------|-------|------|----------|----------|
| Home | Yes | Yes | Partial | No |
| Trip | Yes | Yes | Yes | Yes |
| Places | Yes | Yes | Yes | Yes |
| Budget | Yes | Yes | Yes | Yes |
| Korean Companion | No | No | Yes | No |
| Documents | Yes | Yes | Partial | Yes |
| Emergency | No | No | Yes | No |
| Memories | Yes | Yes | Partial | Yes |
| Settings | Yes | No | Partial | Yes |

---

# State Transitions

Application state changes automatically.

No Trip

↓

Dream

↓

Adventure

↓

Memories

↓

Dream (New Trip)

The user never manually changes the application mode.

---

# Codex Implementation Notes

Always implement features vertically.

Model

↓

Repository

↓

Provider

↓

Screen

↓

Testing

Never build screens without underlying data models.

Never introduce navigation that bypasses authentication or trip validation.

Never create alternative user flows unless explicitly documented.

When multiple implementation options exist, choose the simplest solution that satisfies this document.

The goal is a reliable, intuitive, and maintainable application rather than a technically impressive one.
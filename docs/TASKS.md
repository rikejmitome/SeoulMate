# SeoulMate Tasks

## Implementation checklist

Version: 1.0

Status: Active

---

# Purpose

This document defines the implementation tasks required to build SeoulMate.

The purpose is to provide Codex with a clear development order.

Tasks should be completed sequentially unless dependencies allow parallel work.

---

# Task Philosophy

## Build Foundation First

The correct order is:

1. Project foundation
2. Data architecture
3. Core features
4. Travel experience
5. Emotional polish

---


# Implementation Phases

| Phase | Goal | Main Tasks |
|--------|------|------------|
| Foundation | Project setup | TASK-001 – TASK-003 |
| Authentication | User management | TASK-010 – TASK-021 |
| Core Application | Navigation, Trip & Places | TASK-030 – TASK-061 |
| Travel Features | Checklist, Documents, Emergency | TASK-070 – TASK-090 |
| Korean Companion | Offline language support | TASK-100 – TASK-101 |
| Budget | Shared expenses | TASK-110 – TASK-111 |
| Experience | Memories, Achievements, Haechi | TASK-120 – TASK-140 |
| Release | Offline verification & Production | TASK-150 – TASK-161 |

---

# Task Status

Possible statuses:


TODO
IN PROGRESS
DONE
BLOCKED


---

# Epic 1 — Project Foundation

Priority:

CRITICAL

---

## TASK-001

## Create Flutter Project Structure

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
None

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Flutter project structure ready.

---

Requirements:

Create:

- Flutter application
- recommended folder structure
- feature-based architecture
- development configuration

---

Definition of Done:

- project runs successfully
- structure matches Architecture document

---

## TASK-002

## Configure Firebase

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-001

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Firebase configured.

---

Requirements:

Setup:

- Firebase Authentication
- Cloud Firestore
- Storage
- Cloud Messaging

---

Definition of Done:

- Firebase connected
- application can communicate with Firebase

---

## TASK-003

## Setup Core Packages

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-001

Estimated Complexity:
Low

MVP:
Yes

Deliverable:
Core packages configured.

---

Install and configure:

- Riverpod
- GoRouter
- Freezed

---

Definition of Done:

Packages configured and used correctly.

---

# Epic 2 — Authentication

Priority:

CRITICAL

---

## TASK-010

## User Authentication

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-002, TASK-003

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Authentication working.

---

Implement:

- registration
- login
- logout
- authentication state

---

Definition of Done:

User can securely access the application.

---

## TASK-011

## User Profile

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-010

Estimated Complexity:
Low

MVP:
Yes

Deliverable:
User profile available.

---

Implement:

- display name
- profile information

---

Definition of Done:

User identity appears correctly.

---

# Epic 3 — Private Trip System

Priority:

CRITICAL

---

## TASK-020

## Trip Model

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-010

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Trip model implemented.

---

Implement:

Trip entity:

- name
- destination
- dates
- members

---

Definition of Done:

Trip can be created and stored.

---

## TASK-021

## Trip Membership

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Private trip membership.

---

Implement:

- adding users
- membership validation
- private access

---

Definition of Done:

Only trip members can access trip data.

---

# Epic 4 — Application Navigation

Priority:

CRITICAL

---

## TASK-030

## Main Navigation

Status:

DONE

Priority:
AUTO (inherits Epic)

Depends On:
TASK-010, TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Main navigation working.

---

Create:

- Home
- Trip
- Places
- Budget
- More

---

Definition of Done:

Navigation works consistently.

---

# Epic 5 — Home Dashboard

Priority:

HIGH

---

## TASK-040

## Before Trip Home

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020, TASK-030

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Pre-trip dashboard.

---

Display:

- countdown
- preparation progress
- Haechi greeting
- important information

---

Definition of Done:

Home feels like the emotional center of preparation.

---

## TASK-041

## During Trip Home

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020, TASK-030, TASK-051

Estimated Complexity:
High

MVP:
Yes

Deliverable:
Travel dashboard.

---

Display:

- today's schedule
- phrase of the day
- Haechi message

---

Definition of Done:

Home adapts during travel.

---

# Epic 6 — Trip Timeline

Priority:

CRITICAL

---

## TASK-050

## Create Trip Days

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Trip days.

---

Implement:

- days
- ordering
- dates

---

## TASK-051

## Create Activities

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-050

Estimated Complexity:
High

MVP:
Yes

Deliverable:
Activities.

---

Implement:

Activities contain:

- title
- time
- location
- notes
- participants

---

Definition of Done:

Group can create complete daily itinerary.

---

# Epic 7 — Places

Priority:

CRITICAL

---

## TASK-060

## Place Database

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Places DB.

---

Implement:

Place:

- name
- Korean name
- category
- address
- map links
- notes

---

## TASK-061

## Group Voting

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-060

Estimated Complexity:
Low

MVP:
Yes

Deliverable:
Voting.

---

Implement:

- want
- maybe
- skip

---

Definition of Done:

Group can decide places together.

---

# Epic 8 — Checklist

Priority:

HIGH

---

## TASK-070

## Travel Checklist

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020

Estimated Complexity:
Low

MVP:
Yes

Deliverable:
Checklist.

---

Implement:

- categories
- completion
- personal items
- shared items

---

Definition of Done:

Travel preparation can happen inside SeoulMate.

---

# Epic 9 — Documents

Priority:

HIGH

---

## TASK-080

## Document Storage

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-002, TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Offline docs.

---

Implement:

Upload:

- PDFs
- images

Categories:

- flights
- hotels
- tickets
- insurance

---

Definition of Done:

Important documents are accessible offline.

---

# Epic 10 — Emergency Center

Priority:

HIGH

---

## TASK-090

## Emergency Information

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-030

Estimated Complexity:
Low

MVP:
Yes

Deliverable:
Emergency center.

---

Implement:

Emergency section containing:

- emergency numbers
- embassy information
- hospitals
- important Korean emergency phrases

---

Definition of Done:

Users can quickly access emergency help.

---

# Epic 11 — Korean Companion

Priority:

CRITICAL

---

## TASK-100

## Korean Phrase Database

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-003

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Phrase DB.

---

Implement local database containing:

- Hangul
- romanization
- Czech pronunciation
- meaning
- category

---

## TASK-101

## Audio Support

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-100

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Audio phrases.

---

Implement:

- phrase audio playback

---

Definition of Done:

Users can use Korean phrases offline.

---

# Epic 12 — Budget

Priority:

CRITICAL

---

## TASK-110

## Expense Tracking

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-020

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Expenses.

---

Implement:

- expense creation
- categories
- payer
- participants

---

## TASK-111

## Balance Calculation

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-110

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Balances.

---

Implement:

- who paid
- who owes
- group balance

---

Definition of Done:

Group can track travel spending.

---

# Epic 13 — Memories

Priority:

MEDIUM

---

## TASK-120

## Photo Journal

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-051

Estimated Complexity:
Medium

MVP:
No

Deliverable:
Photo journal.

---

Implement:

- photos
- captions
- dates
- locations

---

## TASK-121

## Travel Statistics

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-120

Estimated Complexity:
Low

MVP:
No

Deliverable:
Statistics.

---

Display:

- photos count
- visited places
- distance
- memories

---

# Epic 14 — Achievements

Priority:

MEDIUM

---

## TASK-130

## Achievement System

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-120, TASK-121

Estimated Complexity:
Low

MVP:
No

Deliverable:
Achievements.

---

Implement:

- achievement definitions
- progress tracking
- completion states

---

# Epic 15 — Haechi Companion

Priority:

MEDIUM

---

## TASK-140

## Haechi Integration

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-040, TASK-041

Estimated Complexity:
Low

MVP:
No

Deliverable:
Haechi integration.

---

Implement:

Haechi appearances:

- welcome
- milestones
- empty states
- achievements

---

Definition of Done:

Haechi adds emotional identity without becoming a complex system.

---

# Epic 16 — Offline Support

Priority:

CRITICAL

---

## TASK-150

## Offline Verification

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-060, TASK-080, TASK-100

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Offline verified.

---

Test:

- itinerary
- places
- dictionary
- documents
- checklist

---

Definition of Done:

Application remains useful without internet.

---

# Epic 17 — Testing And Release

Priority:

CRITICAL

---

## TASK-160

## Application Testing

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
All MVP tasks

Estimated Complexity:
High

MVP:
Yes

Deliverable:
Application tested.

---

Verify:

- authentication
- navigation
- Firebase rules
- offline behavior
- core features

---

## TASK-161

## Production Preparation

Status:

TODO

Priority:
AUTO (inherits Epic)

Depends On:
TASK-160

Estimated Complexity:
Medium

MVP:
Yes

Deliverable:
Production build.

---

Prepare:

- icons
- splash screen
- release configuration

---

# Definition Of Done

A feature is complete when:

- implemented
- tested
- works offline if required
- follows architecture rules
- does not introduce unnecessary complexity

---

# Final Task Principle

The goal is not to create many tasks.

The goal is to create a clear path from empty Flutter project to a finished SeoulMate application.

Every completed task should move the project closer to a real Korean travel companion.

---

# Implementation Rules for Codex

Codex should implement every feature vertically:

Model → Repository → Provider → UI → Tests

Rules:

- Never implement UI before the data model exists.
- Always respect task dependencies.
- Finish CRITICAL tasks before HIGH, MEDIUM and LOW.
- Reuse existing architecture and components.
- A task is DONE only after all Definition of Done requirements are satisfied.

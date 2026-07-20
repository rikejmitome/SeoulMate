# SeoulMate UX Guidelines

## Designing a personal Korean travel companion

Version: 1.0

Status: Active

---

# Purpose

This document defines how users should experience SeoulMate.

The Product Requirements Document defines what SeoulMate does.

This document defines:

- how users interact with the application
- how information is presented
- how user journeys work
- what emotional experience the application should create

The goal is to create an application that feels like a personal travel companion, not a traditional travel management tool.

---

# UX Philosophy

## Emotional Utility

Every feature should provide two types of value.

---

## Practical Value

The application helps users complete tasks.

Examples:

- finding a restaurant
- checking today's schedule
- opening a travel document
- using a Korean phrase
- tracking expenses

---

## Emotional Value

The application strengthens the connection with the journey.

Examples:

- seeing the countdown
- receiving a Haechi message
- discovering memories
- celebrating milestones

A feature that provides only information should be questioned.

A feature that provides both usefulness and emotion represents the SeoulMate experience.

---

# Core UX Principles

---

# 1. Companion Over Tool

SeoulMate should feel like a travel companion.

The user should feel:

"SeoulMate is helping me through this journey."

The application should not feel like:

- a spreadsheet
- a database
- a booking system
- an administrative tool

---

# 2. Context Over Information

The application should show the right information at the right moment.

Before Korea:

Focus on:

- preparation
- excitement
- learning

During Korea:

Focus on:

- today's adventure
- quick access
- confidence

After Korea:

Focus on:

- memories
- reflection
- nostalgia

---

# 3. Simplicity First

Every screen should answer:

"What do I need right now?"

Avoid:

- unnecessary options
- complicated navigation
- information overload

---

# 4. Progressive Disclosure

Users should see important information first.

Additional details should appear only when needed.

Example:

Place card:

First view:

- photo
- name
- category
- location

Expanded:

- opening hours
- price
- notes
- recommendations

---

# 5. Mobile First

SeoulMate is designed for smartphone usage.

During travel users may:

- stand in a street
- use one hand
- have limited time
- have poor internet connection

Important actions must be fast and accessible.

---

# User Journey

SeoulMate follows three emotional phases.

---

# Phase 1 — Dream

## Before Korea

The user is preparing for the adventure.

The application should create:

"Something amazing is coming."

---

Main UX goals:

- build excitement
- organize preparation
- reduce uncertainty

---

Important experiences:

- countdown
- Haechi greetings
- checklist progress
- discovering places
- learning Korean phrases

---

# Phase 2 — Adventure

## During Korea

The application becomes a daily companion.

The user should feel:

"I know what to do."

---

Main UX goals:

- provide confidence
- reduce stress
- give fast access to information

---

Important experiences:

- today's schedule
- weather context
- Korean dictionary
- emergency access
- saved places
- expenses

---

# Phase 3 — Memories

## After Korea

The application becomes a digital scrapbook.

The user should feel:

"I want to experience Korea again."

---

Main UX goals:

- preserve memories
- visualize the journey
- encourage reflection

---

Important experiences:

- photos
- statistics
- achievements
- visited places

---

# Navigation Structure

Main navigation:


HOME
TRIP
PLACES
BUDGET
MORE


---

# Navigation Principles

The main navigation should remain simple.

Users should not need to search for important features.

---

# HOME

Purpose:

The emotional center of SeoulMate.

The first screen users open.

---

# TRIP

Purpose:

Manage the journey timeline.

Contains:

- days
- activities
- schedule
- memories

---

# PLACES

Purpose:

Discover and manage places.

Contains:

- restaurants
- cafés
- attractions
- saved locations

---

# BUDGET

Purpose:

Track shared expenses.

Contains:

- expenses
- balances
- spending overview

---

# MORE

Purpose:

Contains secondary features.

Examples:

- Korean Companion
- Documents
- Emergency
- Korea Guide
- Food Guide
- Settings

---

# Home Experience

Home changes based on the journey phase.

---

# Before Trip Home

Purpose:

Create excitement and support preparation.

---

Main components:

## Haechi Greeting

Example:

"Annyeong Tomáš!
Your Korean adventure is getting closer."

---

## Countdown

Displays:

- departure date
- days remaining

---

## Preparation Progress

Displays:

- checklist completion
- documents status
- planned places
- learned phrases

---

## Today's Preparation

Shows recommended actions.

Examples:

- complete checklist item
- review saved restaurant
- learn phrase

---

# During Trip Home

Purpose:

Become the user's daily travel assistant.

---

Main components:

## Haechi Greeting

Example:

"Good morning!
Ready for today's Seoul adventure?"

---

## Weather Context

Displays:

- location
- temperature
- conditions

May provide simple advice.

Example:

"Rain expected this afternoon. Consider visiting indoor places first."

---

## Today's Schedule

Displays:

- upcoming activities
- times
- locations

---

## Daily Korean Phrase

Displays:

- Hangul
- pronunciation
- meaning

---

## Quick Actions

Important shortcuts:

- Korean Companion
- Documents
- Emergency
- Maps
- Budget

---

# After Trip Home

Purpose:

Create emotional reflection.

---

Displays:

- photos
- visited places
- statistics
- achievements

---

# Core User Flows

---

# First Launch

Goal:

Create immediate emotional connection.

Flow:

1. Welcome screen
2. Haechi introduction
3. Create or join private trip
4. Enter traveler information
5. Open Home

---

The user should understand:

"What is SeoulMate?"

within the first minute.

---

# Planning a Trip Day

Flow:

1. Open Trip
2. Select day
3. Add activity
4. Select location
5. Add notes
6. Save

---

# Adding a Place

Flow:

1. Open Places
2. Create or save place
3. Add information
4. Group votes
5. Place becomes part of shared journey

---

# Using Korean Companion

Flow:

1. Open Korean Companion
2. Select category
3. Choose phrase
4. Read pronunciation
5. Play audio
6. Use in real situation

---

# Emergency Flow

Emergency situations require minimum steps.

Flow:

1. Open Emergency
2. Select problem
3. View instructions
4. Access important contacts
5. Use Korean emergency phrase

---

Emergency access must always be visible from Home.

---

# Adding Memory

Flow:

1. Open memory/journal
2. Select day
3. Add photo
4. Add note
5. Attach location

---

# Haechi UX Rules

Haechi represents the emotional identity of SeoulMate.

---

# Haechi Should Be

- friendly
- warm
- supportive
- memorable
- subtle

---

# Haechi Should Not Be

- intrusive
- constantly animated
- distracting
- a replacement for navigation

---

# Haechi Appears In

## Onboarding

Introducing SeoulMate.

---

## Milestones

Examples:

- first Korean phrase learned
- first place visited
- trip completion

---

## Empty States

Example:

"No saved places yet.
Let's discover Korea together."

---

## Tips

Examples:

- cultural advice
- travel reminders

---

# Haechi AI Possibility

Haechi may become an AI-powered companion in the future.

However:

AI is not required for the core experience.

The personality of Haechi must work even without AI.

---

# Empty States

Empty states should feel helpful, not empty.

Avoid:

"No data available."

Prefer:

"Your Korean adventure starts here.
Save your first place."

---

Examples:

## Empty Places

"Discover restaurants, cafés and hidden gems."

---

## Empty Memories

"Your first Korean memory is waiting."

---

## Empty Budget

"No expenses yet.
Your journey is about to begin."

---

# Loading States

Loading should feel calm and consistent.

Avoid:

- technical messages
- confusing states

Prefer:

- simple progress indicators
- Haechi presence when appropriate

---

# Error States

Errors should be understandable.

Avoid:

- technical errors
- developer terminology

Example:

Instead of:

"Firestore connection failed."

Use:

"SeoulMate cannot connect right now.
Some information may be unavailable."

---

# Offline UX

Offline is an important travel requirement.

---

Users should clearly understand:

Available offline:

- itinerary
- saved places
- Korean phrases
- documents
- checklist
- emergency information

---

When offline:

The application should:

- continue working where possible
- avoid unnecessary error messages
- synchronize automatically when connection returns

---

# Accessibility

The application should support:

- readable text sizes
- clear contrast
- understandable icons
- large enough touch targets

---

# UX Priorities

## Priority 0 — Essential Experience

Must feel excellent.

Includes:

- Home
- Trip
- Places
- Korean Companion
- Documents
- Emergency

---

## Priority 1 — Core Travel Support

Includes:

- Budget
- Checklist
- Weather context
- Group collaboration

---

## Priority 2 — Emotional Layer

Includes:

- Memories
- Achievements
- Advanced Haechi interactions

---

# UX Anti Patterns

SeoulMate should avoid:

---

## Information Dumping

Do not show too much information at once.

---

## Copying Existing Apps

Do not recreate:

- Google Maps
- Booking
- Google Translate

---

## Unnecessary Complexity

Do not add features because they are technically possible.

---

## Gamification Without Meaning

Achievements should celebrate the journey.

They should not feel like a game.

---

## AI Without Purpose

AI should solve real problems.

It should not exist only because it is possible.

---

# Final UX Goal

Opening SeoulMate should create a specific feeling.

Before Korea:

"Something amazing is coming."

During Korea:

"I am prepared."

After Korea:

"I will always remember this."

SeoulMate should feel less like an application.

It should feel like a companion that traveled with you.
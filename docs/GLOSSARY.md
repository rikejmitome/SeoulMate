# SeoulMate Glossary

## Project terminology reference

Version: 1.0

Status: Active

---

# Purpose

This document defines the official terminology used in SeoulMate.

The goal is to keep communication consistent between:

- product decisions
- UX design
- Flutter implementation
- Codex development

---

# SeoulMate

## Definition

SeoulMate is a private Korean travel companion application.

It helps a small group of travelers:

- prepare their journey
- experience Korea
- preserve memories

---

# Trip

## Definition

A Trip represents one complete journey.

Example:

"Korea Adventure 2026"

A Trip contains:

- members
- days
- activities
- places
- expenses
- documents
- memories

---

# Traveler

## Definition

A user participating in a Trip.

All travelers have equal permissions.

There are no:

- admins
- moderators

---

# Trip Mode

## Definition

The application behavior changes depending on the travel phase.

Three modes exist:

---

## Dream Mode

Before departure.

Purpose:

Create excitement and prepare the journey.

Examples:

- countdown
- checklist
- saved places
- Korean learning

---

## Adventure Mode

During the Korea trip.

Purpose:

Support everyday travel.

Examples:

- daily schedule
- Korean phrases
- navigation
- expenses

---

## Memories Mode

After returning home.

Purpose:

Preserve the experience.

Examples:

- photos
- statistics
- achievements

---

# Haechi

## Definition

The emotional companion of SeoulMate.

Inspired by the Korean mythical creature Haechi (해치).

Represents:

- guidance
- protection
- good fortune
- friendship

---

# Haechi Role

Haechi is:

- an emotional guide
- a visual companion
- a personality layer

Haechi is not:

- the main application logic
- a required AI dependency

---

# Korean Companion

## Definition

The Korean language assistant module.

Designed specifically for Czech travelers.

---

Each phrase contains:

- Hangul
- Romanization
- Czech pronunciation
- Meaning
- Audio

---

# Phrase

## Definition

A single Korean language entry.

Example:


감사합니다

Gamsahamnida

Kamsahamnida

Thank you


---

# Place

## Definition

A location saved by the travel group.

Examples:

- restaurant
- café
- palace
- shop
- park

---

A Place contains:

- name
- Korean name
- category
- location
- map links
- notes
- voting

---

# Activity

## Definition

A planned or completed event inside the itinerary.

Examples:

- visit Gyeongbokgung Palace
- lunch
- shopping
- café visit

---

Difference:

Place:

"Where?"

Activity:

"What are we doing?"

---

Example:

Place:


Gyeongbokgung Palace


Activity:


Visit Gyeongbokgung Palace
10:00


---

# Day

## Definition

One calendar day inside a Trip.

Contains:

- activities
- schedule
- memories

---

# Expense

## Definition

A shared travel cost.

Examples:

- restaurant
- transport
- tickets

Contains:

- amount
- currency
- payer
- participants

---

# Checklist

## Definition

A preparation list.

Types:

## Shared Checklist

Tasks for the whole group.

Example:

Book hotel.

---

## Personal Checklist

Tasks for one traveler.

Example:

Pack medicine.

---

# Document

## Definition

Important travel file.

Examples:

- flight ticket
- hotel confirmation
- insurance
- reservation

---

# Memory

## Definition

A saved moment from the journey.

Examples:

- photo
- caption
- location
- story

---

# Achievement

## Definition

An emotional milestone representing travel experiences.

Examples:

- First Korean Meal
- Seoul Survivor
- Cafe Explorer

Achievements exist to create memories, not competition.

---

# Korea Guide

## Definition

Static educational content about South Korea.

Examples:

- transport tips
- cultural etiquette
- practical advice

---

# Food Encyclopedia

## Definition

Static Korean food reference.

Contains:

- Korean name
- pronunciation
- description
- spice level
- price level

---

# Emergency Center

## Definition

A quick access section for important situations.

Contains:

- emergency numbers
- embassy information
- hospitals
- emergency Korean phrases

---

# Offline First

## Definition

Important information remains available without internet.

Priority offline content:

- itinerary
- saved places
- dictionary
- documents
- checklist

---

# Companion Over Tool

## Definition

The main product philosophy.

SeoulMate should feel like a travel companion, not just a utility application.

---

# Single Source Of Truth

## Definition

SeoulMate becomes the central place for the group's travel information.

Instead of searching:

- chat messages
- notes
- screenshots

users check SeoulMate.

---

# Feature

## Definition

A complete user-facing capability.

Examples:

- Budget
- Places
- Korean Companion

---

# Module

## Definition

A larger application section containing related features.

Example:

Trip Module:

- days
- activities
- schedule

---

# Core Feature

## Definition

A feature required for the application to fulfill its main purpose.

Examples:

- Trip timeline
- Places
- Budget
- Korean Companion

---

# Nice To Have

## Definition

A feature that improves experience but is not required for the application to work.

Examples:

- advanced animations
- additional Haechi interactions

---

# Anti-Goal

## Definition

Something SeoulMate intentionally does not become.

Examples:

- social network
- TripAdvisor replacement
- booking platform
- map application

---

# Final Terminology Rule

When adding new features:

Use existing terminology whenever possible.

Do not create new names for existing concepts.

Consistency is more important than creativity.
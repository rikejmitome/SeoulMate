# SeoulMate Product Requirements Document

## A private Korean travel companion

Version: 1.0

Status: Active

---

# Purpose

This document defines what SeoulMate should do.

The Vision explains why SeoulMate exists.

The Product Principles explain how decisions are made.

This document defines the product experience, core features, and functional requirements.

The goal is to create a complete and reliable travel companion for a group of friends traveling through South Korea.

---

# Product Overview

## Product Name

SeoulMate

---

## Product Type

Private mobile travel companion application.

---

## Purpose

SeoulMate helps travelers prepare for South Korea, enjoy their journey while traveling, and preserve their memories afterwards.

The application connects:

- planning
- travel information
- communication
- group decisions
- memories

into one personal travel experience.

SeoulMate does not replace existing specialized services.

It connects them into a single journey.

---

# Target Users

Primary users:

A private group of approximately four friends traveling through South Korea.

All users have equal permissions.

There are:

- no admins
- no moderators
- no public profiles
- no social network features

---

# Core User Problems

Before SeoulMate, travel information is usually scattered across:

- messaging apps
- notes
- spreadsheets
- screenshots
- booking emails
- maps

Common problems:

"Where is our hotel information?"

"Which restaurant did we want to visit?"

"Who paid for dinner?"

"What are we doing today?"

"How do I say this in Korean?"

SeoulMate becomes the single source of truth for the journey.

---

# Application Structure

Main navigation:

- HOME
- TRIP
- PLACES
- BUDGET
- MORE

---

# 1. Home Dashboard

## Purpose

The emotional center of SeoulMate.

The first screen users open.

The dashboard changes depending on the travel phase.

---

# Before Korea

The dashboard creates excitement and helps preparation.

Features:

## Countdown

Displays:

- trip date
- days remaining
- Haechi message

---

## Preparation Progress

Shows important preparation status:

Examples:

- documents completed
- checklist progress
- saved places
- planned activities
- learned Korean phrases

---

## Today's Preparation

Personal preparation suggestions.

Examples:

- complete checklist item
- review saved restaurant
- learn Korean phrase

---

# During Korea

The dashboard becomes a daily travel companion.

Features:

## Today's Schedule

Displays:

- activities
- times
- locations
- quick navigation

---

## Weather Context

Displays:

- current weather
- temperature
- rain forecast

Can provide simple travel suggestions.

Example:

"Rain expected today. Consider visiting the museum first."

---

## Daily Korean Phrase

Displays a useful phrase:

- Hangul
- pronunciation
- meaning

---

## Haechi Daily Tip

Examples:

- cultural tips
- travel advice
- reminders

---

## Quick Actions

Fast access to:

- dictionary
- emergency
- documents
- maps
- expenses

---

# After Korea

The dashboard becomes a memory overview.

Displays:

- photos
- visited places
- statistics
- achievements

---

# 2. Trip Planner

## Purpose

Manage the complete timeline of the Korean journey.

---

# Trip Structure

Trip contains:

Days

↓

Activities

↓

Locations

↓

Memories

---

# Day

Contains:

- date
- title
- summary
- activities

---

# Activity

Contains:

- title
- time
- location
- category
- notes
- participants
- photos
- completion status

---

Actions:

Users can:

- create
- edit
- complete
- comment
- navigate
- attach memories

---

# Smart Itinerary Assistance

SeoulMate can help organize the journey.

Examples:

- suggest grouping nearby places
- detect unrealistic schedules
- suggest better order of activities

The goal is assistance, not automatic replacement of human planning.

---

# 3. Places Module

## Purpose

Shared database of places worth visiting.

---

Categories:

- Restaurants
- Cafés
- Culture
- Shopping
- Nature
- Nightlife
- Experiences
- Hidden Gems

---

# Place Information

Each place contains:

## Basic Information

- name
- Korean name
- category
- description
- photos

---

## Location

- address
- Korean address
- map links

Supported:

- Google Maps
- Naver Maps
- Kakao Maps

---

## Travel Information

- price level
- opening hours
- recommended duration
- best visiting time
- reservation requirement

---

## Group Decision

Users can vote:

❤️ Want to visit

🤔 Maybe

❌ Skip

---

## Personal Notes

Users can add:

- reasons
- recommendations
- comments

---

# 4. Korean Companion

## Signature Feature

A practical Korean communication assistant.

The goal is real communication during travel.

---

# Phrase Categories

## Basic Korean

Examples:

- hello
- thank you
- sorry
- yes/no
- excuse me

---

## Restaurant Korean

Examples:

- ordering food
- asking about ingredients
- allergies
- payment

---

## Shopping Korean

Examples:

- price
- size
- trying items

---

## Transport Korean

Examples:

- stations
- taxi
- directions

---

## Emergency Korean

Examples:

- help
- hospital
- police
- lost documents

---

# Phrase Structure

Each phrase contains:

- Hangul
- Romanization
- Czech-friendly pronunciation
- Meaning
- Audio pronunciation

---

# Personal Dictionary

Users can:

- save favorites
- track learned phrases
- access recently used phrases

---

# 5. Emergency Center

## Purpose

Provide confidence and quick access during unexpected situations.

---

# Emergency Contacts

Contains:

- Korean emergency numbers
- Czech embassy information
- insurance contact
- hotel contact
- personal emergency contacts

---

# Emergency Information

Guides for:

- lost passport
- lost phone
- medical problems
- stolen items

---

# Emergency Korean

Quick access phrases:

- I need help
- I do not speak Korean
- I need a doctor
- Please call the police

---

# 6. Documents

## Purpose

Store important travel information.

---

Supported:

- PDF
- images

---

Categories:

## Personal Documents

- passport
- insurance
- identification

## Transport

- flights
- boarding passes

## Accommodation

- hotels
- reservations

## Activities

- tickets
- confirmations

---

Requirements:

- offline access
- quick opening
- important document marking

---

# 7. Budget

## Purpose

Simple shared expense management.

---

# Expenses

Contains:

- amount
- currency
- category
- payer
- participants
- note
- receipt photo

---

Categories:

- food
- transport
- accommodation
- shopping
- attractions
- other

---

# Budget Dashboard

Shows:

- total spending
- category breakdown
- individual balance

---

# Currency Helper

Supports quick conversion:

KRW ↔ CZK/EUR

---

# 8. Korean Food Guide

## Purpose

Help travelers discover Korean cuisine.

---

Food entries contain:

- Korean name
- pronunciation
- description
- photo
- ingredients
- spice level
- price level

---

Special tags:

- beginner friendly
- must try
- first Korean meal

---

# 9. Korea Survival Guide

## Purpose

Provide practical offline knowledge.

---

Topics:

## Transportation

- metro
- T-money
- buses
- taxis

## Payments

- cards
- cash
- ATMs

## Culture

- restaurant etiquette
- café culture
- Korean manners

## Apps

- Naver Maps
- Kakao Taxi
- KakaoTalk

## Shopping

- convenience stores
- Olive Young
- markets

---

# 10. Memories

## Purpose

Transform the trip into a digital scrapbook.

---

Features:

## Shared Gallery

- photos
- locations
- captions

---

## Daily Journal

Contains:

- day
- text
- photos
- places visited

---

## Travel Statistics

Examples:

- days traveled
- places visited
- restaurants visited
- photos created
- distance walked

---

# 11. Haechi Companion

## Purpose

Create emotional connection.

Haechi is the personality layer of SeoulMate.

---

Haechi appears through:

- greetings
- milestones
- achievements
- tips
- empty states

---

Haechi is not required to be a chatbot.

Future AI functionality may enhance Haechi if it can be implemented reliably and affordably.

---

# 12. Gamification

## Purpose

Create emotional rewards.

---

Achievements examples:

Preparation:

- Ready Traveler
- First Korean Words

Travel:

- First Korean Meal
- Subway Explorer
- Café Explorer

Memories:

- Photo Collector
- Korea Memory Keeper

---

Gamification should remain simple.

It should support memories, not become a separate game.

---

# 13. Notifications

Notifications should be useful.

Allowed:

- upcoming activities
- important reminders
- weather alerts
- daily phrase
- Haechi messages

Avoid:

- spam
- unnecessary engagement notifications

---

# 14. Group Collaboration

All travelers participate equally.

Shared:

- itinerary
- places
- votes
- expenses
- checklist
- memories

---

# 15. Offline Requirements

Important information should remain accessible offline.

Offline available:

- itinerary
- saved places
- dictionary
- documents
- checklist
- emergency information

---

# 16. External Services

SeoulMate integrates with existing services.

Examples:

- Google Maps
- Naver Maps
- Kakao Maps
- Kakao Taxi

SeoulMate does not replace them.

---

# 17. AI Enhancement Possibilities

AI features may be added if they meet project principles.

Possible examples:

- Haechi AI companion
- personalized recommendations
- travel questions
- itinerary assistance

Requirements:

- reasonable cost
- reliable implementation
- real user value

AI should enhance the companion experience, not exist only because it is possible.

---



---

# Feature Implementation Priorities

The following priorities guide implementation order.

| Priority | Meaning |
|---|---|
| CRITICAL | Required for a usable MVP. |
| HIGH | Important for MVP but can follow the critical path. |
| MEDIUM | Valuable after the core experience is complete. |
| LOW | Future enhancement. |

## Module Priority Overview

| Module | Priority | MVP | Offline |
|---|---|---:|---:|
| Home Dashboard | CRITICAL | Yes | Partial |
| Trip Planner | CRITICAL | Yes | Yes |
| Places | CRITICAL | Yes | Yes |
| Korean Companion | CRITICAL | Yes | Yes |
| Documents | CRITICAL | Yes | Yes |
| Budget | CRITICAL | Yes | Yes |
| Emergency Center | HIGH | Yes | Yes |
| Korean Food Guide | MEDIUM | No | Yes |
| Korea Survival Guide | HIGH | Yes | Yes |
| Memories | MEDIUM | No | Partial |
| Haechi Companion | HIGH | Yes | Yes |
| Gamification | LOW | No | No |
| Notifications | HIGH | Yes | Partial |
| Group Collaboration | CRITICAL | Yes | Partial |
| Offline Support | CRITICAL | Yes | Yes |
| External Services | HIGH | Yes | No |
| AI Enhancements | LOW | No | No |

## Implementation Order

1. Authentication & Trip Creation
2. Home Dashboard
3. Trip Planner
4. Places
5. Korean Companion
6. Documents
7. Budget
8. Emergency Center
9. Korea Survival Guide
10. Notifications
11. Memories
12. Korean Food Guide
13. Gamification
14. AI Enhancements

# Product Success Definition

SeoulMate succeeds when travelers stop asking:

"Where is that information?"

and start saying:

"Check SeoulMate."

The application should transform a collection of bookings and plans into a shared Korean adventure.
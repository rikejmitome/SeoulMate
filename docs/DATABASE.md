# SeoulMate Database Design

## Firebase data architecture

Version: 1.0

Status: Active

---

# Purpose

This document defines the data architecture of SeoulMate.

The goal is to create a database structure that is:

- simple
- reliable
- offline-friendly
- easy for Codex to implement
- maintainable long term

SeoulMate is a private application for a small group of travelers.

The database should support the real product needs without unnecessary complexity.

---

# Database Philosophy

## Simple Over Scalable

SeoulMate is not designed as a public travel platform.

The application does not need:

- millions of users
- public content
- global travel databases
- complex recommendation systems

The database should optimize for:

- one private trip
- approximately four users
- shared experience
- offline usage

---

# Technology

Database:

Firebase Cloud Firestore

Storage:

Firebase Cloud Storage

Authentication:

Firebase Authentication

---

# Data Architecture Overview

The main data hierarchy:


users

trips
└── members
└── days
└── activities
└── places
└── expenses
└── checklist
└── documents
└── memories
└── achievements


---

# Firestore Structure

## Users


users/{userId}


Stores individual user profiles.

---

## Trips


trips/{tripId}


The main application object.

A trip represents one journey.

Example:

"Korea Adventure 2026"

---

## Trip Subcollections


trips/{tripId}/members/{userId}

trips/{tripId}/days/{dayId}

trips/{tripId}/activities/{activityId}

trips/{tripId}/places/{placeId}

trips/{tripId}/expenses/{expenseId}

trips/{tripId}/checklist/{itemId}

trips/{tripId}/documents/{documentId}

trips/{tripId}/memories/{memoryId}

trips/{tripId}/achievements/{achievementId}


---

# Entity Definitions

---

# User

Location:


users/{userId}


Purpose:

Stores account information.

---

Fields:


id
displayName
email
photoUrl
createdAt
lastActiveAt


---

Notes:

Users do not have public profiles.

---

# Trip

Location:


trips/{tripId}


Purpose:

Represents the complete Korean journey.

---

Fields:


id
name
destination
startDate
endDate
coverImageUrl

createdAt
updatedAt
createdBy


Example:


name:
Korea Adventure 2026

destination:
South Korea


---

# Trip Member

Location:


trips/{tripId}/members/{userId}


Purpose:

Defines users belonging to the private trip.

---

Fields:


userId
displayName
role
joinedAt


---

Role:

All users have equal permissions.

Possible value:


member


No:

- admin
- moderator

---

# Trip Day

Location:


trips/{tripId}/days/{dayId}


Purpose:

Represents one day of the journey.

---

Fields:


date
title
description
order
createdAt


Example:


Day 3

Traditional Seoul


---

# Activity

Location:


trips/{tripId}/activities/{activityId}


Purpose:

Represents planned or completed activities.

---

Fields:


title

dateId

startTime
endTime

locationName
address
latitude
longitude

category

notes

participantIds

status

createdBy
createdAt
updatedAt


---

Status examples:


planned
completed
cancelled


---

# Place

Location:


trips/{tripId}/places/{placeId}


Purpose:

Stores places selected by the group.

---

Fields:


name
koreanName

category

description

photoUrls

address
koreanAddress

latitude
longitude

googleMapsUrl
naverMapsUrl
kakaoMapsUrl

priceLevel

openingHours

recommendedDuration

bestVisitTime

reservationRequired

createdBy
createdAt


---

# Place Voting

Voting belongs inside the place object.

Example:


votes:
{
userId:
preference
}


Preference values:


want
maybe
skip


---

Reason:

The voting system is simple and does not require a separate collection.

---

# Expense

Location:


trips/{tripId}/expenses/{expenseId}


Purpose:

Shared expense tracking.

---

Fields:


title

amount

currency

category

paidBy

participantIds

note

receiptImageUrl

createdAt


---

Categories:


food
transport
accommodation
shopping
attraction
other


---

# Checklist Item

Location:


trips/{tripId}/checklist/{itemId}


Purpose:

Travel preparation.

---

Fields:


title

category

assignedTo

isCompleted

completedAt

createdAt


---

Categories:


documents
electronics
clothing
personal
other


---

# Document

Location:


trips/{tripId}/documents/{documentId}


Purpose:

Store important travel files.

---

Fields:


name

category

fileUrl

fileType

isImportant

uploadedBy

createdAt


---

Categories:


passport
flight
hotel
insurance
ticket
other


---

# Memory

Location:


trips/{tripId}/memories/{memoryId}


Purpose:

Digital scrapbook.

---

Fields:


title

description

photoUrls

locationName

latitude
longitude

date

createdBy

createdAt


---

# Achievement Progress

Location:


trips/{tripId}/achievements/{achievementId}


Purpose:

Stores user progress.

---

Fields:


achievementId

userId

completed

completedAt


---

# Static Content Strategy

Some SeoulMate content does not belong in Firestore.

Reason:

- does not change frequently
- should work offline
- should not consume database reads

---

# Local JSON Content

Stored inside the application.

Examples:


assets/data/


---

# Korean Dictionary

Local data.

Contains:

- Hangul
- romanization
- Czech pronunciation
- meaning
- category
- audio reference

---

# Korea Guide

Local data.

Contains:

- transport guides
- cultural tips
- practical information

---

# Food Encyclopedia

Local data.

Contains:

- Korean food information
- descriptions
- categories

---

# Achievement Definitions

Local data.

Contains:

- achievement name
- description
- icon
- requirements

Firestore stores only progress.

---

# Firebase Storage

Used for:

---

## Photos

Examples:

- memories
- place images
- profile images

---

## Documents

Examples:

- PDFs
- screenshots
- tickets

---

## Application Assets

Examples:

- Haechi images

---

# Storage Structure

Recommended:


users/{userId}/

trips/{tripId}/
memories/
documents/


---

# Offline Strategy

Offline support is a core requirement.

---

# Firestore Offline Persistence

Enabled.

Firestore automatically caches:

- trip data
- activities
- places
- expenses
- checklist

---

# Required Offline Data

Must work without internet:

## Trip

- days
- activities
- schedule

---

## Places

- saved places
- important information

---

## Korean Companion

- phrases
- pronunciation

---

## Documents

- downloaded files

---

## Emergency

- contacts
- instructions
- phrases

---

# Synchronization

When internet returns:

The application should:

- synchronize automatically
- resolve updates using Firestore rules
- avoid duplicate data

---

# Data Validation

The application should validate:

## Required fields

Examples:

- names
- dates
- amounts

---

## Data Limits

Avoid unnecessary large objects.

Examples:

- resize uploaded images
- limit document size

---

# Security Principles

Security is based on privacy.

Rules:

- users only access trips they belong to
- no public data access
- no anonymous modification
- users can only modify private trip data

---

# Security Model

Access:


Authenticated user
|
|
belongs to trip
|
|
can access trip data


---

# Database Anti Patterns

Avoid:

---

## Global Travel Database

Do not create:


places/global


SeoulMate is not TripAdvisor.

---

## Over Normalization

Do not create unnecessary collections.

Example:

Avoid:


votes/
comments/
ratings/


when embedded data is enough.

---

## Storing Static Content In Firestore

Avoid storing:

- dictionary
- guides
- food database

as Firestore collections.

---

## Premature Complexity

Do not create architecture for problems SeoulMate does not have.

---

# Final Database Goal

The database should support one thing:

A small group of friends creating, experiencing and remembering one Korean adventure.

The best database design is not the most complex one.

It is the simplest one that reliably powers the SeoulMate experience.
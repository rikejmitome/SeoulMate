# SeoulMate UI Specification

Version: 1.0

---

## Purpose

Tento dokument definuje implementační pravidla uživatelského rozhraní aplikace SeoulMate.

PRD říká, CO aplikace umí.
Application Flow říká, JAK se uživatel pohybuje.
UI Specification říká, JAK mají jednotlivé obrazovky vypadat a fungovat.

Pokud není něco výslovně uvedeno zde, řídí se implementace dokumenty:
- PRD
- UX
- Style Guide
- Application Flow

---

# UI Philosophy

Každá obrazovka musí být:

- jednoduchá
- rychlá
- přehledná
- ovladatelná jednou rukou
- konzistentní

Nikdy nepoužívat více než jednu hlavní akci.

Každá obrazovka musí mít jasný účel.

---

# Screen Layout

Každá obrazovka používá:

AppBar

↓

Scrollable Content

↓

SafeArea

↓

Bottom Navigation (pokud je součástí hlavní navigace)

---

# Reusable Components

Používat pouze tyto základní komponenty:

- Primary Button
- Secondary Button
- Outlined Button
- Section Header
- Info Card
- Quick Action Card
- Place Card
- Activity Card
- Phrase Card
- Expense Card
- Memory Card
- Achievement Card
- Statistic Card
- Empty State
- Error State
- Offline Banner
- Skeleton Loader
- Confirmation Dialog

Nové komponenty vytvářet pouze pokud nelze použít existující.

---

# Screen States

Každá obrazovka musí podporovat:

Loading

Empty

Offline

Error

Content

Nikdy nezobrazovat prázdnou stránku.

---

# Navigation Rules

Bottom Navigation obsahuje:

Home

Trip

Places

Budget

More

Nikdy neměnit pořadí.

Back vrací uživatele na předchozí obrazovku.

---

# Animation Rules

Transition:

200–300 ms

Cards:

Fade + Slide

Dialog:

Scale + Fade

Nepoužívat složité animace.

---

# Accessibility

Touch Target

>= 48 px

Kontrast

WCAG AA

Podpora Dynamic Text

Ano

Ikony nikdy nejsou jediným nositelem informace.

---

# Responsive Rules

Primárně navrženo pro telefony.

Tablety:

max-width content

Desktop:

neoptimalizovat.

---

# Screen Overview

## Login

Purpose

Přihlášení uživatele.

Primary Action

Sign In

Components

Logo

Email

Password

Forgot Password

Login Button

Google Login

States

Loading

Error

Offline

Acceptance

Po úspěšném přihlášení pokračovat do Home nebo Create Trip.

---

## Create Trip

Purpose

Vytvoření nové cesty.

Fields

Trip Name

Destination

Start Date

End Date

Currency

Acceptance

Po vytvoření automaticky otevřít Home.

---

## Home

Purpose

Centrální dashboard.

Dynamic according to:

Dream

Adventure

Memories

Components

Haechi

Countdown

Today's Schedule

Quick Actions

Weather

Budget Summary

Acceptance

Nikdy nesmí být prázdný.

---

## Trip

Purpose

Plánování itineráře.

Components

Timeline

Days

Activities

Add Activity

Acceptance

Aktivity lze měnit přetažením.

---

## Activity Detail

Shows

Time

Location

Description

Notes

Participants

Buttons

Edit

Delete

Navigate

---

## Places

Purpose

Správa zajímavých míst.

Components

Search

Filters

Categories

Place Cards

Map Button

Acceptance

Každé místo lze uložit nebo přidat do itineráře.

---

## Place Detail

Components

Gallery

Description

Opening Hours

Map

Rating

Buttons

Save

Add to Trip

Open Maps

---

## Korean Companion

Purpose

Rychlá komunikace.

Components

Categories

Phrase Cards

Favorites

Recent

Search

Acceptance

Funguje offline.

---

## Budget

Purpose

Správa výdajů.

Components

Summary

Expense List

Charts

Balances

Button

Add Expense

---

## Expense Detail

Fields

Amount

Currency

Category

Members

Notes

Acceptance

Automaticky přepočítat bilanci.

---

## Documents

Purpose

Cestovní dokumenty.

Components

Categories

Files

Preview

Download

Acceptance

Dokumenty dostupné offline po stažení.

---

## Emergency

Purpose

Nouzová pomoc.

Components

Emergency Numbers

Embassy

Hospitals

Emergency Korean

Acceptance

Přístupné bez přihlášení a offline.

---

## Memories

Purpose

Archiv cesty.

Components

Timeline

Photos

Statistics

Achievements

Notes

Acceptance

Automaticky po skončení cesty.

---

## Settings

Components

Profile

Notifications

Offline Data

Language

About

Logout

---

# Dialogs

Používat jednotné dialogy pro:

Delete

Logout

Remove Activity

Remove Expense

Leave Trip

---

# Snackbars

Pouze pro krátká potvrzení.

Například:

Expense Added

Trip Updated

Document Saved

---

# Global Acceptance Criteria

Každá obrazovka:

✓ Má Loading State

✓ Má Empty State

✓ Má Error State

✓ Má Offline State (pokud dává smysl)

✓ Používá komponenty z Component Library

✓ Respektuje Style Guide

✓ Respektuje Application Flow

✓ Nepoužívá vlastní barvy

✓ Nepoužívá vlastní spacing

✓ Nepoužívá vlastní animace

✓ Má maximálně jednu Primary Action

---

# Implementation Notes for Codex

Implementovat vždy vertikálně:

Model

↓

Repository

↓

Provider

↓

UI

↓

Tests

Nepřidávat funkce, které nejsou definované v PRD.

Neimplementovat alternativní uživatelské cesty.

Pokud existuje více možných řešení, zvolit jednodušší.

Preferovat znovupoužití komponent před vytvářením nových.

Cílem není vytvořit technicky nejkomplexnější aplikaci, ale rychlou, přehlednou a spolehlivou aplikaci, která bude příjemným společníkem při cestování.
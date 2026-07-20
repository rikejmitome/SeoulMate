# SeoulMate Setup

## Development environment setup

Version: 1.0

Status: Active

---

# Purpose

This document explains how to prepare the development environment for SeoulMate.

The goal is to allow:

- Codex
- developers

to quickly run and continue development of the application.

---

# Project Requirements

## Required Software

Install:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Git

---

# Recommended Versions

The project should use a stable Flutter release.

Recommended:


Flutter stable channel


---

# Verify Flutter Installation

Run:

```bash
flutter doctor

The environment should have:

Flutter installed
Dart available
Android toolchain configured
iOS toolchain configured when developing on macOS
Project Setup
Clone Repository

Clone the SeoulMate repository.

Example:

git clone <repository-url>
Install Dependencies

Inside the project folder:

flutter pub get
Generate Code

SeoulMate uses generated code.

Run:

dart run build_runner build --delete-conflicting-outputs

Used for:

Freezed models
JSON serialization
Firebase Setup

SeoulMate uses Firebase services:

Authentication
Cloud Firestore
Firebase Storage
Firebase Cloud Messaging
Firebase Configuration

Required files:

Android:

google-services.json

iOS:

GoogleService-Info.plist
Firebase Initialization

The application must initialize Firebase before running the app.

Example flow:

main.dart

↓

Firebase.initializeApp()

↓

Application starts
Authentication Setup

Enable:

Firebase Authentication

Recommended provider:

Email / Password
Firestore Setup

Create:

Cloud Firestore database

Recommended:

Production mode

Security rules must follow:

08_SECURITY.md

Storage Setup

Enable Firebase Storage.

Used for:

photos
documents
attachments
Local Development

Run application:

flutter run
Available Platforms

Supported:

Android
iOS
Environment Configuration

The application supports:

development

production
Development Environment

Used for:

testing
debugging
local development
Production Environment

Used for:

real Korea trip usage
Recommended Project Commands
Run application
flutter run
Analyze code
flutter analyze
Run tests
flutter test
Format code
dart format .
Generate models
dart run build_runner build --delete-conflicting-outputs
Dependency Rules

Before adding a new package:

Ask:

Is it necessary?
Does Flutter or Firebase already provide this?
Does it reduce complexity?

Avoid unnecessary dependencies.

Codex Development Instructions

When working on SeoulMate:

Codex should:

read all documentation first
follow existing architecture
use existing packages
avoid introducing new patterns
keep implementation simple

Codex should not:

rewrite architecture without approval
add unnecessary dependencies
create duplicate systems
implement future features not described in current requirements
Firebase Cost Control

Because SeoulMate uses Firebase Free Tier:

Avoid:

unnecessary Firestore reads
storing static content remotely
excessive notifications
unnecessary background processes
Backup Strategy

Important:

Before major changes:

commit changes
verify application runs
test critical functionality
Release Preparation

Before using SeoulMate in Korea:

Verify:

Authentication

Users can log in.

Offline

Important information works without internet.

Documents

Travel files are accessible.

Budget

Expenses calculate correctly.

Maps

External map links open correctly.

Notifications

Only meaningful notifications appear.

Final Setup Goal

A developer or AI coding agent should be able to:

Clone the project
Install dependencies
Configure Firebase
Run the application

with minimal additional explanation.

The setup process should be simple because the application itself should remain simple.
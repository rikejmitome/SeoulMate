# SeoulMate v2.0 — Konfigurace pro Claude Code (CLAUDE.md)

**Verze:** 2.0  
**Stav:** PROPOSED ROOT FILE (Do kořene repozitáře kopírujte až po schválení)  
**Dokumentační index:** [../DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)  
**Předávací kontrakt:** [../23_CLAUDE_CODE_HANDOFF.md](../23_CLAUDE_CODE_HANDOFF.md)  
**Backlog:** [../26_TASK_BACKLOG.md](../26_TASK_BACKLOG.md)

---

## 1. Příkazy pro sestavení a testování

```bash
# Instalace balíčků
flutter pub get

# Generování Freezed a Drift kódu
dart run build_runner build --delete-conflicting-outputs

# Statická analýza (povinně 0 chyb)
flutter analyze

# Spuštění testů
flutter test

# Sestavení release APK
flutter build apk --release
```

---

## 2. Kódovací standardy a architektura

- **Architektura:** Feature-First (`lib/features/<feature>/presentation|domain|data`).
- **State Management:** `flutter_riverpod` (`AsyncNotifier`, `StateNotifier`).
- **Data:** `drift` pro lokální SQLite tabulky, `freezed` pro neměnné doménové modely.
- **Offline & Cloud:** `sync_outbox` pro asynchronní replikaci do `cloud_firestore`.
- **Zero-Cost:** Žádný Cloud Storage, všechna média a doklady ukládat lokálně.

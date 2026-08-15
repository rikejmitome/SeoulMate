# SeoulMate v2.0 — Průvodce migrací z v1.0 (Migration Guide)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Audit repozitáře:** [audit/REPOSITORY_AUDIT.md](audit/REPOSITORY_AUDIT.md)  
**Doporučení migrace:** [audit/MIGRATION_RECOMMENDATION.md](audit/MIGRATION_RECOMMENDATION.md)

---

## 1. Závazný migrační protokol

1. **Žádné změny v kódu před schválením dokumentace:** Veškerá specifikace musí být odsouhlasena.
2. **Krok 0 (Baseline):** Spuštění `TASK-BASELINE-01` — zaznamenání git commitu výchozího stavu a ověření stávajících testů.
3. **Inkrementální vrstvy:** Postupná implementace podle vrstev 1 až 6 definovaných v [audit/MIGRATION_RECOMMENDATION.md](audit/MIGRATION_RECOMMENDATION.md).

---

## 2. Podrobný postup migrace po vrstvách

### Krok 1: Datová vrstva (Drift & SQLite)
- Přidat `drift: ^2.24.0`, `sqlite3_flutter_libs: ^0.5.28`, `path_provider: ^2.1.5` a do dev dependencies `drift_dev: ^2.24.0`, `build_runner: ^2.4.14`.
- Vytvořit soubor `lib/core/database/app_database.dart` a definovat schémata.
- Spustit `dart run build_runner build --delete-conflicting-outputs`.
- Napojit existující repozitáře na čtení z Drift DAO.

### Krok 2: Odstranění / zákaz `firebase_storage`
- V souladu se Zero-Cost principem vyloučit závislost na Cloud Storage for Firebase.
- Vytvořit lokální `EncryptedStorageService` pro bezpečné ukládání souborů Travel Vaultu.

### Krok 3: Synchronizační fronta (Outbox Worker)
- Vytvořit tabulku `sync_outbox` v Drift DB.
- Implementovat `SyncOutboxRepository` a periodický worker pro dávkové odesílání do `Cloud Firestore`.

### Krok 4: UI Shell a Design Systém
- Přepracovat `app_theme.dart` a integrovat paletu Hanok & Dancheong.
- Vytvořit `AppShell` s 5 záložkami a globálním nouzovým tlačítkem.

### Krok 5: Doplnění P0 a P1 modulů
- Postupně implementovat chybějící moduly podle [26_TASK_BACKLOG.md](26_TASK_BACKLOG.md).

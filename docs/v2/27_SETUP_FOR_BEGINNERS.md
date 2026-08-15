# SeoulMate v2.0 — Průvodce nastavením prostředí (Setup for Beginners)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Požadavky na vývojové prostředí

- **Flutter SDK:** Verze `3.29.x` nebo vyšší (Dart SDK `^3.12.2`).
- **Vývojové nástroje:**
  - VS Code s rozšířeními *Flutter* a *Dart*, nebo Android Studio.
  - Git pro správu verzí.
- **Podporovaná zařízení:**
  - Android telefon s Android 10+ (API 29+) nebo Android Emulator.
  - iOS zařízení s iOS 15+ nebo iOS Simulator (vyžaduje macOS a Xcode).

---

## 2. První spuštění projektu krok za krokem

```bash
# 1. Kontrola zdraví Flutter instalace
flutter doctor

# 2. Stažení závislostí
flutter pub get

# 3. Vygenerování kódu pro Freezed a Drift
dart run build_runner build --delete-conflicting-outputs

# 4. Spuštění statické analýzy
flutter analyze

# 5. Spuštění všech testů
flutter test

# 6. Spuštění aplikace na připojeném telefonu / emulátoru
flutter run
```

---

## 3. Řešení častých problémů

- **Chyba generování kódu (`build_runner`):** Spusťte `dart run build_runner clean` a poté znovu `dart run build_runner build --delete-conflicting-outputs`.
- **Chybějící Firebase konfigurace:** Pro lokální vývoj s Drift SQLite není online připojení k Firebase nutné — aplikace automaticky naběhne v plně offline režimu.

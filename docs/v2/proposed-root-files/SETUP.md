# SeoulMate v2.0 — Rychlý start projektu (SETUP.md)

**Verze:** 2.0  
**Stav:** PROPOSED ROOT FILE (Do kořene repozitáře kopírujte až po schválení)  
**Dokumentační index:** [../DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)  
**Návod pro začátečníky:** [../27_SETUP_FOR_BEGINNERS.md](../27_SETUP_FOR_BEGINNERS.md)

---

## 1. Rychlý start v 5 krocích

```bash
# 1. Kontrola prostředí
flutter doctor

# 2. Stažení knihoven
flutter pub get

# 3. Vygenerování modelů a DB
dart run build_runner build --delete-conflicting-outputs

# 4. Spuštění analýzy a testů
flutter analyze
flutter test

# 5. Spuštění aplikace
flutter run
```

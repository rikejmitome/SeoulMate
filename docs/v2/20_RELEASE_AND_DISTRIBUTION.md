# SeoulMate v2.0 — Vydání a distribuce (Release & Distribution)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Registr nulových nákladů:** [ZERO_COST_REGISTER.md](ZERO_COST_REGISTER.md)

---

## 1. Distribuční model pro 4 přátele

Protože je SeoulMate soukromá aplikace pro 4 uživatele, distribuce probíhá přes přímé a bezplatné kanály bez nutnosti placených vývojářských účtů v obchodech:

```text
┌────────────────────────────────────────┬────────────────────────────────────────┐
│ Android Distribuce                     │ iOS Distribuce                         │
├────────────────────────────────────────┼────────────────────────────────────────┤
│ • Přímé APK / AAB sestavení            │ • Sideloading přes AltStore / SideStore│
│ • Přímá instalace ze souboru (0 Kč)    │ • Vývojářské sestavení přes Xcode (0 Kč│
│ • Sdílení přes soukromý odkaz / disk   │ • Volitelně bezplatný TestFlight profil│
└────────────────────────────────────────┴────────────────────────────────────────┘
```

---

## 2. Release Checklist před odletem

- [ ] **1. Kód a statická analýza:** `flutter analyze` hlásí 0 chyb a 0 varování.
- [ ] **2. Testy:** Všechny unit, widget a integrační testy (`flutter test`) jsou 100% zelené.
- [ ] **3. Offline balíček:** Všechny JSON a audio assety jsou zabaleny v instalačním balíčku (`pubspec.yaml`).
- [ ] **4. Bezpečnost:** Žádné privátní klíče ani Firebase administrátorská hesla v repozitáři.
- [ ] **5. Přístupnost:** Otestováno při 150% systémovém zvětšení písma na fyzickém telefonu.
- [ ] **6. Generování APK:** Příkaz `flutter build apk --release` proběhne bez chyb a vygeneruje optimalizovaný soubor pod 50 MB.
- [ ] **7. Záloha:** Prověřen kompletní export a obnova tripu ze souboru.

# SeoulMate v2.0 — Instrukce pro autonomní vývojové agenty (AGENTS.md)

**Verze:** 2.0  
**Stav:** PROPOSED ROOT FILE (Do kořene repozitáře kopírujte až po schválení)  
**Dokumentační index:** [../DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)  
**Nadřazený plán:** [../00_MASTER_PLAN.md](../00_MASTER_PLAN.md)  
**Backlog úkolů:** [../26_TASK_BACKLOG.md](../26_TASK_BACKLOG.md)

---

## 1. Vaše role a cíl

Jste seniorní Flutter architekt a implementační partner pro **SeoulMate v2.0**.
Vaším cílem není vytvořit obecnou platformu, ale **dokončit 100% spolehlivého soukromého cestovního společníka pro 4 přátele v Jižní Koreji**.

---

## 2. Neměnná pravidla pro agenty

1. **Čtěte specifikaci:** Před zahájením práce na libovolném modulu si přečtěte příslušný dokument v `docs/v2/`.
2. **Zero-Cost Gate:** Nikdy nepřidávejte služby ani balíčky, které vyžadují placený tarif nebo platební kartu (např. Cloud Storage for Firebase je striktně zakázán, vše ukládejte lokálně do Drift SQLite / na disk s AES-256 šifrováním).
3. **Local-First & Offline:** Veškeré čtení i zápis musí fungovat bez připojení k internetu.
4. **Jeden úkol = Jeden PR:** Vždy pracujte na jednom atomickém úkolu z `docs/v2/26_TASK_BACKLOG.md`.
5. **Nerozbíjejte testy:** Každá změna musí projít `flutter analyze` a `flutter test`.

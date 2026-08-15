# SeoulMate v2.0 — Registr rizik a mitigací (Risk Register)

**Verze:** 2.0  
**Stav:** ACTIVE  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Zero-Cost Registr:** [ZERO_COST_REGISTER.md](ZERO_COST_REGISTER.md)

---

## 1. Matice rizik a mitigačních opatření

| ID | Riziko | Pravděpodobnost | Dopad | Závažnost | Mitigační opatření | Trigger k akci |
|---|---|---|---|---|---|---|
| **RSK-01** | Výpadek internetového připojení v podzemí nebo při roamingu v Koreji | Vysoká | Vysoká | **KRITICKÉ** | Local-First architektura ([12_TECHNICAL_ARCHITECTURE.md](12_TECHNICAL_ARCHITECTURE.md)), lokální Drift DB, Offline Trip Pack. | Aplikace detekuje nedostupnost sítě (přepne do offline módu bez chybové hlášky). |
| **RSK-02** | Souběžná offline úprava stejné položky itineráře dvěma uživateli | Střední | Střední | **STŘEDNÍ** | Revizní čísla, Outbox fronta, deterministické slučování a rozlišení v Group Decision Centru ([14_SYNC_AND_CONFLICTS.md](14_SYNC_AND_CONFLICTS.md)). | Zjištění rozdílných revizí při synchronizaci dávky. |
| **RSK-03** | Ztráta nebo poškození telefonu některého ze 4 cestovatelů | Nízká | Vysoká | **VYSOKÁ** | Cloudová replikace metadat a možnost plného obnovení z přenosného šifrovaného ZIP balíčku ([24_ACCEPTANCE_CRITERIA.md#ac-bak-001](24_ACCEPTANCE_CRITERIA.md)). | Přihlášení uživatele na novém čistém zařízení. |
| **RSK-04** | Nekvalitní nebo zavádějící strojový překlad / OCR alergenů | Střední | Vysoká | **VYSOKÁ** | Zřetelné vizuální označení „Strojový překlad“ ([08_UX_SPECIFICATION.md](08_UX_SPECIFICATION.md)) a trvalé varování před lékařským posouzením. | Zobrazení výsledku z Camera Companion nebo Food Guide. |
| **RSK-05** | Nákladové riziko Cloud Storage for Firebase (nutnost Blaze plánu) | Vysoká | Vysoká | **KRITICKÉ** | Vyloučení Firebase Storage z cílové v2 architektury. Travel Vault a fotky fungují 100% lokálně na disku telefonu. | Pokus o přidání závislosti na cloudové binární úložiště. |
| **RSK-06** | Přílišný rozsah (Scope Creep) a nedokončení mobilní aplikace před odletem | Střední | Vysoká | **VYSOKÁ** | Striktní dělení na P0 a P1/P2 ([02_PRODUCT_SCOPE.md](02_PRODUCT_SCOPE.md)). Desktop (Windows/macOS) odložen až po mobilním vydání. | Skluz v dokončování P0 modulů. |
| **RSK-07** | Únik citlivých cestovních dokladů (letenky, pasy) | Nízká | Vysoká | **VYSOKÁ** | Lokální AES-256 šifrování dat ve Vaultu, zákaz logování osobních údajů, striktní Firestore security rules ([17_SECURITY_AND_PRIVACY.md](17_SECURITY_AND_PRIVACY.md)). | Pokus o neautorizovaný přístup či export bez potvrzení. |
| **RSK-08** | Nedostatek místa na úložišti telefonu v terénu | Střední | Střední | **STŘEDNÍ** | Ochrana kritické textové DB a letenek; možnost promazání dočasných náhledů fotek ([15_OFFLINE_STRATEGY.md](15_OFFLINE_STRATEGY.md)). | Zaplnění disku pod 50 MB. |

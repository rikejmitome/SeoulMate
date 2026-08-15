# SeoulMate v2.0 — Manifest statických assetů (Asset Manifest)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Soupis statických assetů aplikace

```text
assets/
├── data/
│   ├── korean_phrases.json        # Kurátorovaná databáze frází s fonetikou
│   ├── food_guide.json            # Encyklopedie jídel s alergeny a pálivostí
│   ├── survival_guide.json        # Tipy k metru, T-money a etiketě
│   ├── emergency_info.json        # Nouzové linky, ambasáda a nemocnice
│   └── haechi_dialogues.json      # Šablonové hlášky pro 11 stavů Haechiho
├── audio/
│   ├── phrases/                   # Lokální AAC nahrávky výslovnosti frází
│   └── emergency/                 # Nouzové korejské hlasové zprávy
├── images/
│   ├── haechi/                    # 2D/3D ilustrace maskota pro různé nálady
│   ├── foods/                     # Optimalizované miniatury jídel (WebP)
│   ├── places_placeholder/        # Ilustrované šablony kategorií míst
│   └── icons/                     # SVG ikony specifické pro SeoulMate
└── fonts/
    └── Pretendard/                # Open Source fonty s plnou podporou Hangulu
```

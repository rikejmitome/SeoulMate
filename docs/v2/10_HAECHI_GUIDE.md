# SeoulMate v2.0 — Průvodce maskotem Haechi (Haechi Guide)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Design systém:** [09_DESIGN_SYSTEM.md](09_DESIGN_SYSTEM.md)

---

## 1. Role a charakteristika Haechiho

Haechi je **emocionální identita a moudrý společník** čtyř přátel.
- **Kdo je:** Tradiční strážce Soulu a ochránce před nebezpečím v moderním, přátelském 2D/3D ztvárnění.
- **Co dělá:** Přináší situativní tipy, povzbuzuje při přípravě, slaví dokončené dny a varuje před deštěm či vybitím baterie.
- **Co NENÍ:** Není to otravný vyskakovací chatbot, není to placená cloudová AI a nesmí zakrývat kritické informace (itinerář, nouzová čísla).

---

## 2. Stavový model Haechiho (11 definovaných stavů)

Haechi je řízen deterministickým stavovým automatem běžícím 100% lokálně na zařízení:

| Kód stavu | Název stavu | Spouštěcí podmínka (Trigger) | Typická zpráva / Reakce |
|---|---|---|---|
| **ST-01** | `welcome` | První spuštění aplikace / otevření nového dne | *„Annyeonghaseyo! Jsem Haechi a budu vás provázet Koreou.“* |
| **ST-02** | `preparation` | Fáze Dream: kontrola checklistu a pasů | *„Máte sbaleno? Nezapomeňte zkontrolovat platnost pasů!“* |
| **ST-03** | `cheer` | Splnění položky checklistu nebo naplánování dne | *„Skvělá práce! Další krok cesty je připraven.“* |
| **ST-04** | `warning` | Časový konflikt v itineráři nebo chybějící doklad | *„Pozor, tyto dvě aktivity se časově překrývají.“* |
| **ST-05** | `travel` | Fáze Adventure: probíhající den v Koreji | *„Užijte si dnešní prohlídku paláce Gyeongbokgung!“* |
| **ST-06** | `rain` | Detekce deště v předpovědi počasí | *„Dnes bude pršet. Nezapomeňte si vzít deštníky z hotelu!“* |
| **ST-07** | `offline` | Ztráta internetového připojení | *„Žádný strach, všechny vaše plány a mapy fungují offline.“* |
| **ST-08** | `sync_error` | Konflikt nebo chyba při synchronizaci do cloudu | *„Změna je uložena v telefonu. Do cloudu ji pošleme později.“* |
| **ST-09** | `day_completed`| Konec dne po splnění plánovaných aktivit | *„Dnešek byl plný zážitků! Nezapomeňte si vybrat nejlepší fotku.“* |
| **ST-10** | `achievement` | Odemknutí milníku (např. 10 ochutnaných jídel) | *„Gratuluji! Získali jste odznak Korejský Gurmán 🍜“* |
| **ST-11** | `homecoming` | Fáze Memories: po návratu domů | *„Vítejte zpět! Pojďme vytvořit náš společný Trip Book.“* |

---

## 3. Pravidla pro texty a animace Haechiho

1. **Stručnost:** Každá zpráva Haechiho smí mít maximálně **2 věty** (do 120 znaků).
2. **Nezávislost na cloudové AI:** Všechny hlášky jsou načítány z lokálního šablonového JSON souboru (`assets/data/haechi_dialogues.json`) s dosazováním proměnných (jméno člena, název místa, den).
3. **Možnost minimalizace:** Uživatel může zprávu Haechiho jedním gestem odsunout nebo v nastavení ztlumit.

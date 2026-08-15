# SeoulMate v2.0 — Atomický implementační backlog (Task Backlog)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Vazba na požadavky a AC:** [03_PRD.md](03_PRD.md) a [24_ACCEPTANCE_CRITERIA.md](24_ACCEPTANCE_CRITERIA.md)  
**Matice sledovatelnosti:** [TRACEABILITY_MATRIX.md](TRACEABILITY_MATRIX.md)

---

## 1. Pravidla atomického backlogu

Každý úkol v tomto backlogu představuje jeden uzavřený, samostatně kontrolovatelný a testovatelný vertikální řez (Pull Request). Žádný úkol nesmí rozbít stávající sestavení ani zanechat nedořešené `TODO`.

Struktura každého úkolu:
- **Task ID & Název**
- **Fáze a Priorita (P0 / P1 / P2)**
- **Cíl úkolu**
- **Rozsah (In-Scope) a Mimo rozsah (Out-of-Scope)**
- **Závislosti (Dependencies)**
- **Dotčené soubory a adresáře**
- **Navázaná REQ a AC ID** (všechna ID jsou uvedena explicitně bez zkracování)
- **Povinné testy a ověřovací kroky**
- **Zero-Cost kontrola**
- **Definition of Done (DoD)**

---

## 2. Přehled a detail implementačních úkolů

### Fáze B: Stabilizace, Git Baseline a Datové jádro

#### `TASK-BASELINE-01`: Zaznamenání Git baseline a stabilizace v1.0
- **Priorita:** P0 (Fáze B)
- **Cíl:** Vytvořit bezpečný výchozí bod repozitáře, zaznamenat commit HEAD, ověřit zelený stav stávajících testů a schválit migrační pořadí před jakýmikoliv úpravami kódu.
- **In-Scope:** Spuštění existujících testů `test/`, kontrola stavu pracovního stromu.
- **Out-of-Scope:** Úpravy kódu nebo knihoven.
- **Závislosti:** Žádné.
- **Dotčené soubory:** `test/*`
- **Navázaná REQ ID:** `NFR-PLAT-001`
- **Navázaná AC ID:** `AC-NFR-PLAT`
- **Povinné testy:** `flutter analyze`, `flutter test`
- **Zero-Cost kontrola:** 100% soulad (žádné náklady).
- **DoD:** Všechny stávající testy procházejí, pracovní strom je čistý, baseline commit je zdokumentován.

#### `TASK-CORE-01`: Zavedení Drift SQLite databáze a entitních schémat
- **Priorita:** P0 (Fáze B)
- **Cíl:** Přidat balíčky `drift` a `sqlite3_flutter_libs`, vytvořit `AppDatabase` a relační schémata pro trip, dny, aktivity, místa, hlasování a ubytování.
- **In-Scope:** Vytvoření Drift tabulek, CRUD DAO tříd, obousměrné mapování na doménové Freezed modely.
- **Out-of-Scope:** Cloudová synchronizace.
- **Závislosti:** `TASK-BASELINE-01`
- **Dotčené soubory:** `lib/core/database/*`, `lib/features/trip/data/*`, `lib/features/places/data/*`
- **Navázaná REQ ID:** `REQ-TRIP-001`, `REQ-TRIP-002`, `REQ-TRIP-003`, `REQ-PLAN-001`, `REQ-PLAN-002`, `REQ-PLAN-005`, `REQ-PLC-001`, `REQ-PLC-002`, `REQ-OFF-002`, `NFR-PERF-001`
- **Navázaná AC ID:** `AC-TRIP-001`, `AC-TRIP-002`, `AC-TRIP-003`, `AC-PLAN-001`, `AC-PLAN-002`, `AC-PLAN-005`, `AC-PLC-001`, `AC-PLC-002`, `AC-OFF-002`, `AC-NFR-PERF`
- **Povinné testy:** Unit testy CRUD operací v `test/database/drift_crud_test.dart`
- **Zero-Cost kontrola:** 100% soulad (lokální Open Source SQLite).
- **DoD:** Databáze reaktivně poskytuje streamy dat, testy CRUD operací jsou zelené.

#### `TASK-CORE-02`: Implementace Outbox synchronizační fronty a Firestore adaptéru
- **Priorita:** P0 (Fáze B)
- **Cíl:** Vytvořit tabulku `sync_outbox`, `SyncOutboxRepository` a asynchronní worker replikující změny do Cloud Firestore s podporou offline řazení.
- **In-Scope:** Zápis do outboxu při každé lokální změně, dávkové odesílání, zpracování chyb a idempotence.
- **Out-of-Scope:** UI Sync Centra.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/core/sync/*`
- **Navázaná REQ ID:** `REQ-HOME-003`, `REQ-OFF-003`
- **Navázaná AC ID:** `AC-HOME-003`, `AC-OFF-003`
- **Povinné testy:** Mockované testy outboxu v `test/sync/outbox_sync_test.dart`
- **Zero-Cost kontrola:** Firestore je volán výhradně v dávkách v rámci Spark limitů.
- **DoD:** Lokální změna se spolehlivě zařadí do fronty a při dostupnosti sítě odešle do cloudu.

---

### Fáze C: UI Shell, Design Systém a Adaptivní Home

#### `TASK-UI-01`: Implementace v2 Design Systému a Spodní Navigace
- **Priorita:** P0 (Fáze C)
- **Cíl:** Přepracovat `app_theme.dart` na paletu Dancheong/Hanok a vytvořit `AppShell` s 5 záložkami a globálním Emergency tlačítkem.
- **In-Scope:** Theme tokeny, typografie, barvy, `AppShell`, `AppRouter` přechody.
- **Out-of-Scope:** Obsah vnitřních obrazovek.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/core/theme/*`, `lib/core/routing/*`
- **Navázaná REQ ID:** `REQ-HOME-003`, `NFR-A11Y-001`
- **Navázaná AC ID:** `AC-HOME-003`, `AC-NFR-A11Y`
- **Povinné testy:** Widget a Golden testy navigace v `test/presentation/app_shell_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Navigační lišta umožňuje přepínání mezi 5 hlavními sekcemi s plynulými přechody.

#### `TASK-UI-02`: Adaptivní Home Screen („Co teď?“) a Maskot Haechi
- **Priorita:** P1 (Fáze C)
- **Cíl:** Vytvořit domovskou obrazovku s dominantní akční kartou „Co teď?“, kontextovými mini-kartami a pravidlovým Haechi widgetem.
- **In-Scope:** Logika výběru dominantní karty, stavový automat Haechiho s 11 stavy, napojení na lokální JSON dialogy.
- **Out-of-Scope:** Cloudová AI.
- **Závislosti:** `TASK-UI-01`
- **Dotčené soubory:** `lib/features/home/*`
- **Navázaná REQ ID:** `REQ-HOME-001`, `REQ-HOME-002`, `REQ-HCH-001`
- **Navázaná AC ID:** `AC-HOME-001`, `AC-HOME-002`, `AC-HCH-001`
- **Povinné testy:** Widget testy různých stavů Home v `test/presentation/home_screen_test.dart`
- **Zero-Cost kontrola:** Haechi běží 100% lokálně na pravidlech (0 Kč).
- **DoD:** Home zobrazuje správnou akční kartu podle fáze tripu a času.

---

### Fáze D: P0 Cestovní moduly

#### `TASK-MOD-01`: Travel Vault (Bezpečné lokální doklady)
- **Priorita:** P0 (Fáze D)
- **Cíl:** Implementovat bezpečné lokální nahrávání, šifrování a zobrazení PDF letenek a voucherů bez závislosti na Firebase Storage.
- **In-Scope:** Šifrování souborů AES-256, integrace `flutter_secure_storage`, integrovaný offline PDF prohlížeč.
- **Out-of-Scope:** Cloudové nahrávání velkých souborů.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/documents/*`
- **Navázaná REQ ID:** `REQ-VLT-001`, `REQ-VLT-002`, `REQ-VLT-003`
- **Navázaná AC ID:** `AC-VLT-001`, `AC-VLT-002`, `AC-VLT-003`
- **Povinné testy:** Unit testy šifrování a čtení v `test/documents/vault_test.dart`
- **Zero-Cost kontrola:** 100% lokální úložiště, nulové poplatky za cloud storage.
- **DoD:** Letenky a vouchery jsou bezpečně uloženy a okamžitě čitelné offline.

#### `TASK-MOD-02`: Emergency Center, Home Base a Rychlé karty
- **Priorita:** P0 (Fáze D)
- **Cíl:** Vytvořit nouzové centrum s rychlým voláním (112, 119), celoobrazovkovou Taxi Card s korejskou adresou a zdravotními kartami 4 členů.
- **In-Scope:** `EmergencyCenterScreen`, `TaxiCardScreen`, Show to Local integrace, offline data.
- **Out-of-Scope:** Živá telemedicína.
- **Závislosti:** `TASK-UI-01`
- **Dotčené soubory:** `lib/features/emergency/*`
- **Navázaná REQ ID:** `REQ-TRIP-003`, `REQ-CRD-001`, `REQ-EMG-001`, `REQ-EMG-002`, `REQ-EMG-003`
- **Navázaná AC ID:** `AC-TRIP-003`, `AC-CRD-001`, `AC-EMG-001`, `AC-EMG-002`, `AC-EMG-003`
- **Povinné testy:** Widget testy nouzových obrazovek v `test/emergency/emergency_screen_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Taxi karta a tísňová volání jsou dostupné do 2 vteřin od spuštění aplikace.

#### `TASK-MOD-03`: Budget & Výdaje (KRW Split a vyrovnání dluhů)
- **Priorita:** P0 (Fáze D)
- **Cíl:** Implementovat evidenci výdajů ve více měnách, rovný i vlastní split, výpočet vyrovnání dluhů a export.
- **In-Scope:** Matematický kalkulátor splitu, zaokrouhlování na celé wony, správa výdajů v DB.
- **Out-of-Scope:** Bankovní API platby.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/budget/*`
- **Navázaná REQ ID:** `REQ-BDG-001`, `REQ-BDG-002`
- **Navázaná AC ID:** `AC-BDG-001`, `AC-BDG-002`
- **Povinné testy:** Unit testy kalkulátoru v `test/budget/budget_calculator_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Výdaj rozdělený mezi 4 osoby přesně spočítá zůstatky a navrhne minimální transakce.

#### `TASK-MOD-04`: Korean Companion, Food Guide a Survival Guide (JSON balíčky)
- **Priorita:** P0 (Fáze D)
- **Cíl:** Načítání a vyhledávání v lokálních statických JSON balíčcích frází, jídel s alergeny a survival tipů (metro, T-money, etiketa).
- **In-Scope:** JSON parsery, vyhledávání, filtry alergenů a pálivosti, přehrávání audia, Show to Local.
- **Out-of-Scope:** Online stahování nových databází.
- **Závislosti:** `TASK-UI-01`
- **Dotčené soubory:** `lib/features/korean/*`
- **Navázaná REQ ID:** `REQ-KOR-001`, `REQ-KOR-002`, `REQ-KOR-003`, `REQ-SRV-001`
- **Navázaná AC ID:** `AC-KOR-001`, `AC-KOR-002`, `AC-KOR-003`, `AC-SRV-001`
- **Povinné testy:** Unit testy načítání a vyhledávání v `test/korean/content_loader_test.dart`
- **Zero-Cost kontrola:** 100% lokální assety.
- **DoD:** Všechny fráze i jídla jsou offline prohledávatelné s okamžitou odezvou.

#### `TASK-MOD-05`: Checklist a Readiness Center
- **Priorita:** P0 (Fáze D)
- **Cíl:** Implementovat správu společných i osobních úkolů a vyhodnocování celkové připravenosti cesty.
- **In-Scope:** CRUD úkolů v DB, logika výpočtu 4 úrovní připravenosti (Hotovo až Kritické).
- **Out-of-Scope:** Automatická synchronizace s externími kalendáři.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/checklist/*`, `lib/features/readiness/*`
- **Navázaná REQ ID:** `REQ-CHK-001`, `REQ-CHK-002`
- **Navázaná AC ID:** `AC-CHK-001`, `AC-CHK-002`
- **Povinné testy:** Unit testy kalkulátoru připravenosti v `test/readiness/readiness_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Checklist správně aktualizuje stav v DB a promítá se do indikátoru připravenosti.

#### `TASK-MOD-06`: Offline Trip Pack Manager a Sync Center UI
- **Priorita:** P0 (Fáze D)
- **Cíl:** Vytvořit obrazovku diagnostiky synchronizace (Sync Center) a kontrolu celistvosti Offline Trip Packu.
- **In-Scope:** `SyncCenterScreen`, zobrazení stavu outboxu, manuální sync, kontrola manifestu offline balíčku.
- **Out-of-Scope:** Peer-to-peer Wi-Fi synchronizace.
- **Závislosti:** `TASK-CORE-02`
- **Dotčené soubory:** `lib/features/sync/*`, `lib/features/offline/*`
- **Navázaná REQ ID:** `REQ-OFF-001`, `REQ-OFF-003`
- **Navázaná AC ID:** `AC-OFF-001`, `AC-OFF-003`
- **Povinné testy:** Widget testy Sync Centra v `test/sync/sync_center_screen_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Uživatel vidí přesný počet čekajících změn a stav offline připravenosti.

#### `TASK-MOD-07`: Memories Journal a Zálohovací Engine (Backup & Restore)
- **Priorita:** P0 (Fáze D)
- **Cíl:** Implementovat denní kroniku s fotkami a bezpečný ZIP export/import kompletního stavu tripu pro obnovu na novém zařízení.
- **In-Scope:** Lokální ukládání zápisků a fotek, šifrovaný ZIP archiv, validace hashů integrity při obnově.
- **Out-of-Scope:** Cloudové neomezené fotogalerie.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/memories/*`, `lib/core/backup/*`
- **Navázaná REQ ID:** `REQ-MEM-001`, `REQ-MEM-002`, `REQ-BAK-001`, `NFR-RESIL-001`
- **Navázaná AC ID:** `AC-MEM-001`, `AC-MEM-002`, `AC-BAK-001`, `AC-NFR-RESIL`
- **Povinné testy:** Round-trip test zálohy a obnovy v `test/backup/backup_restore_test.dart`
- **Zero-Cost kontrola:** 100% lokální archivace.
- **DoD:** Celý trip lze vyexportovat do ZIP souboru a bezchybně obnovit na čisté instalaci.

---

### Fáze E: P1 Chytré moduly

#### `TASK-P1-01`: Camera Companion s Google ML Kit OCR a lokálním překladem
- **Priorita:** P1 (Fáze E)
- **Cíl:** Integrovat `google_mlkit_text_recognition` pro on-device rozpoznání korejského textu a dohledání v lokální encyklopedii.
- **In-Scope:** Snímání kamery, on-device OCR model, extrakce textu, dohledání v jídlech a frázích, označení strojového překladu.
- **Out-of-Scope:** Placené cloudové Vision API.
- **Závislosti:** `TASK-MOD-04`
- **Dotčené soubory:** `lib/features/camera/*`, `lib/features/korean/services/*`
- **Navázaná REQ ID:** `REQ-CAM-001`, `REQ-CAM-002`, `REQ-CAM-003`
- **Navázaná AC ID:** `AC-CAM-001`, `AC-CAM-002`, `AC-CAM-003`
- **Povinné testy:** Mockované testy OCR parseru v `test/camera/ocr_service_test.dart`
- **Zero-Cost kontrola:** Google ML Kit běží 100% on-device pod licencí Apache-2.0.
- **DoD:** Vyfocený text Hangul je do 1 vteřiny rozpoznán a vyhledán v lokálním katalogu.

#### `TASK-P1-02`: OCR Účtenek a formulář výdajů
- **Priorita:** P1 (Fáze E)
- **Cíl:** Vytěžení částky, měny a data z fotky účtenky pomocí on-device OCR s povinným manuálním potvrzením.
- **In-Scope:** Parser částek z korejských účtenek, formulářové předvyplnění.
- **Out-of-Scope:** Automatický zápis bez potvrzení.
- **Závislosti:** `TASK-MOD-03`, `TASK-P1-01`
- **Dotčené soubory:** `lib/features/budget/presentation/widgets/receipt_scanner.dart`
- **Navázaná REQ ID:** `REQ-BDG-003`
- **Navázaná AC ID:** `AC-BDG-003`
- **Povinné testy:** Testy regulárních výrazů parseru účtenek v `test/budget/receipt_parser_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Vyfocená účtenka předvyplní částku do formuláře výdaje k potvrzení.

#### `TASK-P1-03`: Trip Inbox a Klasifikační centrum
- **Priorita:** P1 (Fáze E)
- **Cíl:** Vytvořit sběrné místo pro odkazy, screenshoty a poznámky s možností jejich převodu na konkrétní entity.
- **In-Scope:** Inbox obrazovka, přijímání share intentů, konverze na Místo/Aktivitu/Výdaj.
- **Out-of-Scope:** Automatický e-mailový scraper.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/inbox/*`
- **Navázaná REQ ID:** `REQ-INB-001`, `REQ-INB-002`
- **Navázaná AC ID:** `AC-INB-001`, `AC-INB-002`
- **Povinné testy:** Unit testy konverzní logiky v `test/inbox/inbox_converter_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Odkaz uložený v Inboxu lze jedním kliknutím převést na Místo v itineráři.

#### `TASK-P1-04`: Group Decision Center a Správa sporů
- **Priorita:** P1 (Fáze E)
- **Cíl:** Sjednotit nerozhodná hlasování, nepotvrzené aktivity a sporné výdaje do přehledného modulu rozhodování.
- **In-Scope:** `GroupDecisionCenterScreen`, agregace sporných stavů, hromadné schválení.
- **Out-of-Scope:** Komunikační chat.
- **Závislosti:** `TASK-CORE-01`, `TASK-MOD-03`
- **Dotčené soubory:** `lib/features/decisions/*`
- **Navázaná REQ ID:** `REQ-PLC-003`
- **Navázaná AC ID:** `AC-PLC-003`
- **Povinné testy:** Widget testy rozhodovacího centra v `test/decisions/decision_center_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Všechny nerozhodné položky tripu jsou přehledně zobrazeny a řešitelné.

#### `TASK-P1-05`: Smart Itinerary a detekce kolizí
- **Priorita:** P1 (Fáze E)
- **Cíl:** Implementovat pravidlové vysvětlitelné návrhy řazení aktivit, geoshlukování a detekci časových konfliktů.
- **In-Scope:** Geografický shlukovací algoritmus, vizuální detekce konfliktů, podpora akcí Přijmout/Odmítnout/Undo.
- **Out-of-Scope:** Cloudový AI plánovač.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/trip_days/services/smart_itinerary_service.dart`
- **Navázaná REQ ID:** `REQ-PLAN-003`, `REQ-PLAN-004`
- **Navázaná AC ID:** `AC-PLAN-003`, `AC-PLAN-004`
- **Povinné testy:** Algoritmické testy detekce kolizí a řazení v `test/itinerary/smart_itinerary_test.dart`
- **Zero-Cost kontrola:** 100% lokální algoritmus.
- **DoD:** Časový konflikt aktivit je okamžitě zvýrazněn a návrh optimalizace nabízí Undo.

#### `TASK-P1-06`: Mapy (Online a Offline Map Lite)
- **Priorita:** P1 (Fáze E)
- **Cíl:** Zobrazit body aktivit a Home Base na interaktivní mapě s podporou Offline Map Lite zobrazení.
- **In-Scope:** Mapový widget, vykreslení bodů a denních spojnic, offline fallback, tlačítko externí navigace.
- **Out-of-Scope:** Vlastní tranzitní live routing.
- **Závislosti:** `TASK-CORE-01`
- **Dotčené soubory:** `lib/features/places/presentation/widgets/map_view.dart`
- **Navázaná REQ ID:** `REQ-PLC-004`, `REQ-MAP-001`
- **Navázaná AC ID:** `AC-PLC-004`, `AC-MAP-001`
- **Povinné testy:** Widget test mapového zobrazení v `test/places/map_view_test.dart`
- **Zero-Cost kontrola:** Využívá bezplatné mapové podklady a nativní URL schémata.
- **DoD:** Body jsou vykresleny na mapě a kliknutím otevírají Naver Map / KakaoMap.

#### `TASK-P1-07`: Adaptér Počasí (Open-Meteo API)
- **Priorita:** P1 (Fáze E)
- **Cíl:** Načítání předpovědi počasí z bezplatného Open-Meteo API s offline cache a bezpečným výpadkem.
- **In-Scope:** `WeatherService`, REST klient, cachování do DB, zobrazení času aktualizace.
- **Out-of-Scope:** Placené radarové snímky.
- **Závislosti:** `TASK-UI-02`
- **Dotčené soubory:** `lib/core/services/weather_service.dart`
- **Navázaná REQ ID:** `REQ-WTH-001`
- **Navázaná AC ID:** `AC-WTH-001`
- **Povinné testy:** Testy HTTP klienta a fallbacku v `test/services/weather_service_test.dart`
- **Zero-Cost kontrola:** Open-Meteo je bezplatné pro nekomerční použití bez API klíče.
- **DoD:** Při výpadku sítě aplikace plynule zobrazí poslední stažené počasí.

#### `TASK-P1-08`: Mobilní generování tisknutelného PDF Trip Booku
- **Priorita:** P1 (Fáze E)
- **Cíl:** Generování vícestránkového pamětního PDF z denní kroniky, fotek a statistik přímo na zařízení pomocí knihovny `pdf`.
- **In-Scope:** PDF builder, šablona fotoknihy, exportní dialog a tiskový náhled.
- **Out-of-Scope:** Cloudový rendering.
- **Závislosti:** `TASK-MOD-07`
- **Dotčené soubory:** `lib/features/memories/services/pdf_trip_book_generator.dart`
- **Navázaná REQ ID:** `REQ-MEM-003`, `REQ-MEM-004`
- **Navázaná AC ID:** `AC-MEM-003`, `AC-MEM-004`
- **Povinné testy:** Test generování PDF dokumentu v `test/memories/pdf_generator_test.dart`
- **Zero-Cost kontrola:** 100% on-device generování v Dartu.
- **DoD:** Mobil vygeneruje platný tisknutelný PDF soubor s fotkami a mapou cesty.

---

### Fáze F: Mobilní Hardening, Bezpečnost a Release Candidate

#### `TASK-SEC-01`: Bezpečnostní audit a ověření Firestore pravidel
- **Priorita:** P0 (Fáze F)
- **Cíl:** Otestovat `firestore.rules` pomocí emulátoru, prověřit šifrování lokálních dokladů a vyloučit logování osobních dat.
- **In-Scope:** Unit testy Firestore pravidel, kontrola repozitáře na přítomnost klíčů.
- **Out-of-Scope:** Penetrační testy třetích stran.
- **Závislosti:** Všechny P0 a P1 úkoly
- **Dotčené soubory:** `firestore.rules`, `lib/core/utils/logger.dart`
- **Navázaná REQ ID:** `NFR-COST-001`, `NFR-SEC-001`
- **Navázaná AC ID:** `AC-NFR-COST`, `AC-NFR-SEC`
- **Povinné testy:** Bezpečnostní testy pravidel v `test/security/firestore_rules_test.dart`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Neautorizovaný uživatel nemá přístup k datům tripu; v kódu nejsou tajné údaje.

#### `TASK-REL-01`: Testování přístupnosti a sestavení Release Candidate
- **Priorita:** P0 (Fáze F)
- **Cíl:** Prověřit aplikaci při 150% škálování písma, otestovat offline odolnost na reálných telefonech a sestavit finální release APK/AAB.
- **In-Scope:** A11y testy, testy nedostatku místa na disku, release build Android APK.
- **Out-of-Scope:** Desktopová distribuce (ta je P2).
- **Závislosti:** `TASK-SEC-01`
- **Dotčené soubory:** Celý projekt
- **Navázaná REQ ID:** `NFR-A11Y-001`, `NFR-PLAT-001`, `NFR-RESIL-001`
- **Navázaná AC ID:** `AC-NFR-A11Y`, `AC-NFR-PLAT`, `AC-NFR-RESIL`
- **Povinné testy:** `flutter test`, `flutter build apk --release`
- **Zero-Cost kontrola:** 100% soulad.
- **DoD:** Aplikace je sestavitelná v release režimu, splňuje všechna NFR kritéria a je připravena pro 4 uživatele.

# SeoulMate v2.0 — Integrace a datové zdroje (Integrations & Data Sources)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Registr nulových nákladů:** [ZERO_COST_REGISTER.md](ZERO_COST_REGISTER.md)

---

## 1. Souhrnná matice externích integrací

| Služba / Knihovna | Účel integrace | Režim provozu | Cenový model | Fallback při výpadku |
|---|---|---|---|---|
| **Google ML Kit** | On-device OCR rozpoznání Hangulu | 100% Lokální (On-Device) | Bezplatné SDK (Apache-2.0 wrapper) | Ruční výběr ze seznamu |
| **Open-Meteo API** | Předpověď počasí pro Soul/Busan | Online REST (Volitelné) | Bezplatné (0 Kč, bez API klíče) | Zobrazení cache s časem aktualizace |
| **Naver Map / KakaoMap** | Nativní navigace a pěší trasy | Deep link přes `url_launcher` | Bezplatné spuštění aplikace | Zobrazení Offline Map Lite souřadnic |
| **Firebase Cloud Firestore** | Asynchronní Outbox synchronizace | Online (Dávkový zápis) | Bezplatný Spark plán (0 Kč) | Plně funkční lokální Drift DB |
| **Firebase Auth** | Přihlášení 4 členů tripu | Online / Cached session | Bezplatný Spark plán (0 Kč) | Použití lokálně uloženého tokenu |
| **pdf / printing** | Generování PDF Trip Booku | 100% Lokální (Dart) | Open Source (Apache-2.0 / MIT) | Žádný fallback není třeba |

---

## 2. Podrobný rozbor integrací

### 2.1 Google ML Kit (Text Recognition v2)
- **Licence a podmínky:** Balíček `google_mlkit_text_recognition` je licencován pod **Apache-2.0**. Podkladové knihovny ML Kit pro Android a iOS běží přímo na zařízení pod podmínkami Google ML Kit Terms.
- **Podpora korejštiny:** Využívá skriptový modul `TextRecognitionScript.korean`.
- **Garance soukromí a nákladů:** Žádné obrázky ani naskenované účtenky se neodesílají na cloudové servery. Nulové náklady (0 Kč).

### 2.2 Open-Meteo API (Počasí)
- **Endpoint:** `https://api.open-meteo.com/v1/forecast?latitude=37.5665&longitude=126.9780&current_weather=true&hourly=precipitation_probability`
- **Bezpečnostní pravidlo:** Selhání HTTP požadavku nikdy nezpůsobí pád aplikace. Uživatel vidí poslední staženou předpověď s časovým razítkem (např. *„Aktualizováno dnes v 08:30“*).

### 2.3 Nativní korejské mapové aplikace (Naver Map & KakaoMap)
- **Mechanismus:** Spouštění pomocí standardních schémat:
  - Naver Map: `nmap://place?lat={lat}&lng={lng}&name={encoded_name}&appname=cz.seoulmate.app`
  - KakaoMap: `kakaomap://look?p={lat},{lng}`
  - Google Maps: `geo:{lat},{lng}?q={lat},{lng}({encoded_name})`
- Pokud externí aplikace není nainstalována, otevře se webový odkaz v prohlížeči nebo interní zobrazení **Offline Map Lite**.

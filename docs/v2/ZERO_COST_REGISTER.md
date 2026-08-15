# SeoulMate v2.0 — Registr nulových provozních nákladů (Zero-Cost Register)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)  
**Rozhodnutí:** [DECISIONS.md](DECISIONS.md)

---

## 1. Zero-Cost Gate pravidla

Všechny externí služby, SDK a knihovny musí projít 10 kontrolními otázkami Zero-Cost Gate. Žádná kritická funkce nesmí vyžadovat placený tarif, platební kartu ani automatické účtování (Auto-billing).

---

## 2. Podrobný audit a integrační karty

### 2.1 Firebase Cloud Storage — NESCHVÁLENO PRO CÍLOVOU ARCHITEKTURU
- **Oficiální zdroj:** [Firebase Storage FAQ Changes](https://firebase.google.com/docs/storage/faqs-storage-changes-announced-sept-2024) *(Ověřeno: 15. srpna 2026)*.
- **Zjištěný stav:** Cloud Storage for Firebase vyžaduje přechod na tarif Blaze (Pay-as-you-go) s povinně připojenou platební kartou. Na bezplatném Spark plánu není Cloud Storage dostupný pro nové integrace bez platební karty.
- **Klasifikace pro v1 kód:** `REMOVE / DISABLE`. Balíček `firebase_storage` přítomný ve v1 `pubspec.yaml` představuje nákladové riziko a v rámci migrace bude odstraněn nebo deaktivován.
- **Cílové řešení pro v2:** Modul Travel Vault a fotky v Memories ukládají veškeré soubory (PDF letenek, fotky) **100% lokálně na zašifrovaný disk zařízení** s možností ručního ZIP exportu/importu. Žádné cloudové úložiště souborů není v cílové v2 architektuře vyžadováno.

### 2.2 Firebase Cloud Firestore — PODMÍNĚNĚ SCHVÁLENO V RÁMCI SPARK TIERU
- **Oficiální zdroj:** [Firebase Pricing](https://firebase.google.com/pricing) *(Ověřeno: 15. srpna 2026)*.
- **Bezplatné limity (Spark Tier bez platební karty):**
  - Čtení dokumentů: 50 000 / den
  - Zápisy dokumentů: 20 000 / den
  - Mazání: 20 000 / den
  - Úložiště dat: 1 GiB celkem
- **Podmínka bezplatnosti:** UI nikdy nečte přímo z Firestore! Veškeré zobrazení a vyhledávání probíhá z lokální SQLite (Drift) databáze. Firestore slouží výhradně jako asynchronní Outbox synchronizér pro 4 uživatele, čímž denní spotřeba nepřekročí 200–500 operací (< 1 % bezplatného limitu). Při vyčerpání limitu aplikace plynule pokračuje v lokálním režimu.

### 2.3 Firebase Authentication — SCHVÁLENO
- **Oficiální zdroj:** [Firebase Pricing](https://firebase.google.com/pricing) *(Ověřeno: 15. srpna 2026)*.
- **Limity:** Neomezený počet uživatelů pro e-mail/heslo (Email/Password Auth) na Spark plánu bez karty.
- **Verdikt:** 100% bezplatné pro 4 přátele.

### 2.4 Google ML Kit (Text Recognition) — SCHVÁLENO PRO ON-DEVICE PROVOZ
Při integraci jsou striktně odděleny 4 vrstvy:
1. **Podmínky Google ML Kit SDK:** [Google ML Kit Terms](https://developers.google.com/ml-kit/terms) *(Ověřeno: 15. srpna 2026)* — On-device rozhraní je bezplatné, nevyžaduje žádný Google Cloud projekt, platební kartu ani síťové volání.
2. **Licence Flutter wrapperu:** Balíček `google_mlkit_text_recognition` je licencován pod **Apache-2.0** licencí.
3. **Podpora korejského OCR:** Google ML Kit Text Recognition v2 podporuje korejské písmo (Hangul) prostřednictvím volitelného skriptového modelu `TextRecognitionScript.korean`.
4. **On-device provoz:** Veškeré rozpoznávání obrazu běží 100% lokálně na CPU/GPU mobilního telefonu. Žádná data ani fotky se neodesílají na internet.

### 2.5 Open-Meteo API (Předpověď počasí) — SCHVÁLENO JAKO VOLITELNÝ DOPLNĚK
- **Oficiální zdroj:** [Open-Meteo Pricing](https://open-meteo.com/en/pricing) *(Ověřeno: 15. srpna 2026)*.
- **Limity:** Až 10 000 volání denně zdarma bez nutnosti registrace a bez API klíče.
- **Fallback:** Aplikace ukládá předpověď do mezipaměti; výpadek sítě neovlivní žádné cestovní workflow.

### 2.6 Nativní mapové integrace (Naver Map, KakaoMap, Google Maps) — SCHVÁLENO
- **Způsob integrace:** Spouštění nainstalovaných nativních aplikací přes `url_launcher` (BSD-3-Clause) s GPS parametry.
- **Náklady:** 0 Kč.

### 2.7 Mobilní generování PDF (`pdf` + `printing`) — SCHVÁLENO
- **Licence:** Apache-2.0 / MIT.
- **Náklady:** 0 Kč (veškerý rendering a export probíhá v Dartu přímo v paměti telefonu).

---

## 3. Souhrnné vyhodnocení

Žádná součást specifikované aplikace SeoulMate v2.0 nevyžaduje platební kartu, placené tarify ani nezpůsobí nečekané poplatky. Provozní náklady pro 4 uživatele jsou přesně **0 Kč**.

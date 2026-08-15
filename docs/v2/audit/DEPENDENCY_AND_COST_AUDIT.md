# SeoulMate v2.0 — Audit závislostí a provozních nákladů (Dependency & Cost Audit)

**Datum auditu:** 15. srpna 2026  
**Stav:** VERIFIED  
**Auditor:** Antigravity Architecture Lead  
**Nadřazený dokument:** [../00_MASTER_PLAN.md](../00_MASTER_PLAN.md)  
**Registr nulových nákladů:** [../ZERO_COST_REGISTER.md](../ZERO_COST_REGISTER.md)

---

## 1. Audit balíčků v `pubspec.yaml` (v1.0 Baseline)

| Balíček | Verze | Účel ve v1.0 | Vyhodnocení pro v2.0 | Doporučený postup |
|---|---|---|---|---|
| `firebase_storage` | `^13.4.5` | Cloudové úložiště souborů | **NÁKLADOVÉ RIZIKO (BLAZE POŽADOVÁNO)** — Podle [oficiální dokumentace Firebase](https://firebase.google.com/docs/storage/faqs-storage-changes-announced-sept-2024) vyžaduje Cloud Storage tarif Blaze a platební kartu. | **Kandidát na REMOVE / DISABLE**. V2 ukládá soubory 100% lokálně. |
| `cloud_firestore` | `^6.7.1` | Cloudová databáze | **PODMÍNĚNĚ BEZPEČNÉ V RÁMCI SPARK LIMITŮ** — 50k čtení/den, 20k zápisů/den dle [Firebase Pricing](https://firebase.google.com/pricing). | **KEEP s úpravou**: UI čte z lokální Drift DB, Firestore slouží pouze pro asynchronní Outbox sync. |
| `firebase_auth` | `^6.5.6` | Autentizace 4 členů | **100% BEZPLATNÉ** — Neomezený počet uživatelů pro e-mail/heslo bez nutnosti karty. | **KEEP**: Ponechat pro přihlášení 4 přátel. |
| `firebase_messaging`| `^16.4.3` | Push notifikace | **100% BEZPLATNÉ** — FCM je bezplatné bez limitu. | **KEEP**: Využít pro notifikace změn v itineráři. |
| `flutter_riverpod` | `^3.3.2` | Stavový management | Open Source (MIT) — 0 Kč. | **KEEP**: Zachovat jako výchozí stavový framework. |
| `go_router` | `^17.3.0` | Navigace | Open Source (BSD-3-Clause) — 0 Kč. | **KEEP**: Zachovat pro deklarativní routing. |
| `freezed_annotation`| `^3.1.0` | Imutabilní modely | Open Source (MIT) — 0 Kč. | **KEEP**: Zachovat pro doménové modely. |
| `shared_preferences`| `^2.5.4` | Klíč-hodnota | Open Source (BSD-3-Clause) — 0 Kč. | **KEEP**: Využít pro nastavení aplikace. |

---

## 2. Doporučené balíčky pro v2.0 a Zero-Cost ověření

| Plánovaný balíček | Účel | Licence | Náklady & Limity |
|---|---|---|---|
| `drift` + `sqlite3_flutter_libs` | Lokální relační databáze (Local-First jádro) | MIT / BSD | **0 Kč** — Běží 100% lokálně na zařízení. |
| `google_mlkit_text_recognition` | On-device OCR korejštiny a účtenek | **Apache-2.0** | **0 Kč** — Google ML Kit běží on-device bez síťových požadavků a poplatků. |
| `pdf` + `printing` | Mobilní generování a tisk PDF Trip Booku | Apache-2.0 / MIT | **0 Kč** — Vykreslování probíhá přímo v paměti mobilu. |
| `url_launcher` | Otevírání map (Naver Map, KakaoMap, Google Maps) | BSD-3-Clause | **0 Kč** — Využívá nainstalované nativní aplikace. |
| `flutter_secure_storage` | Bezpečné úložiště šifrovacích klíčů | BSD-3-Clause | **0 Kč** — Využívá Android Keystore a iOS Keychain. |

---

## 3. Závěr nákladového auditu

1. Odstraněním nebo zakázáním `firebase_storage` je eliminováno jediné přímé riziko zpoplatnění.
2. Veškeré ostatní služby a knihovny zaručují, že provoz SeoulMate v2.0 pro 4 uživatele bude stát **přesně 0 Kč** a nebude vyžadovat zadání platební karty.

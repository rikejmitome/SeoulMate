# SeoulMate v2.0 — Bezpečnost a ochrana soukromí (Security & Privacy)

**Verze:** 2.0  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 15. srpna 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Zabezpečení dat a šifrování na zařízení

### 1.1 Lokální šifrování Travel Vaultu (AES-256)
- Veškeré soubory nahrané do Travel Vaultu (letenky, boarding passy, hotelové vouchery, pojistky) jsou ukládány v chráněném adresáři aplikace zašifrované symetrickým klíčem AES-256-GCM.
- Hlavní šifrovací klíč je generován při inicializaci tripu a uložen v hardwarově chráněném úložišti platformy:
  - **Android:** Android Keystore (`EncryptedSharedPreferences` / `flutter_secure_storage`).
  - **iOS:** iOS Keychain Services s ochranou `kSecAccessControlBiometryAny`.

### 1.2 Ochrana před reverzním inženýrstvím a zákazy
- **Zákaz ukládání tajemství do repozitáře:** Žádné privátní klíče, Firebase tokeny ani hesla nesmí být commitnuty do Gitu.
- **Zákaz logování PII:** V release buildech je zakázáno logovat jména cestovatelů, čísla pasů, rodná čísla a zdravotní údaje do konzole.

---

## 2. Bezpečnostní pravidla Cloud Firestore (`firestore.rules`)

Pravidla striktně omezují přístup pouze pro 4 autorizované členy daného tripu:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Pomocná funkce pro ověření členství v tripu
    function isTripMember(tripId) {
      return request.auth != null && 
        exists(/databases/$(database)/documents/trips/$(tripId)/members/$(request.auth.uid));
    }

    // Kolekce Trips
    match /trips/{tripId} {
      allow read, write: if isTripMember(tripId);

      // Vnořené podkolekce (aktivity, místa, výdaje, hlasování)
      match /{subcollection}/{docId} {
        allow read, write: if isTripMember(tripId);
      }
    }
  }
}
```

---

## 3. Export a záloha s kontrolou integrity

Při vytváření exportního ZIP balíčku:
1. Všechny soubory jsou zabaleny do standardního archivu s heslem zadaným uživatelem.
2. V archivu je přítomen soubor `checksums.sha256` se SHA-256 kontrolními součty všech vnitřních entit.
3. Při obnově na novém telefonu aplikace nejprve zvaliduje shodu kontrolních součtů a odmítne import poškozeného či modifikovaného souboru.

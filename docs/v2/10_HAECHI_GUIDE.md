# SeoulMate v2.0 — Bomi / Haechi Guide

**Verze:** 2.1  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 3. listopadu 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Design systém:** [09_DESIGN_SYSTEM.md](09_DESIGN_SYSTEM.md)

---

## 1. Finální rozhodnutí

Finální maskot SeoulMate se jmenuje **Bomi**.

Bomi je vlastní moderní interpretace korejského Haechiho. Má být rozpoznatelně inspirovaný moderním soulským Haechim, ale nesmí být jeho přesnou kopií. V SeoulMate představuje klidného, přátelského a spolehlivého parťáka na cestách.

Bomi není cloudový AI chatbot. Je vizuální a kontextový průvodce řízený lokálními pravidly a připravenými texty.

---

## 2. Závazná podoba

Bomi musí zachovat jednoduchý, měkký a snadno čitelný design.

### Silueta
- kulaté měkké tělo;
- lehce vyšší a vyváženější než extrémně nízký „blob“;
- krátké ruce/nohy;
- velké světlé bříško;
- dvě malá rozpoznatelná křídla;
- středně dlouhý měkce zahnutý pruhovaný ocas;
- dva malé až střední rohy.

### Obličej
- středně velké jednoduché oválné oči;
- klidný, laskavý výraz;
- jemný úsměv;
- malý růžový čumáček;
- dva drobné zoubky;
- jemné tvářičky;
- žádné anime oči ani realistická zvířecí tlama.

### Hříva
Bomi nemá velkou huňatou lví hřívu. Charakter tvoří jednoduché modrozelené prvky a rohy. Pokud je naznačena hříva, musí zůstat velmi jednoduchá a sekundární.

### Povrch
- jemné barevné obrysy;
- měkké stínování;
- bez realistické srsti;
- detailní ilustrace mohou mít velmi subtilní texturu papíru/štětcové kresby.

---

## 3. Barevnost Bomiho

Závazná paleta:

| Token | Hex | Použití |
|---|---|---|
| Bomi Pink | `#F5A6B5` | hlavní tělo |
| Bomi Light Pink | `#F9D6E0` | měkké sekundární růžové tóny |
| Bomi Teal | `#6EC2C1` | rohy, ocasové pruhy, drobné detaily |
| Bomi Deep Teal | `#2E6072` | kontrastní teal detaily |
| Bomi Cream | `#FFF6F0` | bříško a světlé části |

Křídla mohou používat tlumenou růžovou/magenta variantu odvozenou od Bomi Pink. Barvy nesmí být neonové.

---

## 4. Osobnost

Bomi je:
- měkký;
- přátelský;
- klidný;
- laskavý;
- společenský;
- podporující;
- zvědavý;
- lehce hravý.

Bomi není:
- hyperaktivní;
- hlučný;
- sarkastický;
- infantilní;
- mentorující;
- vševědoucí;
- autorita nad uživatelem.

Jeho základní pocit je: **„Jsem tady s tebou a pomůžu ti.“**

---

## 5. Přítomnost v aplikaci

Bomi má střední vizuální přítomnost.

Objevuje se:
- Home / „Co teď?“;
- onboarding;
- empty states;
- tipy;
- achievementy;
- připomínky;
- offline pomoc;
- úspěšné dokončení;
- Memories.

Na Home:
- Bomi je vlevo;
- text a CTA vpravo;
- je podpůrný, ne dominantní.

Bomi nesmí rušit:
- Emergency;
- Show to Local;
- husté formuláře;
- mapu;
- zobrazení dokumentu/QR.

---

## 6. Pózy

Povinná základní sada:
1. stojí;
2. sedí;
3. vítá / mává;
4. objímá srdce;
5. leží / odpočívá;
6. ukazuje směr;
7. drží mapu;
8. drží deštník;
9. fotografuje;
10. drží teplý nápoj;
11. slaví úspěch;
12. zamyšlený;
13. překvapený;
14. klidný/spokojený;
15. offline / čeká.

Bomi nemá permanentní doplněk.

Situační předměty:
- mapa;
- batůžek;
- fotoaparát;
- deštník;
- hrnek;
- deka;
- srdce;
- malý kufr.

Předměty mají jednoduchý styl sladěný s aplikací.

---

## 7. Výrazy

Základní sada:
- jemný úsměv;
- radost;
- zvědavost;
- překvapení;
- zamyšlení;
- spokojenost;
- povzbuzení;
- lehká obava;
- ospalost.

Emoce musí být čitelné i v malém měřítku, ale nesmí být přehnaně komiksové.

---

## 8. Kontextové stavy

| Stav | Použití | Charakter reakce |
|---|---|---|
| welcome | první spuštění / nový den | klidné přivítání |
| preparation | Dream | připomínka bez nátlaku |
| cheer | dokončení úkolu | krátká pochvala |
| warning | konflikt/chybějící věc | věcný a klidný |
| travel | Adventure | orientace a povzbuzení |
| rain | počasí | deštník / praktický tip |
| offline | bez sítě | ujištění, co stále funguje |
| sync_error | čekající sync | transparentní vysvětlení |
| day_completed | konec dne | oslava bez přehánění |
| achievement | milestone | radost |
| homecoming | Memories | teplá nostalgie |

---

## 9. Textový tón

- maximálně 2 krátké věty;
- běžně do 120 znaků;
- čeština přirozená, ne marketingová;
- nepoužívat infantilní zdrobněliny;
- korejská slova pouze pokud dávají smysl a jsou správně;
- nikdy nezakrývat závažnost Emergency, alergenu nebo chyby.

Příklady:
- „Ahoj! Dnes máte první aktivitu v 9:30.“
- „Jsi offline. Plán i uložené fráze máš pořád po ruce.“
- „Skvělé, dnešní plán je hotový.“
- „Má pršet. Deštník se dnes bude hodit.“

---

## 10. Animace

Bomi používá pouze krátké jemné animace:
- mávnutí;
- lehké poskočení;
- mrknutí;
- klidný breathing loop;
- krátké zavrtění ocasem;
- konfety jen při významném achievementu.

Animace musí respektovat Reduce Motion.

---

## 11. Velikosti

- icon / micro: 24–32 px, jen zjednodušená hlava/silueta;
- small: 64–96 px;
- medium: 140–220 px;
- large: 280–400 px jen onboarding, empty state nebo výrazný moment.

Bomi se nesmí zmenšit tak, že zaniknou rohy, oči nebo ocasové pruhy.

---

## 12. Zakázané varianty

Nepoužívat:
- huňatého realistického lva;
- velkou dlouhou hřívu;
- anime/chibi oči;
- výrazně humanoidní postavu;
- permanentní oblečení;
- permanentní batoh;
- agresivní rohy;
- neonové barvy;
- 3D plastový „toy“ styl jako hlavní vzhled;
- přehnaně dětský kawaii styl;
- přesnou kopii oficiálního soulského maskota.

---

## 13. Asset naming

Doporučené cesty:

```text
assets/images/bomi/
  bomi_reference_master.png
  bomi_welcome.webp
  bomi_preparation.webp
  bomi_cheer.webp
  bomi_warning.webp
  bomi_travel.webp
  bomi_rain.webp
  bomi_offline.webp
  bomi_sync_error.webp
  bomi_day_completed.webp
  bomi_achievement.webp
  bomi_homecoming.webp
  bomi_empty.webp
```

Zdrojové prompty, provenance a licence/usage notes musí být evidované v asset manifestu.

---

## 14. Source of truth

Při generování nebo kreslení dalších Bomi assetů platí pořadí:
1. tento dokument;
2. schválená master reference Bomiho;
3. Design System;
4. kontext konkrétní obrazovky.

Pokud nový asset mění proporce, rohy, oči, zoubky, bříško, křídla nebo pruhovaný ocas, není kompatibilní a musí být opraven.

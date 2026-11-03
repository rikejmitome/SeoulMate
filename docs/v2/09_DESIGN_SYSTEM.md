# SeoulMate v2.0 — Design System

**Verze:** 2.1  
**Stav:** APPROVED SPECIFICATION  
**Poslední aktualizace:** 3. listopadu 2026  
**Nadřazený dokument:** [00_MASTER_PLAN.md](00_MASTER_PLAN.md)  
**Maskot:** [10_HAECHI_GUIDE.md](10_HAECHI_GUIDE.md)  
**Rozcestník:** [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md)

---

## 1. Vizuální koncept

SeoulMate používá směr **Modern Korean Journey Companion**: moderní korejský mobilní design s lehce hravou osobností, prémiovým dojmem a vysokou praktičností v terénu.

Aplikace musí působit:
- moderně korejsky;
- přátelsky, ale ne dětsky;
- čistě, ale ne sterilně;
- prémiově, ale ne luxusně odtažitě;
- prakticky při používání jednou rukou;
- konzistentně ve světlém i tmavém režimu.

Korejská identita vzniká kombinací moderního Soulu a jemných tradičních motivů. Tradiční geometrie inspirovaná hanokem, oblouky a vlny se používají jako dekorativní vrstva na vybraných plochách, ne jako dominantní dekorace.

---

## 2. Základní paleta

### 2.1 Brand a neutrals

| Token | Hex | Použití |
|---|---|---|
| `cream-50` | `#FFF7EF` | hlavní světlé pozadí |
| `cream-100` | `#F8EFE5` | jemně oddělené plochy |
| `ink-900` | `#1E2A44` | hlavní text, primární tlačítka |
| `ink-700` | `#40506A` | sekundární text |
| `ink-500` | `#6C788A` | pomocný text, neaktivní ikony |
| `white` | `#FFFFFF` | karty a elevated surface |
| `border-light` | `#E9E0D6` | jemné rámečky |

### 2.2 Akcenty

| Token | Hex | Použití |
|---|---|---|
| `soft-blue` | `#A8C7F0` | Dream, informační akcent |
| `sage` | `#6CA087` | Adventure, pozitivní cestovní akce |
| `muted-pink` | `#F4B6C2` | Bomi, jemné emocionální akcenty |
| `peach` | `#FFD9C6` | Memories, teplé zvýraznění |
| `teal` | `#6EC2C1` | Bomi detaily, Companion |
| `deep-teal` | `#2E6072` | kontrastní teal, linky a detaily |

### 2.3 Fáze cesty

- **Dream:** `soft-blue`; pocit očekávání, plánování a lehkosti.
- **Adventure:** `sage`; pocit akce, orientace a praktičnosti.
- **Memories:** `peach` + `muted-pink`; pocit tepla, vzpomínek a emocí.

Fáze nemění základní komponentový systém. Mění akcenty, ilustrace a jemnou atmosféru.

### 2.4 Stavové barvy

| Stav | Hex | Pravidlo |
|---|---|---|
| Emergency / error | `#D84A57` | pouze kritické a nouzové stavy |
| Warning | `#D79A58` | upozornění bez bezprostředního nebezpečí |
| Success | `#5F987A` | dokončení, synchronizace, potvrzení |
| Info | `#5E91C9` | neutrální informace |

Červená není běžná brand barva a nesmí soutěžit s Emergency.

---

## 3. Dark mode

Dark mode je součást produktu od začátku. Nesmí být prostou inverzí světlého tématu.

| Token | Hex |
|---|---|
| `dark-bg` | `#17212B` |
| `dark-surface` | `#202D3A` |
| `dark-surface-elevated` | `#293847` |
| `dark-border` | `#394A5A` |
| `dark-text-primary` | `#F7F3ED` |
| `dark-text-secondary` | `#BAC3CD` |

Akcenty Dream, Adventure, Memories a Bomi se v dark mode používají ve snížené saturaci. Čistá černá se nepoužívá jako hlavní pozadí.

Uživatel má volbu:
1. podle systému;
2. světlý;
3. tmavý.

---

## 4. Typografie

Vizuál má být moderní, měkký a přátelský. Pro korejštinu se preferuje **Noto Sans KR**; pro latinku lze použít **Nunito Sans** nebo kompatibilní měkčí sans-serif. Pokud technická nebo licenční kontrola doporučí jeden společný font, musí zachovat stejnou náladu a plnou podporu Hangulu.

Doporučená hierarchie:

| Styl | Velikost | Weight | Použití |
|---|---:|---:|---|
| Display | 32 sp | 700 | velký Hangul v Show to Local |
| H1 | 28 sp | 700 | hlavní obrazovky |
| H2 | 22 sp | 700 | sekce, hlavní karta |
| H3 | 18 sp | 600 | názvy karet |
| Body L | 16 sp | 400 | důležitý běžný text |
| Body M | 14 sp | 400 | standardní text |
| Label | 12–13 sp | 600 | badge, metadata |

Pravidla:
- žádné dekorativní fonty v hlavním UI;
- Hangul musí mít dostatečný line-height;
- UI musí fungovat při zvětšení textu minimálně na 150 %;
- dekorativní Hangul se používá pouze se skutečným významem.

---

## 5. Grid, spacing a hustota

- základní jednotka: **4 dp**;
- hlavní spacing scale: 4, 8, 12, 16, 20, 24, 32, 40, 48;
- mobilní horizontal padding: **16 dp**;
- compact layout, ale bez vizuálního přetlaku;
- minimum touch target: **44×44 pt / 48×48 dp** podle platformy.

SeoulMate je středně kompaktní: na obrazovce má být dost informací pro cestování, ale sekce musí zůstat jasně oddělené.

---

## 6. Radius, border a elevation

### Radius
- hlavní a zvýrazněné karty: **20 dp**;
- běžné karty: **16 dp**;
- inputy: **14 dp**;
- tlačítka: **14–16 dp**;
- chips/capsules: plně zaoblené podle výšky.

### Borders
- jemný 1 px/dp border u ploch, kde stín nestačí;
- barevné rámečky jen pro stavový význam, ne jako dekorace.

### Shadows
Jemně vrstvené, krátké a měkké. Žádný „floating bubble“ efekt.
- low: opacity 4 %, blur 6, y 2;
- medium: opacity 7 %, blur 12, y 4;
- high pouze pro modal/bottom sheet.

---

## 7. Navigace

Primární mobilní navigace obsahuje vždy ikonu i text:

1. **Home**
2. **Plán**
3. **Místa**
4. **Průvodce / Companion**
5. **Trip Hub**

Styl:
- lehce plovoucí zaoblená spodní lišta;
- výška má být kompaktní;
- aktivní záložka používá jemnou barevnou kapsli;
- běžné ikony jsou line-art;
- labels zůstávají viditelné vždy;
- Emergency nesmí být schované hluboko v navigaci.

---

## 8. Home — „Co teď?“

Home není statistický dashboard.

Dominantní je jedna kontextová karta:
- Bomi vlevo;
- text, důvod a primární akce vpravo;
- jemný gradient;
- nenápadný korejský geometrický/vlnový pattern;
- barva podle fáze tripu.

Pod ní následují menší karty: počasí, další aktivita, fráze, Home Base, dokument, offline/sync stav apod.

Režim Dream / Adventure / Memories se v produkci určuje primárně podle kontextu a data tripu. Pokud existuje ruční přepínač, nesmí dominovat rozhraní.

---

## 9. Karty

### Standardní karty
- horizontální layout;
- thumbnail vlevo, informace vpravo;
- zaoblený obrázek;
- jasná hierarchie názvu, času, stavu a metadata.

### Featured karty
- vertikální;
- větší fotografie nebo ilustrace;
- použít střídmě.

### Fotografie
- realistické;
- lehce sjednocené do teplejšího tónu;
- nepoužívat agresivní filtry;
- vždy zachovat čitelnost textu nad obrázkem.

---

## 10. Tlačítka a akce

### Primary
- plná barva `ink-900`;
- bílý text;
- pouze jedna dominantní primary akce v rámci lokálního kontextu.

### Secondary
- outline;
- ink text/border nebo fázový akcent.

### Tertiary
- text / icon button bez plné plochy.

### Critical
- `#D84A57`;
- jen Emergency a destruktivní operace.

Pressed state používá jemné scale/opacity feedback, ne výraznou animaci.

---

## 11. Formuláře

- lehce tónovaná plocha;
- minimum těžkých borderů;
- label zůstává čitelný i po vyplnění;
- error musí obsahovat text, ne jen barvu;
- důležité formuláře musí podporovat save draft/local-first chování;
- klávesnice nesmí zakrývat CTA.

---

## 12. Ikony

- běžné funkce: čistý line-art;
- důležité akce: plnější, zaoblenější ikony;
- konzistentní stroke;
- ikona nesmí být jediným nositelem významu u kritické akce.

Mapové markery:
- oddálení: malé barevné category dots;
- přiblížení: zaoblený label s ikonou/kategorií.

---

## 13. Ilustrace a korejské motivy

Ilustrace:
- měkčí malovaný styl;
- stylizovaný a jemně pohádkový;
- moderní, ne dětský;
- lidé jen občas;
- hlavní témata: Bomi, Seoul, prostředí, kultura.

Použití:
- onboarding;
- Home;
- empty states;
- Memories;
- achievements;
- vybrané informační momenty.

Tradiční motivy jsou středně výrazné: viditelné na vybraných kartách, přechodech a ilustracích, ale nesmí být na každém prvku.

---

## 14. Bomi v UI

Bomi je důležitá součást značky, ale ne permanentní dekorace.

Použití:
- hlavní karta Home;
- onboarding;
- empty states;
- achievementy;
- potvrzení úspěchu;
- offline/error pomoc, pokud nebrání řešení;
- Memories.

Nepoužívat jako dominantní dekoraci:
- Emergency detail;
- husté formuláře;
- mapu s vysokou informační hustotou;
- Show to Local.

Přesná podoba je závazně definována v [10_HAECHI_GUIDE.md](10_HAECHI_GUIDE.md).

---

## 15. Empty, loading, error a offline states

### Empty
Malý Bomi + konkrétní užitečný text + jasná další akce.

### Loading
Skeletony, nikoli dlouhé spinnery. Bomi pouze u delších uživatelsky srozumitelných operací.

### Error
Bomi může reagovat empaticky, ale technické řešení musí být dominantní. Žádné vtipkování u závažných chyb.

### Offline
Jasně komunikovat:
- co stále funguje;
- co čeká na sync;
- kdy byla data naposledy aktualizována.

---

## 16. Emergency, dokumenty, QR a Show to Local

Emergency:
- stejné komponentové základy;
- jasný červený akcent;
- maximální čitelnost;
- minimum dekorací;
- kritická akce nesmí soupeřit s Bomi ilustrací.

Dokumenty a QR:
- praktické, čisté;
- malé SeoulMate detaily dovoleny;
- QR kód má vždy dostatečný quiet zone a kontrast.

Show to Local:
- prioritou je velký korejský text;
- minimum rozhraní;
- žádná dekorace, která snižuje čitelnost.

---

## 17. Motion, haptics a sound

Motion:
- jemný a rychlý;
- většinou 120–220 ms;
- easing bez pružinových přehnaných efektů;
- respektovat Reduce Motion.

Bomi:
- krátké mikroanimace jen v důležitých momentech.

Haptics:
- lehká odezva u hlavních akcí;
- dokončení;
- chyby;
- významná změna stavu.

Sound:
- velmi střídmě;
- jemný úspěch/achievement;
- vždy respektovat systémový silent mode a nastavení aplikace.

---

## 18. Accessibility

- WCAG kontrast pro běžný text minimálně 4.5:1;
- nepoužívat barvu jako jediný nositel významu;
- text scaling minimálně 150 %;
- screen reader labels pro ikony;
- focus order podle vizuálního toku;
- touch targets minimálně dle platformních doporučení;
- Emergency a Show to Local mají zvýšenou prioritu čitelnosti.

---

## 19. Responsive a desktop

Mobil je úplný produkt a primární design target.

Desktop:
- používá stejný design systém;
- může mít širší grid, více sloupců a drag-and-drop;
- nesmí přidávat funkci, která na mobilu chybí;
- nesmí ovlivnit mobilní ergonomii.

---

## 20. Flutter implementační pravidla

- barvy nesmí být hardcoded ve widgetech; používat semantic theme tokens;
- light/dark theme musí sdílet stejné názvy tokenů;
- spacing/radius musí být centralizované;
- komponenty musí mít story/demo screen nebo widget test;
- klíčové komponenty mají golden test;
- Bomi assety se načítají přes manifestované cesty;
- phase accent je parametr tématu/kontekstu, ne samostatný fork UI;
- žádná externí placená design/UI knihovna není povolena.

---

## 21. Design QA

Před označením obrazovky jako hotové ověřit:
- light + dark;
- text scaling 150 %;
- dlouhé české texty;
- Hangul;
- offline/error/loading/empty;
- malé i velké telefony;
- tap targety;
- kontrast;
- Bomi nepřekrývá obsah;
- žádná náhodná dekorativní korejština;
- fáze Dream/Adventure/Memories zachovává stejný komponentový systém.

---

## 22. Závazný design snapshot

Schválený směr k 3. listopadu 2026:
- moderní Korean + lehce hravý;
- krémový/off-white základ;
- inkoustově modrá jako primary;
- modrá / šalvějová / růžová-broskvová jako fázové akcenty;
- jemný tmavě modrošedý dark mode;
- střední radius;
- jemně vrstvené karty;
- měkká přátelská typografie;
- středně výrazné korejské motivy;
- měkce malované ilustrace;
- line icons + plnější důležité ikony;
- jemné rychlé animace;
- plovoucí pětizáložková navigace;
- Home založené na „Co teď?“;
- Bomi jako podpůrný, nikoli rušivý průvodce.

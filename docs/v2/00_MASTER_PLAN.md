# SeoulMate v2.0 — Master Plan

**Stav:** závazný hlavní plán produktu  
**Verze:** 2.0  
**Datum:** 27. července 2026  
**Jazyk produktu:** primárně čeština; architektura musí podporovat další jazyky  
**Primární uživatelé:** soukromá skupina čtyř přátel  
**Primární platformy:** Android a iOS  
**Sekundární platformy:** Windows a macOS  

---

## 1. Účel dokumentu

Tento dokument je hlavním zdrojem pravdy pro SeoulMate v2.0. Sjednocuje původní vizi SeoulMate v1.0, schválená vylepšení, nové funkce, technická omezení, pravidla nulových provozních nákladů a způsob migrace již rozpracované Flutter aplikace.

Pokud je jiný projektový dokument v rozporu s tímto Master Planem, platí tento dokument, dokud není rozpor výslovně vyřešen a rozhodnutí zapsáno do `DECISIONS.md`.

SeoulMate v2.0 není nový nesouvisející projekt. Je to řízená evoluce existujícího SeoulMate v1.0.

---

## 2. Produktová vize

SeoulMate je soukromý, krásný a spolehlivý cestovní companion pro čtyři přátele. Pomáhá jim společně naplánovat cestu do Jižní Koreje, bezpečně a pohodlně ji prožít a po návratu uchovat společné vzpomínky.

Produkt musí působit jako promyšlený osobní průvodce, nikoli jako sada nesouvisejících utilit. Má odpovídat na tři základní otázky:

- **Dream:** Co musíme připravit a na co se můžeme těšit?
- **Adventure:** Co právě teď potřebujeme vědět nebo udělat?
- **Memories:** Co jsme spolu zažili a jak si to uchováme?

SeoulMate je primárně mobilní aplikace. Kompletní funkční produkt musí existovat na Androidu a iOS. Desktopová aplikace je pouze volitelný doplněk pro pohodlnější práci na velké obrazovce.

---

## 3. Neměnná pravidla projektu

### 3.1 Soukromý produkt pro čtyři osoby

- Primárním účelem není veřejná turistická služba.
- Všichni čtyři členové skupiny mají stejná práva.
- Neexistují veřejné profily, veřejný feed, reklamy ani moderace komunity.
- Data jsou sdílena pouze uvnitř konkrétního tripu.
- Architektura může podporovat více soukromých tripů, ale rozhraní nesmí působit jako podnikový systém.

### 3.2 Mobil je úplný produkt

- Android a iOS musí obsahovat všechny uživatelské funkce.
- Žádná schopnost nesmí být dostupná pouze na Windows nebo macOS.
- Mobilní aplikace nesmí vyžadovat desktop k nastavení, správě, exportu, záloze ani dokončení jakéhokoli workflow.
- Mobilní návrh má prioritu při každém produktovém, UX a technickém rozhodnutí.
- Funkce musí být použitelné jednou rukou, venku, ve stresu a při nestabilním připojení.

### 3.3 Desktop je sekundární companion

- Windows a macOS používají stejná data a stejné doménové funkce jako mobil.
- Desktop může nabídnout širší rozložení, klávesové zkratky, drag-and-drop a pohodlnější hromadné úpravy.
- Desktop nesmí obsahovat exkluzivní funkce.
- Funkce závislé na mobilním hardwaru mohou mít na desktopu náhradní vstup. Například Camera Companion přijme obrázek ze souboru místo živé kamery.
- Nedostupnost desktopové aplikace nesmí nijak omezit mobilní produkt.
- Desktop se dokončuje až po stabilizaci mobilního jádra a nesmí blokovat mobilní vydání.

### 3.4 Nulové provozní náklady

SeoulMate nesmí vyžadovat pravidelnou platbu za backend, databázi, hosting, mapy, překlad, AI, ukládání souborů ani analytiku.

Povoleny jsou:

- lokální zpracování v zařízení;
- open-source knihovny s kompatibilní licencí;
- bezplatné služby s bezpečným limitem a funkční lokální alternativou;
- ruční export/import;
- jednorázové náklady na zveřejnění v obchodech pouze po samostatném rozhodnutí vlastníka;
- předplatné ChatGPT a Codexu, které se do provozních nákladů aplikace nepočítá.

Zakázány jsou:

- služby vyžadující platební kartu jako podmínku základního fungování;
- automaticky účtované překročení limitu;
- placené API jako kritická závislost;
- neomezený cloudový AI chat hrazený vlastníkem;
- architektura, ve které vyčerpání bezplatného limitu znefunkční základní produkt.

### 3.5 Offline-first a local-first

- Lokální databáze je primárním zdrojem dat pro uživatelské rozhraní.
- Základní cestovní funkce musí fungovat bez připojení.
- Cloud slouží jako synchronizační vrstva, ne jako jediný zdroj pravdy.
- Uživatel vždy vidí, co je dostupné offline a zda existují neodeslané změny.
- Kritická data musí být exportovatelná a obnovitelná bez závislosti na jedné cloudové službě.

### 3.6 Codex a Claude Code mají odvést maximum práce

- Projektová dokumentace musí omezit potřebu domýšlení produktu během implementace.
- Každý vývojový úkol musí mít jasný rozsah, akceptační kritéria a ověřovací kroky.
- Agent smí samostatně analyzovat, implementovat, testovat, dokumentovat a vytvářet lokální commity.
- Push, pull request, merge, změny produkčních služeb a práce s tajnými údaji se řídí výslovným oprávněním a bezpečnostními pravidly projektu.
- Nikdy se nesmí obejít testy nebo skrýt známá chyba jen kvůli dokončení úkolu.

---

## 4. Cílový zážitek

### 4.1 Před cestou — Dream

SeoulMate pomáhá skupině:

- vytvořit a upravit společný itinerář;
- shromažďovat místa a hlasovat o nich;
- ukládat tipy, odkazy, screenshoty a rezervace do Trip Inboxu;
- spravovat společné i osobní checklisty;
- ukládat cestovní dokumenty;
- kontrolovat připravenost cesty;
- plánovat rozpočet;
- naučit se klíčové fráze, jídlo, dopravu a etiketu;
- stáhnout Offline Trip Pack;
- vyřešit neuzavřená skupinová rozhodnutí.

### 4.2 Během cesty — Adventure

SeoulMate musí okamžitě zpřístupnit:

- dnešní program a nejbližší další krok;
- Home Base, adresu a návrat k ubytování;
- rezervace, vstupenky a dokumenty;
- mapu uložených míst a aktivit;
- korejské fráze a režim Show to Local;
- Camera Companion pro text, menu a cedule;
- Food Guide a informace o alergenech;
- dopravu, stanice a odkazy do externí navigace;
- nouzové údaje a Emergency Center;
- výdaje a OCR účtenky;
- stav offline dostupnosti a synchronizace.

### 4.3 Po cestě — Memories

SeoulMate pomáhá:

- vytvořit kroniku jednotlivých dnů;
- propojit navštívená místa, aktivity, poznámky a vybrané fotografie;
- doplnit společné i osobní vzpomínky;
- zobrazit statistiky a achievementy;
- vytvořit exportovatelný Trip Book;
- vytvořit úplnou zálohu tripu.

---

## 5. Informační architektura

Přesná navigace bude uzavřena v UX dokumentaci, ale produkt musí zpřístupnit následující hlavní oblasti:

1. **Home / Co teď?**
2. **Plan / Itinerář**
3. **Explore / Místa a mapa**
4. **Companion / Jazyk, jídlo, kultura, kamera**
5. **Trip Hub / příprava, dokumenty, rozpočet, rozhodnutí**
6. **Memories**
7. **Emergency**
8. **Profil tripu, synchronizace, offline obsah a nastavení**

Emergency a kontextové rychlé karty musí být dostupné bez hluboké navigace.

---

## 6. Adaptivní Home — „Co teď?“

Home není statistický dashboard. Je to situační řídicí centrum.

Musí obsahovat jednu dominantní kartu s nejdůležitějším dalším krokem a menší doplňkové karty.

Příklady:

- Dream: „Hotelová rezervace zatím není dostupná offline.“
- Adventure: „Rezervace začíná za 35 minut. Doporučený odchod za 12 minut.“
- Memories: „Doplňte oblíbený okamžik ze čtvrtého dne.“

Logika Home vyhodnocuje:

- fázi tripu;
- aktuální čas a den;
- itinerář a rezervace;
- kritické nedostatky připravenosti;
- Home Base;
- stav offline balíčku;
- stav synchronizace;
- nevyřešená rozhodnutí;
- počasí, pokud je dostupné;
- nedávné aktivity a vzpomínky.

Každé doporučení musí mít jasný důvod a přímou akci.

---

## 7. Funkční rozsah

### 7.1 Trip a členové

- vytvoření, otevření, archivace, export a obnova tripu;
- čtyři rovnocenní členové;
- osobní preference, tempo, zájmy, alergie a omezení;
- termín cesty, časové pásmo, měny a Home Base;
- možnost budoucích dalších soukromých tripů.

### 7.2 Trip Planner a Smart Itinerary

- automaticky vytvořené dny podle termínu tripu;
- aktivity s časem, délkou, místem, poznámkami a účastníky;
- ruční změna pořadí a přesun mezi dny;
- vazby na místo, dokument, rezervaci, výdaj a frázi;
- kontrola časových konfliktů;
- geografické seskupování;
- doporučená denní doba a délka návštěvy;
- uložené dopravní instrukce;
- denní mapa a časová osa;
- stav návrhu, potvrzení, probíhání a dokončení.

Chytré návrhy jsou vysvětlitelné a pravidlové. Každý návrh ukáže:

- důvod;
- očekávaný přínos;
- míru jistoty;
- jednotlivé změny;
- možnost přijmout, odmítnout a vrátit změnu.

Cloudová generativní AI není nutná pro základní itinerář.

### 7.3 Home Base

- korejský a latinský název;
- adresa v korejštině a jazyce uživatele;
- souřadnice;
- check-in a check-out;
- kontakty a poznámky;
- připojené rezervace a dokumenty;
- Taxi/Hotel Card;
- otevření externí navigace;
- offline dostupnost;
- použití v Emergency Center a Travel Day Mode.

### 7.4 Places a Group Decision Center

Places:

- vlastní kurátorovaná databáze a místa uložená skupinou;
- fotografie nebo ilustrace;
- korejský název a adresa;
- kategorie, tagy a čtvrť;
- doporučená délka, denní doba a počasí;
- praktické tipy, cena a rezervace;
- hlasování a oblíbené;
- přidání do itineráře;
- otevření Naver Map, KakaoMap nebo jiné dostupné navigace.

Group Decision Center sjednocuje:

- nerozhodná hlasování;
- aktivity bez potvrzených účastníků;
- návrhy změn itineráře;
- rezervace vyžadující rozhodnutí;
- výdaje čekající na kontrolu;
- další neuzavřené skupinové volby.

### 7.5 Trip Inbox

Trip Inbox přijímá:

- webové odkazy;
- sdílený text;
- screenshoty;
- fotografie;
- soubory;
- adresy;
- poznámky.

Položku lze později klasifikovat jako:

- místo;
- dokument nebo rezervaci;
- aktivitu;
- ubytování;
- výdaj;
- poznámku;
- položku checklistu.

Původní vstup zůstává zachován a automatické rozpoznání musí uživatel potvrdit.

### 7.6 Checklist a Readiness Center

Checklist:

- společné a osobní položky;
- kategorie, termín, odpovědná osoba a priorita;
- opakovatelná pravidla a šablony;
- vazby na dokumenty, rezervace a offline obsah.

Readiness Center vyhodnocuje:

- cestovní dokumenty;
- rezervace;
- checklist;
- ubytování;
- dopravu z letiště;
- nouzové informace;
- finanční přípravu;
- úplnost itineráře;
- Offline Trip Pack.

Stavy:

- hotovo;
- doporučeno;
- důležité;
- kritické.

Procento připravenosti nesmí skrýt kritickou chybu.

### 7.7 Travel Vault

Travel Vault ukládá:

- letenky a boarding passy;
- ubytování;
- pojištění;
- vstupenky;
- potvrzení;
- PDF, obrázky a screenshoty;
- metadata, platnost a vazby na itinerář.

Pravidla:

- dokumenty musí být dostupné offline;
- citlivé lokální soubory musí být chráněné prostředky platformy;
- plné soubory se nesmí automaticky ukládat do placené služby;
- metadata lze synchronizovat odděleně;
- sdílení souborů může být řešeno volitelným společným úložištěm nebo exportem/importem;
- uživatel musí vidět, zda je soubor pouze lokální, sdílený a stažený offline.

### 7.8 Budget

- výdaje ve více měnách;
- plátce a účastníci;
- rovné i vlastní rozdělení;
- kategorie a poznámky;
- fotografie účtenky;
- OCR návrh částky, data, obchodníka a měny;
- ruční potvrzení před uložením;
- přehled zůstatků;
- konečné vyrovnání;
- export.

### 7.9 Korean Companion

Každá fráze obsahuje:

- korejský zápis;
- standardní romanizaci;
- přibližnou českou výslovnost;
- případně anglickou výslovnost;
- doslovný překlad;
- přirozený význam;
- situaci použití;
- úroveň zdvořilosti;
- ověřené audio, pokud je k dispozici;
- oblíbené a historii;
- režim Show to Local.

Obsah musí být verzovaný, kurátorovaný a dostupný offline. Fonetický přepis musí používat jednotná pravidla.

### 7.10 Food Guide

- korejský a český název jídla;
- fotografie nebo ilustrace;
- hlavní suroviny;
- typická příprava;
- pálivost;
- běžné alergeny;
- informace pro vegetariány a další omezení;
- upozornění na skryté rybí, masové nebo mořské složky;
- způsob objednání;
- související fráze;
- režim Show to Local.

Automatická detekce alergenu nikdy nesmí být prezentována jako lékařsky spolehlivá.

### 7.11 Survival Guide a doprava

Offline obsah zahrnuje:

- etiketu a kulturní zvyklosti;
- peníze, platby a směnu;
- SIM/eSIM a připojení;
- T-money;
- metro, autobusy, taxi a letištní dopravu;
- přestupy, číslování východů a poslední spoje;
- základní plán linek a stanic;
- praktické chyby, kterým se vyhnout;
- odkazy do externích navigačních aplikací.

SeoulMate nenahrazuje plnohodnotnou živou navigaci. Vlastní live transit routing není podmínkou hlavního vydání.

### 7.12 Camera Companion

Mobil:

1. načte obraz z kamery nebo galerie;
2. lokálně rozpozná korejský text, pokud to platforma umožní;
3. nabídne strojový překlad;
4. dovolí výběr, kopírování a uložení textu;
5. porovná výsledek s ověřeným SeoulMate obsahem;
6. zvýrazní možné názvy jídel a alergeny;
7. nabídne související frázi nebo Show to Local.

Desktop:

- nabídne stejný workflow nad obrázkem ze souboru, schránky nebo připojené kamery;
- nejde o exkluzivní ani plnohodnotnější variantu.

Strojový překlad a automatické rozpoznání jsou vždy viditelně označeny. Uživatel musí mít přístup k původnímu textu.

### 7.13 Show to Local a rychlé karty

Show to Local zobrazí velký čistý korejský text, případně fonetiku a audio, bez rušivého rozhraní.

Rychlé karty:

- Taxi Card;
- Hotel Card;
- Allergy Card;
- Emergency Card;
- Today Card;
- Airport Card;
- Reservation Card.

Karty musí být dostupné offline a během několika klepnutí.

### 7.14 Emergency Center

- místní nouzová čísla a pokyny;
- osobní zdravotní a alergické údaje zadané uživatelem;
- Home Base;
- kontakty;
- fráze pro policii, nemocnici, ztracené věci a další situace;
- Show to Local;
- rychlé volání tam, kde je to bezpečné a platforma to dovolí;
- informace o poslední aktualizaci obsahu.

Emergency Center nesmí slibovat dostupnost na zamčeném zařízení, pokud ji daná platforma bezpečně nepodporuje. Po odemknutí musí být dostupné nejkratší možnou cestou.

### 7.15 Mapy

Online mapa:

- Home Base;
- uložená místa;
- dnešní aktivity;
- aktuální poloha po udělení oprávnění;
- filtry a denní spojnice;
- otevření externí navigace.

Offline Map Lite:

- uložené body a Home Base;
- pořadí denních aktivit;
- přibližné směry a vzdálenosti;
- případně legálně distribuovatelný zjednodušený podklad.

Projekt nesmí bez oprávnění hromadně stahovat veřejné mapové dlaždice. Každý poskytovatel map musí projít kontrolou licence, podmínek a limitů.

### 7.16 Počasí

- volitelný online doplněk;
- poslední známá data a čas aktualizace;
- doporučení pro itinerář musí být vysvětlitelné;
- výpadek počasí nesmí narušit itinerář ani Home;
- poskytovatel musí před implementací projít Zero-Cost Gate.

### 7.17 Offline Trip Pack a Sync Center

Offline Trip Pack obsahuje:

- trip, členy, itinerář a Home Base;
- dokumenty zvolené pro offline použití;
- fráze a audio;
- Food Guide;
- Survival Guide;
- nouzové informace;
- uložená místa;
- zjednodušená mapová data, pokud jsou legálně dostupná;
- osobní a společné checklisty;
- aktuální přehled výdajů.

Manifest ukazuje:

- dostupné a chybějící položky;
- velikost;
- verzi a stáří obsahu;
- poslední úspěšnou aktualizaci;
- chyby stahování.

Sync Center ukazuje:

- vše synchronizováno;
- čekající změny;
- neúspěšné změny;
- poslední úspěšnou synchronizaci;
- lokální/sdílený/offline stav souborů;
- konflikty a bezpečný způsob jejich vyřešení.

### 7.18 Memories, galerie a kronika

- denní záznamy;
- společné a osobní poznámky;
- dokončené aktivity a navštívená místa;
- vybrané fotografie a optimalizované náhledy;
- popisky, datum a místo;
- oblíbený okamžik dne;
- achievementy a statistiky;
- automaticky připravená kostra kroniky;
- ruční editace před zveřejněním v tripu.

SeoulMate nenahrazuje neomezené cloudové úložiště fotografií. Originály mohou zůstat v telefonu nebo externím albu; aplikace uchovává výběr, náhledy a odkazy.

### 7.19 Trip Book, export, záloha a obnova

Mobilní aplikace musí umožnit:

- export strukturovaných dat;
- export vybraných souborů;
- vytvoření přenosného a verzovaného balíčku;
- ochranu citlivého exportu;
- kontrolu integrity;
- obnovu na novém zařízení;
- tvorbu PDF Trip Booku s časovou osou, dny, místy, fotografiemi a statistikami.

Desktop smí stejné úlohy zpříjemnit, ale nesmí být vyžadován.

### 7.20 Haechi

Haechi je moderní emocionální průvodce a vizuální identita, nikoli placený cloudový chatbot.

Má definované stavy:

- vítání;
- příprava;
- pochvala;
- upozornění;
- cesta;
- déšť;
- offline režim;
- chyba synchronizace;
- dokončený den;
- achievement;
- návrat domů.

Reakce vznikají z lokálních šablon a kontextových pravidel. Musí být krátké, užitečné, nedětské a nesmí překážet kritickým informacím.

---

## 8. Rozsah vydání

### P0 — nutné pro použitelnou cestovní verzi

- mobilní Android a iOS základ;
- trip, členové a Home Base;
- adaptivní Home;
- itinerář;
- Places a hlasování;
- checklist a Readiness Center;
- Travel Vault s lokálními offline dokumenty;
- Korean Companion;
- Food a Survival Guide;
- Emergency Center;
- Budget;
- Offline Trip Pack a Sync Center;
- záloha a obnova;
- základní Memories;
- jednotný design systém;
- automatické testy a sestavitelná aplikace.

### P1 — silně doporučené pro v2.0

- Trip Inbox;
- Group Decision Center;
- Camera Companion;
- Show to Local a rychlé karty;
- OCR účtenek;
- vysvětlitelné chytré návrhy itineráře;
- online mapa a Offline Map Lite;
- počasí jako bezpečný doplněk;
- automatická kostra kroniky;
- Trip Book;
- pokročilejší Haechi.

### P2 — až po stabilním mobilním vydání

- Windows a macOS companion;
- vlastní legální offline vektorový výřez mapy;
- živé dopravní informace ze stabilního bezplatného zdroje;
- další volitelné integrace;
- pokročilé animace a marketingové materiály.

P2 nesmí změnit pravidlo, že mobil je úplný produkt.

---

## 9. Cílová technická architektura

### 9.1 Klient

- Flutter pro Android, iOS, Windows a macOS;
- feature-based struktura;
- Riverpod pro řízení stavu a dependency injection;
- GoRouter pro navigaci;
- Drift/SQLite pro lokální relační data;
- verzované lokální balíčky obsahu;
- platformní bezpečné úložiště pro klíče a citlivá metadata;
- responzivní design se společnou doménovou logikou.

Konkrétní verze knihoven musí být vybrány až po auditu existujícího repozitáře a kontrole aktuální podpory všech cílových platforem.

### 9.2 Datové vrstvy

1. **Lokální databáze:** okamžitý zdroj pro UI.
2. **Lokální souborové úložiště:** dokumenty, náhledy, audio a exporty.
3. **Synchronizační fronta:** odolné odeslání změn.
4. **Sdílená strukturovaná data:** stávající Firebase Authentication a Cloud Firestore lze zachovat, pokud audit potvrdí nulové náklady a vhodnost.
5. **Volitelné sdílené soubory:** oddělená integrace nebo explicitní export/import; nesmí být kritická pro základní fungování.
6. **Externí služby:** pouze přes adaptéry, s cache, timeoutem, limitem a lokální alternativou.

### 9.3 Synchronizace

Každá synchronizovatelná entita potřebuje:

- globálně unikátní ID;
- trip ID;
- čas vytvoření a změny;
- autora poslední změny;
- verzi nebo revizi;
- stav smazání bez okamžité destrukce;
- lokální stav synchronizace.

Požadavky:

- UI nikdy nečeká na cloud, aby zobrazilo lokální data;
- změny jsou idempotentní;
- neúspěchy se bezpečně opakují;
- konflikty se nesmí tiše přepsat;
- mazání musí respektovat obnovu a synchronizaci;
- chování musí být testovatelné bez skutečného cloudu.

Přesná strategie konfliktů bude popsána v samostatném dokumentu.

### 9.4 Statický obsah

Fráze, jídlo, etiketa, doprava a nouzové informace musí být:

- verzované;
- validované schématem;
- dohledatelné ke zdroji;
- oddělené od UI kódu;
- aktualizovatelné balíčkem;
- dostupné offline;
- označené datem poslední odborné kontroly.

### 9.5 Externí integrace

Každá integrace musí mít vlastní adaptér a stav:

- dostupné;
- nedostupné;
- offline;
- limitováno;
- zastaralá cache.

Žádná externí chyba nesmí rozbít hlavní workflow.

### 9.6 Bezpečnost a soukromí

- žádné tajné klíče v repozitáři;
- minimální oprávnění;
- ochrana lokálních citlivých dat prostředky platformy;
- jasné potvrzení před sdílením zdravotních údajů a dokumentů;
- bezpečnostní pravidla cloudu testovat automaticky;
- logy nesmí obsahovat dokumenty, tokeny ani citlivé osobní údaje;
- exporty musí uživatele upozornit na citlivý obsah;
- analytika je vypnutá, dokud není schválena privacy-first varianta.

---

## 10. Zero-Cost Gate

Každá nová knihovna, služba nebo API musí před schválením odpovědět:

1. Vyžaduje platební kartu?
2. Může automaticky vytvořit účet?
3. Jaké jsou bezplatné limity?
4. Co se stane po jejich vyčerpání?
5. Může poskytovatel službu pozastavit?
6. Funguje kritický workflow bez této služby?
7. Existuje lokální nebo ruční alternativa?
8. Smíme data a assety distribuovat?
9. Vyhovuje licence použití v aplikaci?
10. Jak aplikace zobrazí výpadek, zastaralá data a poslední aktualizaci?

Výsledek se zapisuje do `DECISIONS.md`. Podmínky služeb se musí ověřit z aktuálních oficiálních zdrojů před implementací a znovu před vydáním.

---

## 11. Vizuální směr a grafika

Vizuální identita musí být uzavřena před rozsáhlou přestavbou UI.

Je nutné definovat:

- barevnou paletu a sémantické barvy;
- typografii a korejské fonty;
- rozestupy, rádiusy, stíny a grid;
- karty, tlačítka, formuláře a seznamy;
- navigaci;
- světlý a tmavý režim;
- Dream, Adventure a Memories atmosféru;
- ikony a mapové markery;
- přístupnost;
- motion pravidla;
- moderní podobu Haechiho;
- prázdné, načítací, chybové, offline a úspěšné stavy.

Pořadí:

1. vizuální principy a reference;
2. design tokeny;
3. klíčové mobilní obrazovky;
4. komponentový katalog;
5. Haechi character sheet;
6. základní assety;
7. implementace ve Flutteru;
8. vizuální QA na telefonech;
9. responzivní adaptace pro desktop;
10. finální animace a release grafika.

Assety musí mít jasnou licenci, zdroj a manifest. AI vytvořené assety musí být konzistentní a archivovat zdrojové prompty a varianty.

---

## 12. Přístupnost a lokalizace

- ovládání s čtečkou obrazovky;
- logické pořadí fokusu;
- dostatečný kontrast;
- podporované zvětšení textu;
- minimální dotykové cíle;
- nespoléhat pouze na barvu;
- redukované animace;
- ovládání klávesnicí na desktopu;
- správné zobrazování korejštiny;
- oddělení textů od kódu;
- čeština jako první plně dokončený jazyk;
- architektura připravená na angličtinu.

Emergency a Show to Local mají zvlášť přísné požadavky na čitelnost.

---

## 13. Migrace SeoulMate v1.0

### 13.1 Nezačínat automaticky od nuly

Nejdříve se musí zachovat bezpečný výchozí bod:

1. ověřit čistotu a stav repozitáře;
2. zaznamenat aktuální větev a commit;
3. vytvořit baseline tag pouze po potvrzení vlastníka;
4. spustit stávající formátování, analýzu, testy a build;
5. pořídit screenshoty existujících obrazovek;
6. sepsat funkční inventář;
7. zmapovat datové modely, služby a závislosti;
8. zkontrolovat, co je skutečná funkce a co maketa;
9. zkontrolovat bezpečnost, cloud a možné náklady.

### 13.2 Klasifikace

Každá část se označí:

- **KEEP:** kvalitní a v souladu s v2.0;
- **REFINE:** zachovat, ale funkčně nebo vizuálně vylepšit;
- **REFACTOR:** doména je správná, implementace potřebuje změnu;
- **REPLACE:** bezpečně nahradit;
- **REMOVE:** nepotřebné nebo v rozporu s pravidly;
- **NEW:** dosud neexistuje.

### 13.3 Migrační vrstvy

1. audit a stabilizace;
2. testovací baseline;
3. datové modely a migrační strategie;
4. lokální databáze;
5. synchronizační fronta a Sync Center;
6. design systém;
7. navigace a adaptivní Home;
8. P0 cestovní moduly;
9. offline a bezpečnost;
10. P1 chytré propojení;
11. Memories, export a obnova;
12. výkon, přístupnost a release;
13. teprve poté desktopová adaptace.

Migrace musí být po malých vratných krocích. Starší data nesmí být zničena bez ověřené migrace a zálohy.

---

## 14. Testovací strategie a Quality Gates

### 14.1 Automatické kontroly

- formátování;
- statická analýza;
- unit testy doménové logiky;
- testy databázových migrací;
- testy synchronizace a konfliktů;
- widget testy kritických stavů;
- golden testy klíčových komponent;
- integrační testy hlavních cest;
- testy importu/exportu;
- testy offline chování;
- testy chyb externích služeb;
- build Android a podle prostředí i dalších platforem.

### 14.2 Povinné scénáře

- první spuštění bez internetu;
- ztráta připojení během editace;
- dvě zařízení mění stejnou položku;
- neúspěšné stažení dokumentu;
- poškozený nebo starší záložní balíček;
- vyčerpaný nebo nedostupný externí endpoint;
- zamítnuté oprávnění ke kameře, poloze nebo souborům;
- velké písmo a screen reader;
- korejský text;
- chybné OCR a ruční oprava;
- výpočet rozdělených výdajů a zaokrouhlení.

### 14.3 Definition of Done úkolu

Úkol je dokončen pouze když:

- splňuje akceptační kritéria;
- neobsahuje nevysvětlené TODO;
- respektuje Master Plan;
- má odpovídající testy;
- analýza a relevantní testy procházejí;
- UI má loading, empty, error a offline stavy;
- byla aktualizována dokumentace;
- nebyly přidány náklady ani tajné údaje;
- změna je malá, zkontrolovatelná a vratná;
- je uveden stručný souhrn a způsob ověření.

---

## 15. Git a autonomní pracovní postup

Pro každý uzavřený úkol:

1. načíst `AGENTS.md`, Master Plan a relevantní specifikaci;
2. zkontrolovat stav Gitu a cizí rozpracované změny;
3. vytvořit nebo použít správnou větev/worktree podle oprávnění;
4. sepsat krátký plán;
5. implementovat nejmenší úplný vertikální řez;
6. průběžně testovat;
7. provést vizuální kontrolu;
8. aktualizovat dokumentaci;
9. spustit quality gates;
10. vytvořit smysluplný lokální commit;
11. pushnout a vytvořit pull request pouze při uděleném oprávnění;
12. nikdy automaticky nemergovat neúspěšný nebo nezkontrolovaný PR.

Agent musí zachovat nesouvisející uživatelské změny a nesmí používat destruktivní Git operace bez výslovného souhlasu.

---

## 16. Dokumentační plán

Číslování lze zpřesnit, ale pokrytí témat je povinné:

1. `00_MASTER_PLAN.md`
2. `01_VISION_AND_PRINCIPLES.md`
3. `02_PRODUCT_SCOPE.md`
4. `03_PRD.md`
5. `04_PERSONAS_AND_JOBS.md`
6. `05_USER_FLOWS.md`
7. `06_INFORMATION_ARCHITECTURE.md`
8. `07_SCREEN_CATALOG.md`
9. `08_UX_SPECIFICATION.md`
10. `09_DESIGN_SYSTEM.md`
11. `10_HAECHI_GUIDE.md`
12. `11_CONTENT_STRATEGY.md`
13. `12_TECHNICAL_ARCHITECTURE.md`
14. `13_DATA_MODEL.md`
15. `14_SYNC_AND_CONFLICTS.md`
16. `15_OFFLINE_STRATEGY.md`
17. `16_INTEGRATIONS_AND_DATA_SOURCES.md`
18. `17_SECURITY_AND_PRIVACY.md`
19. `18_ACCESSIBILITY_AND_LOCALIZATION.md`
20. `19_TESTING_STRATEGY.md`
21. `20_RELEASE_AND_DISTRIBUTION.md`
22. `21_MIGRATION_V1_TO_V2.md`
23. `22_CODEX_WORKFLOW.md`
24. `23_CLAUDE_CODE_HANDOFF.md`
25. `24_ACCEPTANCE_CRITERIA.md`
26. `25_ROADMAP.md`
27. `26_TASK_BACKLOG.md`
28. `27_SETUP_FOR_BEGINNERS.md`
29. `DECISIONS.md`
30. kořenový `AGENTS.md`
31. `CLAUDE.md`
32. `SETUP.md`
33. `ANTIGRAVITY_DOCUMENTATION_BRIEF.md`

Datové a podpůrné artefakty:

- JSON schémata;
- seed data;
- zdrojový registr obsahu;
- ukázkové itineráře;
- fráze, jídla, místa a survival obsah;
- design tokeny;
- asset manifest;
- migrační mapy;
- GitHub issues nebo lokální task soubory;
- QA checklisty.

---

## 17. Doporučená realizační roadmapa

Roadmapa se řídí závislostmi, ne pevnými sliby délky.

### Fáze A — poznání a stabilizace

- audit repozitáře;
- baseline testy;
- inventář obrazovek a funkcí;
- nákladový a bezpečnostní audit;
- migrační rozhodnutí.

### Fáze B — závazná specifikace

- PRD;
- user flows;
- obrazovky;
- data;
- synchronizace;
- design systém;
- obsah a zdroje;
- task backlog.

### Fáze C — mobilní základ

- lokální databáze;
- navigace;
- design systém;
- Home;
- trip a členové;
- synchronizace.

### Fáze D — P0 funkce

- itinerář;
- Places;
- checklist a připravenost;
- Vault;
- Companion obsah;
- Emergency;
- Budget;
- offline balíček;
- Memories a záloha.

### Fáze E — P1 funkce

- Inbox;
- Decision Center;
- Camera Companion;
- Show to Local;
- OCR účtenek;
- mapa;
- chytré návrhy;
- Trip Book.

### Fáze F — mobilní hardening

- reálná zařízení;
- offline a konflikty;
- přístupnost;
- výkon;
- bezpečnost;
- recovery;
- release candidate.

### Fáze G — desktop companion

- Windows a macOS build;
- responzivní layout;
- klávesnice, myš a drag-and-drop;
- náhradní vstupy pro mobilní hardware;
- parity test potvrzující nulové desktop-only funkce.

---

## 18. Výslovně odložené nebo zakázané směry

Hlavní vydání nesmí blokovat:

- sociální síť;
- veřejné profily;
- vlastní rezervační systém;
- živý chat mezi cestovateli;
- neomezené cloudové ukládání médií;
- placený AI asistent;
- vlastní kompletní navigace;
- vlastní live transit engine;
- automatický import soukromých e-mailů;
- funkce bez jasného přínosu pro čtyři primární uživatele.

Budoucí návrh musí znovu projít produktovým přínosem, Zero-Cost Gate a dopadem na soukromí.

---

## 19. Rizika a obrana

| Riziko | Obrana |
|---|---|
| Příliš velký rozsah | P0/P1/P2, malé vertikální řezy, quality gates |
| Bezplatná služba změní podmínky | adaptéry, lokální alternativa, export, pravidelná kontrola |
| Offline konflikty | verze entit, fronta, viditelný Sync Center, testy |
| Ztráta dokumentů | lokální kopie, manifest, export a ověřená obnova |
| Nekonzistentní UI | design tokeny, komponentový katalog, golden testy |
| Nekvalitní automatický překlad | jasné označení, původní text, kurátorovaný obsah |
| Náklady na fotografie | výběr, náhledy, odkazy na originál |
| Desktop zpomalí mobil | desktop až po mobilním release candidate |
| Agent domyslí jiné zadání | hierarchie dokumentů, acceptance criteria, malé úkoly |
| Tajné údaje v repozitáři | šablony konfigurace, secret scanning, minimální oprávnění |

---

## 20. Finální Definition of Done SeoulMate v2.0

SeoulMate v2.0 je hotový, když:

- Android a iOS představují kompletní produkt bez potřeby desktopu;
- P0 je implementováno, otestováno a zdokumentováno;
- schválené P1 funkce jsou dokončeny nebo transparentně přesunuty;
- důležité cestovní workflow funguje offline;
- synchronizace neztrácí změny a viditelně řeší chyby;
- záloha a obnova byly prakticky ověřeny;
- žádná kritická funkce nevyžaduje placenou službu;
- nejsou vloženy tajné údaje;
- design je jednotný a přístupný;
- Emergency a Show to Local jsou rychlé a čitelné;
- aplikace prochází relevantní analýzou, testy a buildem;
- byla otestována na skutečném Android telefonu a iPhonu;
- dokumentace odpovídá implementaci;
- známá omezení jsou výslovně uvedena;
- desktop, pokud existuje, je jen doplňkový parity companion bez exkluzivních funkcí.

---

## 21. Rozhodnutí potvrzená tímto dokumentem

1. SeoulMate nadále slouží hlavně čtyřem přátelům.
2. Projekt se vyvíjí z existujícího v1.0, pokud audit neprokáže důvod k cílené náhradě části systému.
3. Android a iOS jsou úplný a prioritní produkt.
4. Windows a macOS jsou nepovinný companion bez exkluzivních funkcí.
5. Local-first a offline-first jsou základ architektury.
6. Nulové provozní náklady jsou tvrdá podmínka.
7. Cloudové služby jsou nahraditelné synchronizační doplňky.
8. Haechi je pravidlový kontextový průvodce, ne placený chatbot.
9. Vizuální systém se řeší před rozsáhlou implementací UI.
10. Codex a Claude Code pracují podle stejné dokumentace, acceptance criteria a quality gates.

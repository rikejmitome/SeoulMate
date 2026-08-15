# SeoulMate v2.0 — Inventář existujících funkcí a klasifikace (Feature Inventory)

**Datum auditu:** 15. srpna 2026  
**Stav:** VERIFIED  
**Auditor:** Antigravity Architecture Lead  
**Nadřazený dokument:** [../00_MASTER_PLAN.md](../00_MASTER_PLAN.md)  
**Rozcestník:** [../DOCUMENTATION_INDEX.md](../DOCUMENTATION_INDEX.md)  
**Klasifikace:** `KEEP`, `REFINE`, `REFACTOR`, `REPLACE`, `REMOVE`, `NEW`

---

## 1. Souhrnná klasifikace existujících modulů v1.0

| Modul / Komponenta | Stav ve v1.0 | Klasifikace v2 | Zdůvodnění a doporučený postup |
|---|---|---|---|
| **Auth (Login, Register, Reset)** | Funkční UI a Riverpod providery na `firebase_auth` | **REFINE** | Zachovat existující kód, doplnit offline indikaci a sjednotit design s novým tématem. |
| **Trip Core (List, Detail, Members)** | Implementováno, Freezed modely, správa členů | **REFINE** | Zachovat strukturu, doplnit Home Base ubytování a nastavení časového pásma. |
| **Trip Days (Itinerář)** | Implementováno vytváření a detail dnů | **REFACTOR** | Povýšit na Smart Itinerary: časová osa, detekce konfliktů a pravidlové návrhy. |
| **Places & Skupinové hlasování** | Plně funkční správa míst, detail a hlasování 4 přátel | **REFINE** | Vynikající základ. Doplnit korejské Hangul názvy, externí mapy (Naver/Kakao) a Decision Center. |
| **Firebase Cloud Storage** | Přítomno v `pubspec.yaml` (`firebase_storage`) | **REMOVE / DISABLE** | Vyloučit z v2: vyžaduje Blaze plán s platební kartou. Nahradit 100% lokálním úložištěm. |
| **Home Screen** | Základní statický placeholder | **REPLACE** | Nahradit plnohodnotným modulem adaptivního „Co teď?“ a maskotem Haechi. |
| **Travel Vault (Doklady)** | Prázdná složka `features/documents/` s `.gitkeep` | **NEW** | Vytvořit nově: lokální AES-256 šifrování a zobrazení offline PDF letenek/voucherů. |
| **Emergency Center** | Prázdná složka `features/emergency/` s `.gitkeep` | **NEW** | Vytvořit nově: nouzová čísla (112, 119), Taxi Card a zdravotní záznamy 4 členů. |
| **Budget & Výdaje** | Prázdná složka `features/budget/` s `.gitkeep` | **NEW** | Vytvořit nově: vícměnový rozpočet, rovný i vlastní split, OCR účtenek a vyrovnání. |
| **Korean Companion & Food Guide** | Prázdná složka `features/korean/` s `.gitkeep` | **NEW** | Vytvořit nově: lokální verzované JSON balíčky frází, české fonetiky, audia a jídel. |
| **Trip Inbox** | Ve v1.0 neexistovalo | **NEW** | Vytvořit nově v P1: sběr odkazů, screenshotů a textů s možností konverze. |
| **Camera Companion (OCR)** | Ve v1.0 neexistovalo | **NEW** | Vytvořit nově v P1: on-device Google ML Kit pro Hangul texty a jídla. |
| **Memories & PDF Trip Book** | Prázdná složka `features/memories/` s `.gitkeep` | **NEW** | Vytvořit nově: denní kronika, fotky s miniaturami, statistiky a mobilní PDF generátor. |
| **Sync Center & Outbox** | V1.0 spoléhalo pouze na implicitní cache | **NEW** | Vytvořit nově: explicitní Local-First SQLite fronta a diagnostická obrazovka. |

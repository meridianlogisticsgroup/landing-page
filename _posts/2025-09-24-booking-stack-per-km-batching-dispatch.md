---
layout: post
title: "Inside Our Booking & Ops Stack: Per-km Pricing, Smart Batching, and Nearest Dispatch (All UI-Driven)"
date: 2025-09-24
author: Meridian Logistics Group
tags: [operations, pricing, dispatch, billing, configuration]
excerpt: "How we configure per-km pricing, pre-define truck/crew batches, choose the nearest available unit, and flow quotes into invoices—without writing code."
image: /assets/images/posts/booking-stack.jpg
---

## Why a logistics firm needs a configurable UI (not custom code)

Meridian Logistics Group operates multiple local brands. We need consistent pricing and scheduling rules, but each market has its own realities. Instead of writing software, we use an **operator UI** that lets us **configure** pricing, batching, dispatch, and billing logic per brand. No code pushes; just changes in the admin.

---

## Per-km pricing: configured, not coded

**What we set in the UI**
- **Distance source:** Google Maps Distance Matrix (traffic model selectable).
- **Base fee & per-km rate:** separate tables per brand/zone.
- **Access modifiers:** sliders/toggles for stairs, elevator, walk distance, parking complexity.
- **Rounding:** dropdown (e.g., nearest 0.5 km).
- **Visibility:** switch to show/hide route snapshot in the quote PDF.

**Operator notes**
- **Caps and guardrails:** we set a max drive time per window; if live congestion would break SLA, the UI flags “re-quote required.”
- **Zones:** a visual map editor lets us drag urban/outer boundaries so long deadheads aren’t accidentally subsidized.

Result: sales can quote consistently in minutes, and pricing policy lives in one place.

---

## Resource batching: pre-defined combinations you can trust

Most jobs map to patterns, so we configure **batches** in the UI—name + assets + default costs.

**Examples**
- *Small Move* → 12–15 ft truck + 2 movers  
- *Medium Move* → 15–20 ft truck + 3 movers  
- *Large Move* → 26 ft truck + 3–4 movers (+ liftgate if appliances)

**What the UI stores with each batch**
- Standard costs (vehicle hourly, labor hourly, fuel %)
- Optional add-ons (e.g., wardrobe boxes)
- Brand-specific availability limits (how many of this batch each daypart)

Dispatchers can override a batch on a job, and the UI **recalculates** both availability and cost impact instantly.

---

## Nearest dispatch with availability and compliance

Once a quote is accepted, the scheduler view shows **eligible units**.

**UI inputs**
- Depot start/end, active jobs, turn-time buffers
- DOT/break rules
- Peak-traffic windows

**How we operate (no formulas needed)**
- The board highlights the **nearest available** unit that satisfies the batch and daypart.
- We see the trade-off: small detour now vs. late-day risk.
- A slider lets us increase the safety margin during rush hours.

The result is **day-plan quality**, not single-leg greediness.

---

## One key from quote → job → invoice

Every quote gets a **stable job key** that automatically carries through:

1. **Quote**: distance, modifiers, batch, price, terms  
2. **Job**: assigned truck/crew, checklist, timestamps, photos  
3. **Invoice**: variances (time/materials), surcharges, tips

Because the UI ties everything to one key, finance can reconcile in minutes and customers don’t re-enter info.

---

## Automated costs, expenses, and profit (configured targets vs. actuals)

Close-out is UI-first:
- **Labor actuals** (clock times; on-site vs. drive) are entered/confirmed.
- **Vehicle actuals** (engine hours or odometer) are attached to the job.
- **Fuel** is handled as a policy percentage unless receipts are uploaded.
- **Access variances** are quick-add buttons.

Dashboards roll up **gross margin** by brand, city, truck class, and batch. We watch pricing drift and operational friction weekly.

---

## Scheduling & reporting the team actually uses

- **Capacity at a glance**: AM / Mid-day / PM blocks show green/amber/red against batch counts.
- **Exception queues**: incomplete checklists, time overages >15%, missing signatures/photos.
- **Reporting**: contribution margin per truck-day, cancel/decline reasons, quote-to-win by source.

No code, no CSV gymnastics—just an admin that operators can change safely.

---

## What the UI-only approach unlocks

- **Faster iteration**: change a rate or batch once; it’s live for that brand.  
- **Cleaner handoffs**: quotes and jobs share context; fewer “what did we promise?” moments.  
- **Better margins**: standardized costs surface issues early, not at month-end.

_&ast;Chatwoot and Twilio are trademarks of their respective owners._

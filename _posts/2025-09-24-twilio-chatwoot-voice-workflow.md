---
layout: post
title: "Voice That Works: Twilio + Chatwoot for Ring-All, First-Answer Routing, and Voicemail Events (UI-Configured)"
date: 2025-09-24
author: Meridian Logistics Group
tags: [voice, telephony, chatwoot, twilio, operations, configuration]
excerpt: "Our PSTN-first approach is configured in the UI: ring all available agents, assign to the first answer, and drop voicemails/recordings into the inbox—no softphones, no custom code."
image: /assets/images/posts/twilio-voice.jpg
---

## Why PSTN first (and UI-configured)

On moving day, phones must “just work.” We use **Twilio** for carrier-grade PSTN and **Chatwoot** for the agent experience. The routing flows, hours, and voicemail handling are set in **admin screens**—not in code—so ops can adjust quickly.

---

## The flow at a glance

1. **Customer dials a brand number** (Twilio DID per brand).  
2. **Availability check**: who’s marked “available” and on-shift.  
3. **Ring-all fan-out** to that shortlist (simultaneous PSTN).  
4. **First agent to answer** becomes the conversation owner.  
5. **No answer** → voicemail; **recording + transcript** are posted to the brand’s inbox.

All of this is controlled by configuration: schedules, eligibility, recording policy, and how voicemails appear in the queue.

---

## What we configure (not code)

- **Numbers per brand** with CNAM.  
- **Business hours & after-hours paths** (direct to voicemail or message).  
- **Optional IVR** with a simple “sales vs. active moves” split.  
- **Eligibility rules** (available + on shift + not on another call).  
- **Prioritization** (round-robin with bias toward the shortest active queue).  
- **Cooldowns** (e.g., 10–15 seconds between back-to-back new calls to the same agent).  
- **Recording policy** (on/off per brand with retention).

---

## What lands in the inbox

When a call is answered:
- The **Chatwoot conversation** is tagged (`voice`, `brand:XYZ`, `intent:sales|ops`).  
- A **disposition prompt** reminds the agent to mark outcome (booked, follow-up, wrong number).  
- **Recording link** is attached if policy allows.

When a call is missed:
- A **voicemail event** includes caller ID, timestamp, brand, recording URL, and (optionally) a transcript.  
- A **callback button** is available for outbound via Twilio.

All standardized, no one-off tooling.

---

## Operational guardrails we rely on

- **Recording transparency**: notify callers if recording is on; fixed retention window.  
- **Fallbacks**: when no one is eligible, we play hours and accept voicemail (with SLA for next-day callback).  
- **Supervisor override**: a code can re-route calls to a live operator line during unusual spikes.

---

## Results that matter

- **Answer rate**: ring-all raises pickups during surges.  
- **Ownership**: first answer owns the thread—clean accountability.  
- **Simplicity**: no softphones, fewer IT headaches, better audio reliability.

Phones shouldn’t be a science project. Twilio handles the carrier layer; Chatwoot keeps the team organized. A UI-configured flow means we can change rules as the business changes—fast.

_\*Chatwoot and Twilio are trademarks of their respective owners._

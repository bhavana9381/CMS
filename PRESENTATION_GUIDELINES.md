# DPDP 2023 Presentation Guidelines

Mandatory framework for all slides in the Consent Management System (CMS) project.

## 1. Technical Foundation
- **Canvas Size:** Fixed 1920×1080 (16:9 aspect ratio).
- **Environment:** Desktop presentation (no mobile/responsive reflow).
- **Stage Scaling:** Must use CSS `transform: scale()` to fit the viewport without cropping.
- **Boundaries:** Zero tolerance for content overflow or cropping.

## 2. Design Philosophy (Consulting Style)
- **Aesthetic:** High-end enterprise (Deloitte, McKinsey, Accenture).
- **Visual Hierarchy:** 
    1. Clear, bold titles (Clash Display).
    2. Structured subtitles (Satoshi).
    3. Information-dense content area (50/50 or 60/40 splits).
- **Color Palette:** Deep navy/slate backgrounds with vibrant blue/purple/cyan accents for highlights.
- **Clarity over Decoration:** Remove random cubes, orbs, or floating devices. Use data-flow lines, nodes, and structured cards.

## 3. Layout Patterns
- **Widescreen Distribution:** Prioritize horizontal distribution (Left/Right) over vertical stacking.
- **Workflow Diagrams:** Use structured paths to show processes.
- **Information Design:** Use numbered cards, status indicators, and logical groupings.

## 4. Animation Principles
- **Purpose:** Animations must support the narrative (staggered reveal of points).
- **Timing:** Use `cubic-bezier(0.16, 1, 0.3, 1)` (Expo-out) for sophisticated movement.
- **Visible vs Distracting:** Favour subtle slides and fades over aggressive rotations or bounces.

## 5. Content Strategy
- **One Idea per Slide:** Each slide must focus on a single core message.
- **Text Density:** Concise bullet points; avoid paragraphs.
- **Footer:** Minimalist branding with Page Number, Team Name, and Department.

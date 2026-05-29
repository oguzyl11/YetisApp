---
name: Eco-Conscious Marketplace
colors:
  surface: '#fcf9f8'
  surface-dim: '#dcd9d9'
  surface-bright: '#fcf9f8'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f2'
  surface-container: '#f0eded'
  surface-container-high: '#eae7e7'
  surface-container-highest: '#e5e2e1'
  on-surface: '#1c1b1b'
  on-surface-variant: '#3f4944'
  inverse-surface: '#313030'
  inverse-on-surface: '#f3f0ef'
  outline: '#6f7a74'
  outline-variant: '#bec9c3'
  surface-tint: '#086b53'
  primary: '#005440'
  on-primary: '#ffffff'
  primary-container: '#0f6e56'
  on-primary-container: '#9aedcf'
  inverse-primary: '#84d6b9'
  secondary: '#006c4e'
  on-secondary: '#ffffff'
  secondary-container: '#83f5c6'
  on-secondary-container: '#007151'
  tertiary: '#6b3f00'
  on-tertiary: '#ffffff'
  tertiary-container: '#8c5400'
  on-tertiary-container: '#ffd5ac'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#a0f3d4'
  primary-fixed-dim: '#84d6b9'
  on-primary-fixed: '#002117'
  on-primary-fixed-variant: '#00513e'
  secondary-fixed: '#86f8c9'
  secondary-fixed-dim: '#68dbae'
  on-secondary-fixed: '#002115'
  on-secondary-fixed-variant: '#00513a'
  tertiary-fixed: '#ffdcbb'
  tertiary-fixed-dim: '#ffb869'
  on-tertiary-fixed: '#2b1700'
  on-tertiary-fixed-variant: '#673d00'
  background: '#fcf9f8'
  on-background: '#1c1b1b'
  surface-variant: '#e5e2e1'
  mint-bg: '#E1F5EE'
  warm-bg: '#FAEEDA'
  info-blue: '#185FA5'
  info-bg: '#E6F1FB'
  subtle-text: '#6B6B6B'
typography:
  headline-lg:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 28px
  headline-md:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  price-label:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '700'
    lineHeight: 20px
  label-xs:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 32px
---

## Brand & Style

The brand personality is rooted in environmental responsibility and community value, blending the urgency of a marketplace with the warmth of a sustainability-focused initiative. The target audience includes tech-savvy, budget-conscious, and eco-conscious Turkish consumers (18–45).

The design style is **Corporate / Modern** with a **Tactile / Organic** twist. It utilizes a clean, professional structure to build trust while employing soft, rounded geometry and nature-inspired hues to evoke friendliness and approachability. The UI feels grounded and reliable, prioritizing clear communication and ease of use in a fast-paced "daily catch" environment.

## Colors

The palette is anchored by **Deep Green** (Primary), symbolizing stability and the core mission of sustainability. **Fresh Green** (Secondary) is used for positive actions like "Pick-up" tags and success states. **Warm Orange** (Tertiary) provides high-contrast visibility for delivery/courier functions and urgency.

Backgrounds utilize tonal shifts to categorize shop types:
- **Mint BG:** Finer-grained baked goods and general groceries.
- **Warm BG:** Prepared meals and restaurant items.
- **Info BG:** General system messages or blue-themed retail.

The neutral scale uses a very dark charcoal for high legibility on white and mint backgrounds, avoiding pure black to maintain a softer, organic feel.

## Typography

This design system uses **Inter** exclusively to ensure a clean, functional, and highly legible experience across all device types. 

The type hierarchy is optimized for the Turkish language, accounting for frequent use of diacritics and character-dense phrases.
- **Headlines:** Bold and prominent for clear screen titles and shop names.
- **Body:** Slightly smaller than standard (13px–14px) to maximize content density on shop lists and product grids without sacrificing readability.
- **Price Labels:** Emphasized with the primary green and bold weighting to draw the eye immediately to the savings.
- **Badges:** Use the smallest size (11px) with medium weight for "Gel-Al" (Pick-up) and "Kurye" labels.

## Layout & Spacing

The layout follows a **Fluid Grid** model with a base-4 rhythm. On mobile devices, a 16px side margin is mandatory. 

- **Grid:** 4-column for mobile, 12-column for desktop.
- **Gutter:** 16px fixed gutter to maintain air between product cards.
- **Spacing Philosophy:** Generous vertical spacing between sections (24px+) to prevent "content overwhelm," but compact spacing within cards (8px–12px) to keep related information (price, name, time left) tightly grouped.

## Elevation & Depth

Visual hierarchy is achieved through a mix of **Tonal Layers** and **Ambient Shadows**. 

1. **Surface Layers:** The main background is white or off-white. Cards use very subtle tinted backgrounds (Mint or Warm) to indicate category.
2. **Shadows:** Shadows are soft and diffused (Blur 12px, Spread 0, Opacity 4-6% Black) to create a sense of floating objects without feeling "heavy" or overly digital.
3. **Interactive Depth:** Buttons use a slightly deeper shadow on hover/active states.
4. **Dividers:** Used sparingly. Instead, use background color blocks or 1px strokes in a very light grey (#F0F0F0) to separate list items.

## Shapes

The shape language is consistently **Rounded**, reinforcing the friendly and organic brand mission.

- **Shop/Product Cards:** 12px corner radius as the standard.
- **CTA Buttons:** Fully rounded "Pill" style (24px for a 48px height) to maximize tap-friendliness.
- **Badges & Labels:** 4px to 8px radius depending on size.
- **Input Fields:** 12px radius to match the card language, creating a cohesive form experience.
- **Visual Containers:** Images inside cards should have a matching 12px radius on the corners that touch the card edge.

## Components

- **Buttons:** Primary CTA is 48px high, #0F6E56 background, white text. Secondary buttons use a #1D9E75 stroke with a light mint background.
- **Chips / Badges:** Used for delivery type. "Gel-Al" uses #1D9E75 text on #E1F5EE; "Kurye" uses #BA7517 text on #FAEEDA.
- **Shop Cards:** A horizontal layout with a fixed-ratio image on the left, shop name and ratings on the right, and a price/time-left footer.
- **Product Cards:** A 2-column grid layout for "Today's Catch" items. Original price is struck through in #6B6B6B, with the new price in bold #0F6E56.
- **Status Bar:** A vertical timeline for order tracking. The active segment is #BA7517 (Warm Orange) with a pulsating dot.
- **Input Fields:** White background, 1px #E0E0E0 border, 12px radius. Error states use a soft red stroke and subtext.
- **QR Area:** Large, high-contrast QR code container with a 12px radius, centered on a modal with a countdown timer below it.
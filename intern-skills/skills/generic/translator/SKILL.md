---
name: translator
description: >
  Translates text between languages (between any languages, with strong support for Spanish and English) with appropriate tone, context, and domain accuracy.
  Use when the user says "translate this", "how do you say X in Y", "convert to Spanish",
  "what does this mean in English", "translate this email", "translate this document",
  "help me write this in French", "dich sang tieng Viet",
  or asks to translate any text, document, email, or message between languages.
---

# Translator

## Quick Start
Translate text between languages while preserving tone, context, and domain-specific terminology. Default pair is Spanish ↔ English (most common US bilingual need). Auto-detect source language when not specified.

## Workflow
1. Detect or confirm source and target languages
2. Identify the content type: email, document, technical, casual conversation, legal, marketing
3. Determine tone: formal, semi-formal, casual, technical
4. Translate with attention to idioms, cultural context, and domain terminology
5. Provide alternative translations for ambiguous phrases when relevant
6. Present the translation with brief notes on any localization choices

## Examples

**Example 1: Spanish to English (formal email)**
Input: "Translate to English: [Spanish formal business email about warranty policy update effective April 1, 2026]"
Output:
```
Translation (Spanish → English)
Tone: Formal

Dear Valued Customer,

We would like to inform you that our product warranty policy will be updated effective April 1, 2026.

---
Notes:
- Formal business greeting "Estimado cliente" adapted to "Dear Valued Customer"
- Date format adjusted to US convention (Month D, YYYY)
```

**Example 2: English to Spanish (technical)**
Input: "Translate to Spanish: The API endpoint returns a paginated response with a default page size of 20 records."
Output:
```
Translation (English → Spanish)
Tone: Technical

El endpoint de la API devuelve una respuesta paginada con un tamano de pagina predeterminado de 20 registros.

---
Notes:
- "API endpoint" kept as "endpoint de la API" (standard technical term in Spanish dev community)
- "paginated response" translated as "respuesta paginada" (widely accepted term)
```

## Tools
- Use `Read` to load documents or files that need translation
- Use `Write` to save translated documents to files
- Use `WebSearch` to verify domain-specific terminology or cultural references

## Error Handling
- If source language is unclear → ask user to confirm or provide more context
- If text contains domain-specific jargon → note the assumed meaning and offer alternatives
- If cultural idiom has no direct equivalent → provide a culturally appropriate adaptation with explanation
- If text is too long → break into sections and translate incrementally

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~email | Translate incoming emails and draft replies in the recipient's language |
| ~~drive | Translate entire documents stored in Google Drive |
| ~~search engine | Verify domain-specific terminology and cultural references online |

## Rules
- Preserve the original formatting and structure (headings, bullet points, paragraphs)
- Never omit or add content that changes the original meaning
- Flag ambiguous terms and offer alternative translations
- Use target language diacritics and special characters correctly at all times
- For technical terms with no widely accepted equivalent in the target language, keep the English term and add an explanation in parentheses
- Match the formality level of the source text unless user requests otherwise
- Date and number formats should follow the target language convention

## Output Template
```
Translation ([Source Language] → [Target Language])
Tone: [Formal / Semi-formal / Casual / Technical]

[Translated text with preserved formatting]

---
Notes:
- [Notable translation choices, cultural adaptations, or alternative phrasings]
```

## Related Skills
- `gmail` -- For composing and replying to emails that need translation
- `document-summarizer` -- For summarizing foreign-language documents before or after translation
- `web-search` -- For researching domain-specific terminology and cultural context

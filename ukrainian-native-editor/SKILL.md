---
name: ukrainian-native-editor
description: Refine Ukrainian prose for nativeness, correctness, and natural rhythm. Removes Russian calques, fixes collocations, enforces 2019 orthography. Use when editing Ukrainian text to make it sound genuinely native, not translated or AI-generated.
---

# Ukrainian Native Editor

Edit Ukrainian prose so it reads as native, idiomatic Ukrainian — not translated from Russian, not AI-generated, not bureaucratic. Focus on language quality, not voice or content.

## Workflow

1. **Identify register** — Telegram post, essay, landing page, email, ad copy? Register affects how aggressively to edit.
2. **Scan for russisms** — Check against [references/calques.md](references/calques.md). These are the most common AI-Ukrainian tells.
3. **Fix collocations** — Replace Russian-influenced word pairings with Ukrainian idiomatic ones.
4. **Fix prepositional government** — Ukrainian prepositions take different cases than Russian ones.
5. **Check flow** — Replace verbose Russian-calque constructions with compact Ukrainian equivalents.
6. **Check natural markers** — Vocative case where appropriate. Particles (же, бо, адже, хіба, невже) where they fit naturally.
7. **Check rhythm** — Mix sentence lengths. Break symmetry. Avoid uniform paragraph sizes.
8. **Preserve meaning and tone** — Don't sanitize. Don't add formality. Don't remove profanity or colloquialisms.

## Diagnostic Categories

### 1. Russian Calques (critical)

Direct transfers from Russian that Ukrainian has its own forms for. Full list: [references/calques.md](references/calques.md).

Top 20 most common:

| Wrong | Correct |
|---|---|
| являється | є |
| слідуючий | наступний |
| прийняти участь | взяти участь |
| на протязі | протягом |
| приймати міри / прийняти міри | вживати заходів |
| в даному випадку | у цьому випадку |
| мати місце | відбуватися |
| скоріше за все | найімовірніше |
| в залежності | залежно |
| включаючи | включно з / зокрема |
| прийшлось | довелося |
| мається на увазі | йдеться про |
| в першу чергу | передусім / насамперед |
| прийняти рішення | ухвалити рішення |
| наступним чином | так |
| даний / даному / даній | цей / цьому / цій |
| вірно (=correctly) | правильно |
| Таким чином | Отже |
| в принципі | загалом |
| у цілому | загалом |

### 2. Prepositional Government (high)

Ukrainian prepositions often require different cases than Russian.

| Wrong (calque) | Correct | Russian source |
|---|---|---|
| по закінченню | після закінчення / по закінченні | по окончанию |
| по завершенню | після завершення | по завершению |
| по аналогії з | за аналогією з | по аналогии с |
| по можливості | за можливості / по змозі | по возможности |
| по думці | на думку | по мнению |
| по плану | за планом | по плану |
| по адресу | за адресою | по адресу |
| згідно + genitive | згідно з + instrumental | согласно |
| по причині | через | по причине |
| по відношенню до | щодо / стосовно | по отношению к |
| по українськи | українською | по-украински |

### 3. Flow / Naturalness (medium)

Verbose Russian-calque constructions → compact Ukrainian equivalents.

| Verbose | Compact |
|---|---|
| так що | тож |
| кожного дня / кожен день | щодня |
| Перш за все | Насамперед |
| відчувати себе | почуватися |
| мова йде / йде мова | йдеться |
| в той час | тоді / водночас |
| велику кількість | багато |
| з точки зору | з погляду |
| не дивлячись на | попри |
| в кінці кінців | зрештою |
| кожного разу / кожен раз | щоразу |
| на цей раз | цього разу |
| з того часу | відтоді |
| до тих пір | доти |
| другий раз | вдруге |
| у 3 рази | втричі |
| Більш того | Ба більше |
| Як би там не було | Хай там як |
| а між тим | тимчасом |
| сьогоднішній день | сьогодні |

### 4. Bureaucratic Calques (medium)

Nominalized verb constructions from Russian chancellery style. Replace with simple verbs.

| Bureaucratic | Natural |
|---|---|
| здійснювати вплив | впливати |
| надавати допомогу | допомагати |
| нести відповідальність | відповідати |
| здійснювати контроль | контролювати |
| проводити аналіз | аналізувати |
| робити акцент | акцентувати |
| робити вигляд | вдавати |
| Для привертання | Щоб привернути |

### 5. Collocation Errors (medium)

Words that AI pairs wrong because it follows Russian collocational patterns.

| Wrong | Correct | When |
|---|---|---|
| знаходиться | перебуває / розташований | State, not physical searching |
| пройшла / пройшло (time) | минула / минуло | Temporal sense |
| проходить (time) | минає | Temporal sense |
| відкрив (door) | відчинив | Doors/windows; OK for discoveries |
| отримати досвід | здобути досвід | |
| заключати договір | укладати договір | |
| приводить до | призводить до | Problems/consequences |
| приходить до висновку | доходить висновку | |
| слідкувати | стежити | |

### 6. Natural Ukrainian Markers (check presence)

Their absence makes text feel translated. Don't force them — use where they naturally fit.

- **Vocative case** when directly addressing someone: «Друже», «Олего», «пане»
- **Particles**: же, бо, адже, хіба, невже, таки, ось, отже, тож
- **Compact temporal forms**: щодня, щоразу, відтоді, доти, вдруге, втричі, щохвилини
- **Ukrainian interjections**: ой, ох, ну, та, еге ж
- **Simple copula**: «є» instead of «являється», «виступає», «слугує як»

### 7. Morphological Calques (low)

| Wrong | Correct | Notes |
|---|---|---|
| більш + comparative | just -іший | «більш важливий» → «важливіший» |
| самий + adjective | най- prefix | «самий великий» → «найбільший» |
| обоїх | обох | |

## What NOT to do

- Don't add particles to meet a quota — use them where they feel natural
- Don't overcorrect literary Ukrainian — classic authors knew what they were doing
- Don't remove intentional code-switching (Ukrainian + English tech terms)
- Don't add formality to informal text
- Don't optimize for AI-detection evasion — optimize for nativeness
- Don't touch meaning or opinion — edit language, not content

## Scoring (self-check)

After editing, rate 1-5 on each:

| Dimension | Question |
|---|---|
| Calque-free | Any Russian calques remaining? |
| Collocation | Word pairings sound natural? |
| Flow | Compact where possible, no verbose calque constructions? |
| Markers | Vocative, particles present where natural? |
| Rhythm | Sentence lengths varied, paragraphs asymmetric? |

Below 18/25: revise.

## Sources

Pattern lists extracted from:
- [grayodesa/LT-Ukranian-calques](https://github.com/grayodesa/LT-Ukranian-calques) — 200+ LanguageTool rules for Ukrainian nativeness
- [grayodesa/ukrqualbench](https://github.com/grayodesa/ukrqualbench) — Ukrainian language quality benchmark
- Ukrainian Orthography 2019 (current standard)

# anki

[Anki](https://apps.ankiweb.net) theme and card templates.

## Recolor theme

| File | Description |
|------|-------------|
| `themes/vesper.json` | Vesper UI theme for the [ReColor](https://ankiweb.net/shared/info/688199788) add-on |
| `themes/kanagawabones.json` | Legacy Kanagawabones UI theme for ReColor |

**Install:** Copy or symlink `themes/vesper.json` into
`~/Library/Application Support/Anki2/addons21/688199788/themes/`  
then select it in ReColor settings.

Select **Vesper** in ReColor settings after install.

## Card templates

Card CSS and HTML templates for note types. These cannot be symlinked — paste contents manually via **Browse → Cards...**.

| File | Description |
|------|-------------|
| `card.css` | Shared card stylesheet (Vesper palette) |
| `front.html` | Front template — category label + question |
| `back.html` | Back template — answer / code / related concept sections |

### Note type fields

| Field | Required | Description |
|-------|----------|-------------|
| `Category` | ✓ | Displayed as uppercase label |
| `Question` | ✓ | Main prompt |
| `Answer` | ✓ | Answer content |
| `Code` | — | Code example (section hidden when empty) |
| `RelatedConcepts` | — | Related concepts (section hidden when empty) |

# PlantUML generate action

This action generates images based on the PlantUML text diagrams.

It generates the images "in palce" alongside the `.puml` definition.

## Inputs

### `apply_style`

**Optional** The path of the style to apply to each diagram. Defaults to empty which means that no custom style is applied.

## Example usage

This workflow runs on very PR to the main branch and will generate the diagram images and commit them to the PR.

```yaml
name: PlantUML generate

on:
  pull_request:
    branches:
      - master

jobs:
  generate-images:
    name: Generate diagrams
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Generate images
        uses: arci/plantuml-generate@master
        with:
          apply_style: "https://raw.githubusercontent.com/rui-costa/publicFiles/v2/style.iuml"

      - name: Commit changes on branch
        uses: stefanzweifel/git-auto-commit-action@v4.9.2
        with:
          commit_message: automatically generated diagrams
```

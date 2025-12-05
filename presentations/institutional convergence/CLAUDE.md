Polylux - Typst Presentation Slides
What this is: Polylux is a package for the Typst typesetting system that lets you create presentation slides (like PowerPoint or Google Slides, but code-based). It's similar to LaTeX's Beamer package. You write code to define your slides, and it outputs a PDF where each page is one slide.
Basic Setup
typst#import "@preview/polylux:0.4.0": *

#set page(paper: "presentation-16-9")
#set text(size: 25pt)

#slide[
  = My slide title
  Content goes here
]
Revealing Content Progressively
Key feature: You can make content appear piece-by-piece across multiple "subslides" (like PowerPoint animations).
#one-by-one - Show items sequentially
typst#one-by-one[First piece ][Second piece ][Third piece]
#item-by-one - For lists
typst#item-by-one[
  - First item
  - Second item  
  - Third item
]
#show: later - Everything after appears next
typstFirst content
#show: later
Second content
#show: later
Third content
Layout
Side by side content
typst#toolbox.side-by-side[
  Left column
][
  Middle column
][
  Right column
]

// Custom widths
#toolbox.side-by-side(columns: (1fr, 2fr))[
  Narrow
][
  Wide
]
Key Concepts

#only(2)[...] - Content only exists on subslide 2
#uncover(2)[...] - Content hidden on other slides but space reserved
String syntax: #uncover("1-3, 5")[...] = subslides 1,2,3,5
start parameter: #one-by-one(start: 3)[...] begins at subslide 3

Spacing
#v(1em) adds vertical space (1em height)
#v(0.5em) adds half that space
Note: Often unnecessary with #one-by-one since sequential reveals handle spacing naturally
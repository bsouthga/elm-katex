# Render LaTeX in Elm with KaTeX

This package provides a light wrapper over the KaTeX library by Khan Academy.

[KaTeX]: https://github.com/Khan/KaTeX

[Example usage](https://bsouthga.github.io/elm-katex/)


## Basic Usage

```elm
integral : Html msg
integral =
    KaTeX.render """
  \int_0^\infty x\,\mathrm{d}x.
  """
```


## Note!

This library produces elements with the correct KaTeX classes,
but does not include the requisite style sheet to properly display them.
Make sure to include the KaTeX css with your app via
[downloading it here](https://github.com/khan/katex/releases) or
including a link to a CDN.

```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.6.0/katex.min.css">
```


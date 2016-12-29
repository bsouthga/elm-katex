module KaTeX
    exposing
        ( render
        , Options
        , defaultOptions
        , renderWithOptions
        , renderToString
        , renderToStringWithOptions
        )

{-| A library for LaTeX equation parsing. This is just an Elm API built on top of the
[KaTeX](https://github.com/Khan/KaTeX) project which focuses on fast rendering.

# Parsing LaTeX equations
@docs render, renderToString

# Parsing with Custom Options
@docs Options, defaultOptions, renderWithOptions, renderToStringWithOptions
-}

import Html exposing (Html, Attribute)
import Native.KaTeX


{-| Turn a LaTeX expression into an HTML element, using the `defaultOptions`.
    integral : Html msg
    integral =
       KaTeX.render """
     \int_0^\infty x\,\mathrm{d}x.
    """
-}
render : String -> Html msg
render string =
    renderWithOptions defaultOptions string


{-| Some options so you can tweak things for your particular case.
  * `displayMode` &mdash; If true the math will be rendered in display mode,
     which will put the math in display style (so \int and \sum are large,
     for example), and will center the math on the page on its own line.
     If false the math will be rendered in inline mode.
  * `errorColor` &mdash; A color string given in the format "#XXX" or "#XXXXXX".
     This option determines the color which unsupported commands are rendered in.
     (default: #cc0000)
-}
type alias Options =
    { displayMode : Bool
    , errorColor : String
    }


{-| The `Options` used by the `render` and `renderWithOptions` functions.
  { displayMode = False
    , errorColor = "#cc0000"
    }
-}
defaultOptions : Options
defaultOptions =
    { displayMode = False
    , errorColor = "#cc0000"
    }


{-| Render LaTeX expression to Html element with custom options.
    options : Options
    options =
        { defaultOptions | displayMode = True }
    toLaTeX : String -> Html msg
    toLaTeX string =
        KaTeX.renderWithOptions options string
-}
renderWithOptions : Options -> String -> Html msg
renderWithOptions options string =
    Native.KaTeX.render options string


{-| Render a LaTeX expression into a string of html, using the `defaultOptions`.
    integral : String
    integral =
       KaTeX.renderToString """
     \int_0^\infty x\,\mathrm{d}x.
    """
-}
renderToString : String -> String
renderToString string =
    renderToStringWithOptions defaultOptions string


{-| Render LaTeX expression to string with custom options.
    options : Options
    options =
        { defaultOptions | displayMode = True }
    toLaTeX : String -> String
    toLaTeX string =
        KaTeX.renderToStringWithOptions options string
-}
renderToStringWithOptions : Options -> String -> String
renderToStringWithOptions options string =
    Native.KaTeX.renderToString options string

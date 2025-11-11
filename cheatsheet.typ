#import "@preview/showybox:2.0.4"
// #import "/typst/lib.typ": *

#set page(columns: 3, margin: 5pt)
#set columns(gutter: 0pt)
#set text(size: 8pt)

// #show: note => classnote(note, title: "o-piccolo")
#place(
  top + center,
  float: true,
  scope: "parent",
  text(1.4em, weight: "bold")[
    Analisi 1 Cheatsheet
  ],
)

#let section(title, content) = {
    showybox.showybox(
        title: title,
        frame: (radius: 0pt),
        title-style: (
            weight: "medium",
            sep-thickness: 0pt,
        ),
        below: 0pt,
    )[#content]
}

#lorem(10)

#section[limiti notevoli][
    #lorem(100)
]
#section[limiti notevoli][
    #lorem(100)
]
#section[limiti notevoli][
    #lorem(250)
]
#section[limiti notevoli][
    #lorem(100)
]
#section[limiti notevoli][
    #lorem(100)
]
#section[limiti notevoli][
    #lorem(100)
]
#section[limiti notevoli][
    #lorem(130)
]
#section[limiti notevoli][
    #lorem(120)
]
#section[limiti notevoli][
    #lorem(100)
]

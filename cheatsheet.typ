#import "@preview/showybox:2.0.4"
// #import "/typst/lib.typ": *

#set page(columns: 5, margin: 5pt, flipped: true)
#set columns(gutter: 0pt)
#set text(size: 6pt, font: ("Atkinson Hyperlegible Next", "Atkinson Hyperlegible"))

// #show: note => classnote(note, title: "o-piccolo")
#place(
  top + center,
  float: true,
  scope: "parent",
  text(1.4em, weight: "bold")[
    Analisi 1 Cheatsheet
  ],
)

#let section(title, content, color: black) = {
  set table(stroke: color)

  showybox.showybox(
    title: [*#upper(title)*],
    frame: (
      radius: 1pt,
      title-inset: 1pt,
      inset: 4pt,
      title-color: color,
      border-color: color,
      // body-color: color.transparentize(90%),
    ),
    title-style: (
      weight: "medium",
      sep-thickness: 0pt,
    ),
    below: 0pt,
  )[#content]
}

#let iff = $arrow.double.l.r$

#section(color: green.darken(30%))[serie matematiche][
  === Serie notevoli
  #table(columns: (1fr, 1fr))[
    $ sum 1/n^lambda $

    converge per $lambda > 1$
  ][
    $ sum 1/(n |log n|^lambda) $

    converge per $lambda > 1$
  ]
  === Criteri di convergenza
  #table(columns: (auto, auto), inset: 0pt)[
    #table[
      === Criterio del confronto
      Date due serie $sum a_n "e" sum b_n$ tale che $L = lim_(n->oo) (a_n)/(b_n)$
      - $L in RR =>$ $C(a_n)$ #iff $C(b_n)$
      - $L = 0 =>$ $C(b_n)$ $=> C(a_n)$
      - $L = oo =>$ $not(C(b_n))$ $=> not(C(a_n))$
    ][
      === Criterio di Sostituzione
      $C(sum a_n) iff C(sum 2^n a_(2n))$
    ]
  ][
    #table[
      - $L$ > 1 diverge
      - $L$ < 1 converge
    ][
      === Criterio del repporto
      $L = lim_(n->oo) a_(n+1)/a_n$][
      === Criterio della radice
      $L = lim_(n->oo) root(n, a_n)$
    ]
  ]
]
#section(color: red.darken(50%))[limiti notevoli][
  #set text(size: 5pt)
  #table(columns: (1fr, 1fr, 1fr))[
    $ lim_(x->0) frac(sin x, x) = 1 $][
    $ lim_(x->0) (log_a (1 + x))/ x = 1/(ln a) $][
    $ lim_(x->oo) (1 + 1/x)^x = e $][
    $ lim_(x->0) (overbrace(a^x, a>0) - 1)/(x) = ln a $][
    $ lim_(x->0) (1 - cos x)/(x^2) = 1/2 $][
    $ lim_(x->0) ((1+x)^k - 1)/x = k $][
    $ lim_(x->0) (tan x)/x = 1 $][
    $ lim_(x->0) arcsin(x)/x = 1 $][
  ]
]
#section(color: aqua.darken(30%))[sviluppi di taylor][
  #table(columns: (auto, 1fr))[
    $ sin(x) $
  ][
    $x - x^3/6 + x^5/120 - x^7/5040 + o(x^7)$
  ][
    $cos(x)$
  ][
    $1 - x^2/2 + x^4/24 - x^6/720 + x^8/40320 + o(x^8)$
  ][
    $tan(x)$
  ][
    $x + x^3/3 + 2/15x^5 + o(x^5)$
  ][
    $sec(x)$
  ][
    $1 + x^2/2 + 5/24x^4 + 61/720x^6 + 277/8064x^8 + o(x^8)$
  ][
    $arcsin(x)$
  ][
    $x + x^3/6 + 3/40x^5 + 5/112x^7 + 35/1152x^9 + o(x^9)$
  ][
    $arccos(x)$
  ][
    $pi/2 - x - x^3/6 - 3/40x^5 - 5/112x^7 = 35/1152x^9 + o(x^9)$
  ][
    $arctan(x)$
  ][
    $x - x^3/3 + x^5/5 - x^7/7 + x^9/9 + o(x^9)$
  ][
    $e^x$
  ][
    $1 + x + x^2/2! + x^3/3! + x^4/4! + x^5/5! + o(x^5)$
  ][
    $ln(1+x)$
  ][
    $x - x^2 + x^3/3 - x^4/4 + x^5/5 + o(x^5)$
  ][
    $(1+x)^alpha$
  ][
    $1 + alpha x + (alpha(alpha -1))/2!x^2 + (alpha(alpha-1)(alpha-2))/3! x^3 + o(x^3)$
  ][
    $1/(1-x)$
  ][
    $1 + x + x^2 + x^3 + ... + x^n + o(x^n)$
  ][
    $1/(1 + x^2)$
  ][
    $1 - x^2 + x^4 - x^6 + ... + o(x^n)$
  ][
    $sinh(x)$
  ][
    $x + x^3/6 + x^5/120 + x^7/5040 + o(x^7)$
  ][
    $cosh(x)$
  ][
    $1 + x^2/2 + x^4/24 + x^6/720 + o(x^6)$
  ][
    $tanh(x)$
  ][
    $x - x^3/3 + 2/15x^5 - 17/315x^7 + 62/2835x^9 + o(x^9)$
  ]
]
#section[definizioni][
  Da mettere:
  - definizione massimo minimo ecc ecc

  === Funzioni $f:A -> B$

  #table(columns: (auto, auto))[
    === Suriettiva
    $ forall b in B exists a in A | f(a) = b \ "Im"(f) = B $
    #image("./assets/suriettiva.png", height: 30pt)
  ][
    === Iniettiva
    $ forall a_1, a_2 in A | a_1 != a_2 \ => f(a_1) != f(a_2) $
    #image("./assets/iniettiva.png", height: 30pt)
  ]

  === Limiti
  #table(columns: (1fr, 1fr, 3.5fr))[
    $ x->c $
  ][
    $ L in RR $
  ][
    $forall epsilon > 0 exists delta > 0 | delta > |x-c| => |f(x) - L| < epsilon$
  ][
    $ x->c $
  ][
    $ L = plus.minus oo $
  ][
    $forall M > 0 exists delta > 0 | delta > |x-c| => plus.minus f(x) > M$
  ][
    $ x->plus.minus oo $
  ][
    $ L in RR $
  ][
    $forall epsilon > 0 exists M > 0 | |x| > M => |f(x) - L| < epsilon$
  ][
    $ x->plus.minus oo $
  ][
    $ L = plus.minus oo $
  ][
    $forall M > 0 exists R > 0 | |x| > R => plus.minus f(x) > M$
  ]
]

#pagebreak()

ciao

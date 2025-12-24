#import "@preview/showybox:2.0.4"
// #import "/typst/lib.typ": *

// Settings generali per ridurre spazio sprecato
#set text(size: 4.5pt, font: (
  "Atkinson Hyperlegible Next",
  "Atkinson Hyperlegible",
))
#set table(inset: 3pt)

#let rainbow(content) = {
  set text(fill: gradient.linear(..color.map.inferno.map(a => a.darken(30%))))
  box(content)
}

#let footer = [
  #pad(y: -2pt)[
    #h(1fr)
    _Made by #rainbow[Pietro Tamilia] (BRA1L0R) and #rainbow[Matteo Grande] (MattWaX)_
  ]
]

#set page(columns: 5, margin: 5pt, flipped: true, footer: footer)
#set columns(gutter: 0pt)
#place(
  top + center,
  float: true,
  scope: "parent",
  text(1.4em, weight: "bold")[
    Analisi 1 Cheatsheet
  ],
)

#let section(title, content, color: black, raw: false) = {
  set table(stroke: color)

  showybox.showybox(
    title: [*#upper(title)*],
    frame: (
      radius: 1pt,
      title-inset: 1pt,
      inset: if raw { 0pt } else { 4pt },
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
    === Serie armonica
    $ sum 1/n^lambda $

    converge per $lambda > 1$ #h(1fr) #box(inset: -2pt)[#image(height: 10pt, "assets/very-important-cat.jpeg")] #h(1pt)
  ][
    === Serie armonica 2
    $ sum 1/(n |log n|^lambda) "&" sum 1/(n log_lambda n) $

    converge per $lambda > 1$
  ][
    === Serie telescopica
    $ sum b_(n+1) - b_n = lim_(n -> oo) b_(n+1 - b_n) $
    converge $lim_(n->oo) b_n = L$
  ]
  === Criteri di convergenza $C(s_n) = s_n "converge"$
  #table(columns: (1fr, 1fr), inset: 0pt)[
    #table(columns: 1fr)[
      === Criterio del confronto
      Date due serie $sum a_n "e" sum b_n$ tale che $L = lim_(n->oo) (a_n)/(b_n)$
      - $L in RR =>$ $C(a_n)$ #iff $C(b_n)$
      - $L = 0 =>$ $C(b_n)$ $=> C(a_n)$
      - $L = oo =>$ $not(C(b_n))$ $=> not(C(a_n))$
    ]
  ][
    #table(columns: 1fr)[
      Condizioni comuni:
      - $L$ > 1 diverge
      - $L$ < 1 converge
    ][
      === Criterio del rapporto
      $L = lim_(n->oo) a_(n+1)/a_n$][
      === Criterio della radice
      $L = lim_(n->oo) root(n, a_n)$
    ][
      === Criterio di Sostituzione
      $C(sum a_n) iff C(sum 2^n a_(2n))$
    ]
  ]

  === Criteri di convergenza x segno variabile
  #table(columns: (1fr, 1fr), inset: 0pt)[
    #table(columns: 1fr)[
      === Criterio conv. assoluta
      $C(sum |a_n|) => C(sum a_n)$
    ][
      === Criterio di Dirichet
      $a_n, b_n$ #underline[successioni]:
      - $sum a_n$ è limitata
      - $b_n -> 0$
      - $b_(n+1) <= b_n$
      Allora $sum a_n b_n$ converge
    ]
  ][
    #table(columns: 1fr)[
      === Criterio di Leibnitz
      #grid(columns: (1fr, 1.2fr))[$sum (-1)^n alpha_n$][
        1. $alpha_n > 0$ definitivam.
        2. $alpha_n -> 0$
        3. $alpha_(n+1) <= alpha_n$
      ]
      Allora converge
    ][
      === Teorema dei carabinieri
      $ a_n <= phi_n <= b_n $
      $C(a_n) and C(b_n) => C(phi_n)$
    ]
  ]
]

#section(color: purple.darken(50%))[definizioni][
  Da mettere:
  - definizione massimo minimo ecc ecc
  - definizione SUP INF
  - definizione funzione lipschizstiana o come cazzo si scrive

  === Funzioni $f:A -> B$

  #table(columns: (1fr, 1fr))[
    === Suriettiva
    $ forall b in B exists a in A | f(a) = b \ "Im"(f) = B $

    #set align(center)
    #image("./assets/suriettiva.png", height: 30pt)
  ][
    === Iniettiva
    $ forall a_1, a_2 in A | a_1 != a_2 \ => f(a_1) != f(a_2) $

    #set align(center)
    #image("./assets/iniettiva.png", height: 30pt)
  ]

  === Limiti
  #set text(size: 4.5pt);
  #table(columns: (1fr, 1fr, 4fr))[
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

#section(color: red.darken(50%))[Limiti][
  *Ordini per $x->oo$*: $log x < sqrt(x) < x^k < k^x < x! < x^x$

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
    $f(x)_(x=a)$
  ][
    $f(a) + (f'(a))/1!(x - a) + (f''(a))/2!(x - a)^2 + (f'''(a))/3!(x - a)^3 + o(x^3)$
  ][
    $sin(x)$
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
    $pi/2 - x - x^3/6 - 3/40x^5 - 5/112x^7 - 35/1152x^9 + o(x^9)$
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
    $x - x^2/2 + x^3/3 - x^4/4 + x^5/5 + o(x^5)$
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

  proprietà degli o piccolo
  #table(columns: (1fr, 1fr, 1fr))[
    $o(g) plus.minus o(g) = o(g)$
  ][
    $o(g) dot o(g) = o(g^2)$
  ][
    $o(g)/o(g) = 0$
  ][
    $o(o(g)) = o(g)$
  ][
    $a dot o(g) = o(g)$
  ][
    $o(1) = "infinitesimo"$
  ]
]


#section()[funzioni iperboliche][
  #table(columns: (auto, auto, 1fr))[
    $sinh x = (e^x - e^(-x))/2$
  ][
    $ lim_(x->plus.minus oo) sinh x = plus.minus oo $
  ][
    dispari
  ][
    $cosh x = (e^x + e^(-x))/2$
  ][
    $ lim_(x->plus.minus oo) cosh x = plus oo $
  ][
    pari
  ][
    $tanh x = (sinh x)/(cosh x) = (e^x - e^(-x))/(e^x + e^(-x))$
  ][
    $ lim_(x->plus.minus oo) tanh x = plus.minus 1 $
  ][
    dispari
  ]

  #table(columns: (1fr, 1fr))[
    $ sinh(2x) = 2 sinh x cosh x $
  ][
    $ cosh(2x) = (sinh x)^2 + (cosh x)^2 $
  ]
  $ (cosh x)^2 - (sinh x)^2 = 1 $
]
#section[formule trigonometriche][
  - Funzioni trigonometriche, simmetrie, definizioni
  - Formule trigonometriche tutte quelle possibili immaginabili
    - Addizione
    - Duplicazione
    - Bisezione
    - Prostaferesi
    - Parametriche
]

#section(color: rgb("#a47b1d"))[derivate / primitive][

  TODO:
  - Retta tangente
  - Punti di non derivabilità

  #let derivate = rgb("#78101c");
  #let integrali = rgb("#0a0885");

  #set text(5pt)
  //top table -----------------------------------------------------------------
  #table(
    columns: (0.3fr, 0.25fr, 0.3fr, 2pt, 0.3fr, 0.25fr, 0.5fr),
    inset: 2pt,
    align: (horizon, horizon, horizon),

    table.header(
      align(center)[
        #text(
          fill: derivate,
          [*$d/(d x) f(x)$*],
        )],
      align(center)[*$f(x)$*],
      align(center)[
        #text(
          fill: integrali,
          [*$F(x)$*],
        )],
      [#text(
        [],
      )],
      align(center)[
        #text(
          fill: derivate,
          [*$d/(d x) f(x)$*],
        )],
      align(center)[*$f(x)$*],
      align(center)[
        #text(
          fill: integrali,
          [*$F(x)$*],
        )],
    ),
  )[
    #text(
      fill: derivate,
      $ 0 $,
    )
  ][
    $ a $
  ][
    #text(
      fill: integrali,
      $ a x $,
    )
  ][
    #text(
      [],
    )
  ][
    #text(
      fill: derivate,
      $ a x^(a-1) $,
    )
  ][
    $ x^a $
  ][
    #text(
      fill: integrali,
      $ (x^(a+1))/(a+1) space #text(4pt)[con $ x != -1 $] $,
    )
  ][
    #text(
      fill: derivate,
      $ e^x $,
    )
  ][
    $ e^x $
  ][
    #text(
      fill: integrali,
      $ e^x $,
    )
  ][
    #text(
      [],
    )
  ][
    #text(
      fill: derivate,
      $ a dot log(a) $,
    )
  ][
    $ a^x $
  ][
    #text(
      fill: integrali,
      $ (a^x)/(log(a)) $,
    )
  ][
    #text(
      fill: derivate,
      $ cos x $,
    )
  ][
    $ sin x $
  ][
    #text(
      fill: integrali,
      $ -cos x $,
    )
  ][
    #text(
      [],
    )
  ][
    #text(
      fill: derivate,
      $ -sin x $,
    )
  ][
    $ cos x $
  ][
    #text(
      fill: integrali,
      $ sin x $,
    )
  ][
    #text(
      fill: derivate,
      $ cosh x $,
    )
  ][
    $ sinh x $
  ][
    #text(
      fill: integrali,
      $ cosh x $,
    )
  ][
    #text(
      [],
    )
  ][
    #text(
      fill: derivate,
      $ sinh x $,
    )
  ][
    $ cosh x $
  ][
    #text(
      fill: integrali,
      $ sinh x $,
    )
  ]


  //bottom table----------------------------------------------
  #table(
    columns: (2fr, 1fr, 2fr),
    inset: 2pt,
    align: (horizon, horizon, horizon),

    table.header(
      align(center)[
        #text(
          fill: derivate,
          [*$d/(d x) f(x)$*],
        )],
      align(center)[*$f(x)$*],
      align(center)[
        #text(
          fill: integrali,
          [*$F(x)$*],
        )],
    ),
  )[
    #text(
      fill: derivate,
      $ -1/x^2 $,
    )
  ][
    $ 1/x $
  ][
    #text(
      fill: integrali,
      $ ln abs(x) $,
    )
  ][
    #text(
      fill: derivate,
      $ 1/(cos^2 x) = 1 + tan^2 x $,
    )
  ][
    $ tan x $
  ][
    #text(
      fill: integrali,
      $ -ln abs(cos x) $,
    )
  ][
    #text(
      fill: derivate,
      $ 1 / sqrt(1 - x^2) $,
    )
  ][
    $ arcsin x $
  ][
    #text(
      fill: integrali,
      $ x arcsin x + sqrt(1 - x^2) $,
    )
  ][
    #text(
      fill: derivate,
      $ -1/sqrt(1-x^2) $,
    )
  ][
    $ arccos x $
  ][
    #text(
      fill: integrali,
      $ x arccos x - sqrt(1- x^2) $,
    )
  ][
    #text(
      fill: derivate,
      $ 1/(1+x^2) $,
    )
  ][
    $ arctan x $
  ][
    #text(
      fill: integrali,
      $ x arctan x - 1/2 ln(1+x^2) $,
    )
  ][
    $ 1/sqrt(1 + x^2) $
  ][
    $ "arcsinh"(x) $
  ][
    $ x "arcsinh"(x) - sqrt(1 + x^2) $
  ][
    $ 1/(sqrt(1-x) sqrt(1 + x)) $
  ][
    $ "arccosh"(x) $
  ][
    #text(size: 4pt)[
      $ x "arccosh"(x) - sqrt(1-x) sqrt(1 + x) $
    ]
  ][
    $ 1/(1 - x^2) $
  ][
    $ "arctanh"(x) $
  ][
    #text(size: 4pt)[
      $ x "arctanh"(x) + 1/2 ln(1 - x^2) $
    ]
  ]

  === Algebretta delle derivate
  #table(columns: (auto, 1fr))[
    $ [f(x) plus.minus g()]' = f'(x) plus.minus g'(x) $
  ][
    $ [k f(x)]' = k f'(x) $
  ][
    $ [f(x) dot g()]' = f'(x) dot g(x) + f(x) dot g'(x) $
  ][
    $ [f(g(x))]' = f'(g(x)) dot g'(x) $
  ][
    $ [(f(x))/(g(x))]' = -(f'(x) dot g(x) - f(x) dot g'(x))/(g^2(x)) $
  ][
    $ [1/(f(x))]' = -(f'(x))/(f^2(x)) $
  ]
]

#section[integrali][
  === Proprietà
  #table(columns: (auto, auto))[
    $integral_a^b f(x) + g(x) d x = integral_a^b f(x) d x + integral_a^b g(x) d x$
  ][
    $integral_a^b lambda f(x) d x = lambda integral_a^b f(x) d x$
  ][
    $f(x) >= g(x) => integral_a^b f(x) >= integral_a^b g(x) d x$
  ][
    $|integral_a^b f(x) d x| <= integral_a^b |f(x)| d x$
  ][
    $integral_a^b f(x) d x = integral_a^c f(x) d x + integral_c^b f(x) d x$
  ]

  === Teoremi
  #table(columns: (1fr, 1fr))[
    ==== Media integrale
    $f : [a,b] -> RR$ allora
    $exists c in [a,b]$:\
    $ mu = f(c) = (integral_a^b f(x) d x)/(a-b) $
  ][
    ==== Media integrale pesata
    $f,g : [a,b] -> RR$ con $g > 0$ in $[a,b]$ allora
    $exists c in [a,b]$:\
    $ integral_a^b f(x)g(x) d x = f(c) integral_a^b g(x) d x $
  ]

  === Tecnice d'Integrazione
  #table(columns: 1fr, inset: 0pt)[
    #table(columns: (1fr, 1fr))[
      ==== Per Parti (integrale indefinito)
      $ integral F dot g" "d x = F dot G - integral f dot G" "d x $
    ][
      ==== Per Parti (integrale definito)
      $
        integral_a^b F dot g" "d x = [F dot G]_a^b - integral_a^b f dot G" "d x
      $
    ]
  ][
    #table(columns: (1fr, 1fr))[
      ==== Sostituzione (Metodo 1)
      $ integral f(x) d x = integral f(g(t)) g'(t) d t $
      $ x = g(t) " e " d x = g'(t) d t $
    ][
      ==== Sostituzione (Metodo 2)
      $ integral f(g(x)) g'(x) d x = integral f(t) d t $
      $ g(x) = t " e " g'(x) d x = d t $
    ]
  ][
    #table(columns: 1fr)[
      ==== Funzioni Razionali
      $ integral (P(x))/(Q(x)) d x $

      ===== Passo 1: Divisione
      Se $"grado" P(x) >= "grado" Q(x)$:
      $ (P(x))/(Q(x)) = A(x) + (R(x))/(Q(x)) $
      Dove $A(x)$ è il risultato e $R(x)$ è il resto della divisione

      ===== Passo 2: Fattorizzazione
      Scomporre il polinomio al denominatore in prodotti di polinomi di primo grado

      ===== Passo 3: Sistema Lineare
      Riscrivere la funzione razionale in somma di funzioni razionali più semplici \
      Per ogni $A/(x - a)^n$ \
      Scriviamo $A/(x - a) + A/(x - a)^2 + dots + C/(x - a)^n$ \
      Infine trovare i valori delle costanti al numeratore imponendo un sistema lineare

      ===== Passo 4: Integrazione
      Integrare le funzioni razionali semplici, usando
      #align(center)[
        #table(columns: auto)[
          $ integral (f'(x))/f(x) d x = ln|f(x)| $
        ]
      ]
    ]
  ]

  === Integrali Impropri
  #table(columns: 1fr)[
    Un integrale è detto improprio quando uno o entrambi i seguenti casi sono veri:
    #table(columns: (1fr, 1fr))[
      ==== Prima Specie
      L'intervallo di integrazione è illimitato
      $ integral_a^oo f(x) d x ==> lim_(t->oo) integral_a^t f(x) d x $
    ][
      ==== Seconda Specie
      L'integranda non è limitata \
      Se $f(x)$ non è definita in $a$
      $ integral_a^b f(x) d x ==> lim_(t->0) integral_(a+t)^b f(x) d x $
    ]

  ]

  Da mettere:
  - integrali circolari? (il grande ritorno)
  - solidi per integrazione
  - qualche trucco sulle aree?
]

#section[numeri complessi][
  === Polinomio a coefficienti reali
  #text(size: 4pt)[
    - Un polinomio di qualsiasi grado $n$ a coefficienti reale ha esattamente $n$ soluzioni.
    - Se il polinomio è complesso allora ogni soluzione complessa avrà anche il suo coniugato
  ]

  #table(columns: (1fr, auto, auto))[
    $z in CC$\
    $z = a + i b$\
    con $a, b in RR$\
    e $i^2=-1$
  ][
    ==== Complesso coniugato
    $overline(z) = a - b i$
    ==== Modulo
    $|z| = |overline(z)| = sqrt(a^2 + b^2)$
  ][
    === Piano di gauss
    $z=(a,b) in RR times RR = RR^2$\
    $Im(z) ~ y$ sul piano cartesiano\
    $Re(z) ~ x$ sul piano cartesiano
  ]
  === Algebretta
  #table(columns: (1fr, 1fr))[
    $z = a + b i$ ][ $z= c + d i$
  ][ $z+w = (a+c) + i(b+d)$ ][ $z dot w = (a c - b d) + i(a d + b c)$
  ][ $1/z = a/(a^2 + b^2) - (b i)/(a^2 + b^2)$ ][
    $z/w = (a c + b d)/(c^2 + d^2) + i (b c - a d)/(c^2 + d^2)$
  ]
  === Trigonometria
  #table(columns: (1fr, 1fr))[
    $z = rho(cos theta + i sin theta) = rho e^(i theta)$
  ][
    $w = r(cos phi + i sin phi) = r e^(i phi)$
  ][
    $z dot w &= rho dot r [cos(theta + phi) + i sin(theta + phi)]$
  ][
    $z / w &= rho / r [cos(theta - phi) + i sin(theta - phi)]$
  ][
    $z^n = rho^n e^(i theta n) = rho^n [cos(theta n) + i sin(theta n)]$
  ]

  === Radici del polinomio
  Sia $w in CC$, si dice che $z$ è una radice _n-esima_ complessa di $w$ se $z^n = w$,
  se $z != 0$ allora esistono $n$ radici n-esime complesse

  Se $z = rho e^(i theta)$ e $w = r e^(i phi)$
  allora $z^n = w => rho^n e^(n i theta) = r e^(i phi)$\
  Allora si ha che\
  #align(center)[
    $rho = root(n, r)$ e $theta_k = phi/n + (2k pi)/n$ con $k = 0,1,dots,n-1$
  ]

  - Identità di eulero
  - Identità trigonometriche e numeri complessi
]
#section[equazioni differenziali][
  === Un po' di teoria i guess?
  - Lo spazio vettoriale delle soluzioni di un'equazione differenziale di grado $n$
    ha $dim V = n$
  #table(columns: (1fr, 1fr))[
    === Variabili separabili
    $ y'(x) = y(x)g(x) $
    Si risolve dividendo per $y(x)$ \
    $arrow.double integral (y'(x))/y(x) = integral g(x)$
  ][
    === Lineari del primo ordine
    $ y'(x) = y(x)f(x) + g(x) $
    Si può procedere in 2 modi:
    1. Risolvere la variabili separabili omogenea associata e poi cercare il fattore $overline(u)(x)$
    2. $u(x) = e^(-F(x)) dot integral e^(F(x))g(x) d x$
  ][
    === Secondo ordine lineari om.
    $ a u''(x) + b u'(x) + c u(x) = f(x) $
    1. Trovare l'equazione associata $a lambda^2 + b lambda + c = 0$
      - $Delta > 0 => c_1 e^(lambda_1 x) + c_2 e^(lambda_2 x)$
      - $Delta = 0 => c_1 e^(lambda x) + underline(x) c_2 e^(lambda x)$
      - $Delta < 0 =>$\ $e^(alpha x)(c_1 cos(x) + c_2 sin (x))$\
        #text(size: 4pt)[La soluzione è nella forma $alpha plus.minus beta i$]
  ][
    === Secondo ordine lineari
    (continuazione...)
    2. Se l'eq $eq.not$ omogenea
      allora trovare fattore $overline(u)(x)$ tale che
      #text(
        size: 4pt,
      )[$a overline(u'')(x) + b overline(u')(x) + c overline(u)(x) = f(x)$]
      - $f(x) = e^(alpha t) => a e^(alpha t)$
      - $f(x) =$ polinomio $n$ $=>$ ''
      - $f(x) = sin(x)"/"cos(x) => a sin(x) + b cos(x)$
      - $f(x) = "soluzione omogenea"$ \
        $=>$ se $f(x)$ è soluzione omogenea, allora moltiplicare per $x$ q.b.
  ]
]

#pagebreak()

#image("assets/grafici-1.png")
#image("assets/grafici-2.png")
#image("assets/grafici-3.png")

Grafici di funzione (insieme alle loro derivate?) da inserire con piene notazioni:
- e^x
- log(x)
- sin, cos, tan, cot, sec, csc,
- arcsin, arccos, arctan
- sinh, cosh, tanh

#import "../libs/template.typ": *

= Koszul Complexes and (Co)homology

We generally follow @weibel[Section 4.5].

== Koszul Complexes

#definition[
Let $R$ be a ring and let $x in Z lr((R))$ be a central element. Then we
define the *Koszul complex* $K_cx lr((x))$ of $x$ to be the chain complex
$ 0 arrow.r R arrow.r^x R arrow.r 0 $ concentrated in degrees $1$ and $0$, where the differential $R ->^x R$ is multiplication by $x$.

We denote the generator of $K_1 lr((x))$ by $e_x$, so that
$K_1 lr((x)) eq R dot.op e_x comma K_0 lr((x)) eq R dot.op 1$, and
$d (e_x) eq x$.

If $bd(x) = (x_1, ..., x_n)$ is a finite sequence of central elements, define $K(bd(x))$ as the total tensor product complex of
$
  K(x_1) tpr K(x_2) tpr ... tpr K(x_n)
$
]

Notice that $C := K(x_1) tpr ... tpr K(x_n)$ is an "$n$-dimensional complex" (which can be seen as a generalisation of a double complex). In particular, $C$ has in total $2^n$ terms, and a typical term in $C$ is indexed by an $n$-tuple of $0$ and $1$. For example, if $n = 4$, $C$ has a term $ C_(0, 1, 1, 0) = (R dot 1) tpr (R dot e_(x_2)) tpr (R dot e_(x_3)) tpr (R dot 1) $
which has total degree $2$. (We can also see that by repetitively applying @r-tp-m, each term in $C$ is isomorphic to $R$, albeit with different generators.)

By definition, $K(bd(x))$ is the total complex of $C$, where the degree $p$ part of $K(bd(x))$, denoted as $K_p (bd(x))$, is the direct sum of all terms in $C$ which has total degree $p$. Using basic combinatorics, we see that:
#proposition[
  $K_p (bd(x))$ is a free $R$-module with rank $vec(n, p)$.
]
#proof[
  By the discussion above, there are $vec(n, p)$ terms in $C$ that have total degree $p$, because finding such a term in $C$ is the same as finding an binary $n$-tuple with $p$ ones and $(n-p)$ zeros. Since each term in $C$ is isomorphic to $R$, $K_p (bd(x))$ is isomorphic to the direct sum of $vec(n, p)$ $R$'s.
]
#remark[
In particular, $K_p lr((bd(x)))$ is isomorphic to the $p$-th exterior
product $Lambda^p R^n$ of $R^n$, so $K lr((x))$
is often called the *exterior algebra complex*. 
]

Now we can give a better description for the chain complex $K(bd(x))$.

#definition[
Let the
symbols 
$ e_(i_1) and dots.h.c and e_(i_p) eq underbrace(1 times.circle dots.h.c times.circle 1 times.circle e_(x_(i_1)) times.circle dots.h.c times.circle e_(x_(i_p)) times.circle dots.h.c times.circle 1, n" terms") quad lr((1 <= i_1 lt dots.h.c lt i_p <= n)) dot.basic $
generate the free $R$-module $K_p (bd(x))$.
// ]
// We also state the differential on $K(bd(x))$ as follows.
// #proposition[
Then the differential#footnote[Strictly speaking, the differential of $K(bd(x))$ should be able to be derived from the differential of an "$n$-dimensional total complex", but we have not defined the general case formally (as we certainly do not need to). Hence we simply state the differential of $K(bd(x))$ as a definition.]
$K_p lr((bold(bd(x)))) arrow.r K_(p minus 1) lr((bold(x)))$ sends
$e_(i_1) and dots.h.c and e_(i_p)$ to
$ sum_(k=1)^p lr((minus 1))^(k plus 1) x_(i_k) e_(i_1) and dots.h.c and hat(e)_(i_k) and dots.h.c and e_(i_p) $
]
<kpx>

#example[
 As an example, when $n = 2$, we have the tensor product double complex: 
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZARgBoAGAXVJADcBDAGwFcYkQAKAJQAIoIcPGAH0OAD2HEAlFJ440AJx7c+AoaIkAmGSAC+pdJlz5CKMsWp0mrdiv6CR4yTLmLlvez2l6DIDNjwCInJSCxoGFjZETg81aVclOzipH0MAk2CKSwibaKTBePlE2IcNYW0U3UsYKABzeCJQADMFCABbJBCQHAgkAGZw6yjOCW99ZtaOxDJu3sRNQcj2UdSQFvbOmh6kGZzhgFotVfWpgdmkBasl6KOq3SA
#align(center, commutative-diagram(
  node-padding: (50pt, 50pt),
  node((0, 1), [$(R dot e_(x_1)) tpr (R dot e_(x_2))$]),
  node((1, 1), [$(R dot e_(x_1)) tpr (R dot 1)$]),
  node((1, 0), [$(R dot 1) tpr (R dot 1)$]),
  node((0, 0), [$(R dot 1) tpr (R dot e_(x_2))$]),
  arr((0, 1), (0, 0), [$x_1 tp 1$]),
  arr((1, 1), (1, 0), [$x_1 tp 1$]),
  arr((0, 1), (1, 1), [$-1 tp x_2$]),
  arr((0, 0), (1, 0), [$1 tp x_2$]),
))

$K lr((x_1 comma x_2))$ is the total complex
// #align(center,image("../imgs/2023-11-25-10-34-10.png",width:80%))
// https://t.yw.je/#N4Igdg9gJgpgziAXAbVABwnAlgFyxMJZABgBpiBdUkANwEMAbAVxiRGJAF9T1Nd9CKAIzkqtRizYAlLjxAZseAkQBMo6vWatEIKQD0Vs3ooFEAzOvFbpR+XyWDkAFkubJOjt2P9lKMkLE3bRAAHRAAIzpsOEQw2wUfRxEAjQlg4BgAfQAKAA9MoQBKAAI6MChirLzMlRLOePtTFDUUq3cQDJz82tJKroLC+q87E19kC1agtmAhIbEYKABzeCJQADMAJwgAWyQyEBwIJFm5TZ3j6kOkNTbg6pFigFpuwtsz3cQbq8QLW7YaGAAY3uvReby2H1+3ycnAonCAA
#align(center, commutative-diagram(
  node-padding: (50pt, 10pt),
  node((0, 0), [$0$]),
  node((0, 1), [$R$]),
  node((0, 2), [$R^2$]),
  node((0, 3), [$R$]),
  node((0, 4), [$0$]),
  node((1, 0), [$"basis:"$]),
  node((1, 1), [${e_(x_1) and e_(x_2) }$]),
  node((1, 2), [${e_(x_1), e_(x_2)}$]),
  node((1, 3), [${1}$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), [$(x_1, -x_2)$]),
  arr((0, 2), (0, 3), [$vec(x_1, x_2)$]),
  arr((0, 3), (0, 4), []),
))

Note that in this special case, we can obtain the same formula for the differentials using @total-complex and @kpx. 
]

== Koszul (Co)homology 
#definition[
For a left $R$-module $A$, we define the *Koszul homology* and *Koszul
cohomology* to be
$ H_q lr((bd(x) comma A)) & eq H_q lr((K lr((bd(x))) times.circle_R A)) comma\
H^q lr((bd(x) comma A)) & eq H^q lr(("Hom"_R lr((K lr((bd(x))) comma A)))) dot.basic $
]



// #TODO what is exterior product


// (There are in total $n$ terms of the tensor product and in the degree $p$ part of $K(bd(x))$ there should be $p$ terms that come from the degree $1$ part of $K(x_j)$ and thus are $e_x_(j)$, and the remaining ($n-p$) terms should come from the degree $0$ part and are $1$.) 



#proposition[
$lr({H_q lr((bd(x) comma minus))})$ is a
homological $delta$-functor and 
$lr({H^q lr((bold(x) comma minus))})$ is a cohomological $delta$-functor
with
$ H_0 lr((bold(x) comma A)) eq A slash bd(x) A\
H^0 lr((bold(x) comma A)) eq homr lr((R slash bd(x) R comma A)) eq lr({a in A colon x_i a eq 0 upright(" for all ") i})  $
]
<koszul-zero>
#proof[
  Each $K_p (bd(x))$ is free and hence flat and projective, so $(K_p (bd(x)) tpr -)$ and $homr (K_p (bd(x)), -)$ are both exact functors. For any #sest $ses(A, B, C)$, we thus have a  #sest of chain complexes,
  $
    ses(K(bd(x)) tpr A, K(bd(x)) tpr B, K(bd(x)) tpr C) 
  $
  and a #sest of cochain complexes 
  $
    ses(homr (K_p (bd(x)), A), homr (K_p (bd(x)), B), homr (K_p (bd(x)), C))
  $
  By @connecting, applying homology and cohomology to them respectively induces two #less. 

  Notice $K_1 (bd(x)) iso R^n$ with generators ${e_(x_i)}_(1 <= i <= n)$ and $K_0 (bd(x)) = R dot 1$. The differential $K_1 (bd(x)) -> K_0 (bd(x))$ sends each $e_(x_i)$ to $x_i$. The rest should follow easily.
]

#proposition[
  There are isomorphisms
$H_p lr((bd(x) comma A)) tilde.equiv H^(n minus p) lr((bd(x) comma A))$ for all
$p$. 
]

#lemma("Künneth Formula for Koszul Complexes")[
If
$C_cx$ is a chain complex of $R$-modules and $x in R$, there
are exact sequences
$ 0 arrow.r H_0 lr((x comma H_q lr((C)))) arrow.r H_q lr((K lr((x)) times.circle_R C)) arrow.r H_1 lr((x comma H_(q minus 1) lr((C)))) arrow.r 0 $
]
<kunneth-koszul>

#proof[
  Again recall @homology-double, so the middle term means $H_q (Tot^ds (K(x) tpr C))$. By definition,
  $ [Tot^ds (K(x) tpr C)]_n = (K_0 (x) tpr C_n) ds (K_1 (x) tpr C_(n-1)) iso C_n ds C_(n-1) $
  where the differential is given by $(c_n, c_(n-1)) |-> (d(c_n) + x c_(n-1), -d(c_(n-1)))$.
  Thus we can write a #sest of chain complexes: 
  $
    ses(C, Tot^ds (K(x) tpr C), C [-1])
  $
  which is associated to the long exact sequence: 
  $
    H_(q plus 1) lr((C lr([minus 1]))) arrow.r^diff H_q lr((C)) arrow.r H_q lr((K lr((x)) times.circle C)) arrow.r H_q lr((C lr([minus 1]))) arrow.r^diff H_q lr((C)) 
  $
  where $H_(q+1) (C[-1]) = H_q (C)$ and $H_(q) (C[-1]) = H_(q-1) (C)$. By @connecting, we can find that the connecting homomorphism $diff$ is multiplication by $x$. Now we have 
  $
    H_q lr((C)) arrow.r^x H_q lr((C)) arrow.r H_q lr((K lr((x)) times.circle C)) arrow.r H_(q-1) lr((C))  arrow.r^x H_(q-1) lr((C)) 
  $
  which, by @five-to-ses, leads to the #sest 
  $
    ses(Coker(H_q (C) ->^x H_q (C)), H_q lr((K lr((x)) times.circle C)), Ker(H_(q-1) (C) ->^x H_(q-1) (C)))
  $
  

  Now since $ H_q (C) ->^x H_q (C) = (R ->^x R) tpr H_q (C) $

  We find 
  $
    Coker(H_q (C) ->^x H_q (C)) = H_0 (x, H_q (C))
  $ and 
  $
    Ker(H_q (C) ->^x H_q (C)) = H_1 (x, H_(q) (C))
  $
  and the result follows.
]

#definition[
  If $A$ is an $R$-module, a *regular sequence* on $A$ is a sequence of elements $(x_1, ..., x_n)$ where each $x_i in R$ such that $x_1$ is a non-zero-divisor on $A$ and each $x_i$ is a non-zero-divisor on $A over (x_1, ..., x_(i-1)) A$.
]

#lemma[
  Let $A$ be a left $R$-module. If $x$ is a non-zero-divisor on $A$, then  $H_1 (x, A) = 0$.
]
<non-zero-h1>
#proof[
  $K(x) tpr A$ is the chain complex:
  $
    0 -> A ->^x A -> 0
  $
  If $x$ is a non-zero-divisor on $A$, then $H_1 (x, A) = Ker x = 0$. 
]

#corollary[
  If $bd(x) = (x_1, ... , x_n)$ is a regular sequence on an $R$-module $A$, then $H_q (bd(x), A) = 0$ for $q > 0$. 
]

#proof[ By induction on $n$. The base case for $n = 1$ is given in @non-zero-h1.
  Let $x  = x_n$ and $bd(y) = (x_1, ..., x_(n-1))$, then $K(bd(x)) = Tot^xor (K(x) tpr K(bd(y)))$. By @kunneth-koszul (letting $C = K(bd(y)) tpr A$), we have a #sest 
  #math.equation(block: true, numbering: "(1)", supplement: "Short Exact Sequence",
  $
    ses(H_0(x, H_q (bd(y), A)), H_q (bd(x), A), H_1 (x, H_(q-1) (bd(y), A)))
    
  $) <h0xhq>
  
  For $q >= 2$, the flanking terms of @h0xhq are both $0$ by induction and hence $H_q (bd(x), A) = 0$. 
  
  For $q  = 1$, by induction the left term of  @h0xhq is $0$, so we get
  $
    H_1 (bd(x), A) iso H_1 (x, H_(0) (bd(y), A)) = H_1 (x, A over (x_1, ..., x_(n-1)) A) = 0
  $
  by @koszul-zero and @non-zero-h1, since $x$ is a non-zero-divisor on $A over (x_1, ..., x_(n-1)) A$.
]

#corollary[
  If $bd(x) = (x_1, ..., x_n)$ is a regular sequence on $R$, then $K(bd(x))$ is a free resolution of $R over I$, where $I  =(x_1, ..., x_n) R$, and 
  $
    H_p (bd(x), A) = Tor_p^R (R over I, A) \
    H^p (bd(x), A) = Ext_p^R (R over I, A) \
  $
]
// #remark[
//   #TODO Tower, Past paper, Serre...
// ]

// Suppose that $upright(x) eq lr((x_1 comma dots.h comma x_n))$ is a
// finite sequence of central elements in $R$. Then $K lr((upright(x)))$ is
// the chain complex
// $ K lr((x_1)) times.circle_R dots.h times.circle_R K lr((x_n)) dot.basic $



// Koszul resolution

// Let $x in R$ be a central element. Let $K(x)$ be the chain complex 
// $
//   0->R->^x R ->0
// $ 
// in degrees $0,1$. We call the generator in degree $1$ $e_x$ so $d(e_x) = x$. 


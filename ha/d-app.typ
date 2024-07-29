#import "../libs/template.typ": *

= Example: $R = ZZ$

// == $R = ZZ$

Let $A in Ab$.  Recall that we have the following:
- $A$ is projective #iff $A$ is free; 
- $A$ is injective #iff $A$ is divisible, #iff $A$ is a direct sum of copies of $QQ$ and $ZZ[1/p] over ZZ$, where each $p$ is prime;
- $A$ is flat #iff $A$ is torsionfree. 

We now demonstrate some calculations in the category $Ab$ using tools developed throughout the course. These may serve as exercises or reference materials.

== Resolutions 

#align(center, table(columns: (auto, auto, auto), inset: 7pt, stroke: none, 
[Type], [Object], [Resolution],
table.hline(),
[projective], $ZZ over m$, $0->ZZ->^m ZZ -> ZZ over m -> 0$,
[injective], $ZZ over m$, $0-> ZZ over m -> QQ over ZZ ->^m QQ over ZZ -> 0$,
[injective], $ZZ$, $0 -> ZZ -> QQ -> QQ over ZZ -> 0$, 
))

== Tensor products
#align(center, table(columns: (auto, auto, auto, auto, auto), inset: 7pt, stroke: none,
[$tp_ZZ$], table.vline(), $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
table.hline(),
$ZZ$, $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
$QQ$, $QQ$, $QQ$, $0$, $0$,
$ZZ over n$, $ZZ over n$, $0$, $ZZ over"gcd"(m, n)$, $0$,
$QQ over ZZ$, $QQ over ZZ$, $0$, $0$, $0$
))

- $A tp_ZZ B iso B tp_ZZ A$;
- $ZZ tp_ZZ A iso A$; 
- $QQ tp_ZZ T iso 0$ if $T$ is torsion; 
- $QQ over ZZ tp_ZZ T iso 0$ if $T$ is torsion; 
- $ZZ over m tp_ZZ A iso A over m A$ (recall that $R over I tp_R M iso M over I M$);
- $QQ tp_ZZ QQ iso QQ$. 

== $Tor$ groups
#let tor1z = [$Tor_1^ZZ$]

#align(center, table(columns: (auto, auto, auto, auto, auto), inset: 7pt, stroke: none,
[$Tor_1^ZZ$], table.vline(), $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
table.hline(),
$ZZ$, $0$, $0$, $0$, $0$,
$QQ$, $0$, $0$, $0$, $0$,
$ZZ over n$, $0$, $0$, $ZZ over"gcd"(m, n)$, $ZZ over n$,
$QQ over ZZ$, $0$, $0$, $ZZ over m$, $QQ over ZZ$
))

- $Tor_n^ZZ (A, B) iso Tor_n ^ZZ (B, A)$;
- $ZZ$ is free and thus flat, so $Tor_1^ZZ (ZZ , -) = 0$;
- $QQ$ is torsionfree and thus flat, so $Tor_1^ZZ (QQ , -) = 0$;
- $tor1z (ZZ over m, A) iso  {a in A | m  a = 0}$;
- $tor1z (QQ over ZZ, QQ over ZZ)$ is obtained from the #lest induced by applying $(- tpz QQ over ZZ)$ to  $0 -> ZZ -> QQ -> QQ over ZZ -> 0$.

== Hom-sets


#align(center, table(columns: (auto, auto, auto, auto, auto), inset: 7pt, stroke: none,
[$hom_ZZ$], table.vline(), $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
table.hline(),
$ZZ$, $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
$QQ$, $0$, $QQ$, $0$, [$?$],
$ZZ over n$, $0$, $0$, $ZZ over"gcd"(m, n)$, $ZZ over n$,
$QQ over ZZ$, $0$, $0$, $0$, $hat(ZZ)$
))

Each row represents the first argument in $hom$ and each column the second. A question mark indicates that the result is beyond the scope of the course.

- $hom_ZZ (ZZ, A) iso A$ (in general, $hom_R (R, M) iso M$); 
- $hom_ZZ (QQ, QQ) iso QQ$ by establishing a (fairly easy) bijection; 
- $hom_ZZ (QQ, ZZ) iso 0$ because no integer is arbitrarily divisible, e.g. $f(1) = n f (1/n)$ where $f(1), f(1/n) in ZZ$, so $f(1)$ is divisible by any $n$ which is impossible unless $f(1) = 0$.  Similarly $hom_ZZ (QQ, ZZ over m) iso 0$;
- $hom_ZZ (ZZ over n, A) iso {a in A | n a = 0}$ (incidentally, this is isomorphic to $tor1z (ZZ over n, A)$); 
- $hom_ZZ (A, QQ over ZZ)$ is the *Pontryagin duality* of $A$.

== $Ext$ groups
#align(center, table(columns: (auto, auto, auto, auto, auto), inset: 7pt, stroke: none,
[$Ext_1^ZZ$], table.vline(), $ZZ$, $QQ$, $ZZ over m$, $QQ over ZZ$,
table.hline(),
$ZZ$, $0$, $0$, $0$, $0$,
$QQ$, $?$, $0$, $?$, [$0$],
$ZZ over n$, $ZZ over n$, $0$, $ZZ over"gcd"(m, n)$, $0$,
$QQ over ZZ$, $?$, $0$, $?$, $0$
))

Each row represents the first argument in $Ext$ and each column the second. 

- $Ext_1^ZZ (ZZ, -) = 0$ as $ZZ$ is projective; 
- $Ext_1^ZZ (-, QQ) = 0$ as $QQ$ is injective; 
- $Ext_1^ZZ (-, QQ over ZZ) = 0$ as $QQ over ZZ$ is injective; 
- $Ext_1^ZZ (ZZ over n, A) iso A over n A$ using the projective resolution of $ZZ over n$.

// == $R = k[x]$

// We consider when $R$ is the polynomial ring $k[x]$ for a field $k$. Note that $k[x]$ is a PID. 

// === Projective, injective, and flat modules 

// - $k(x)$, the field of fractions, is an injective $k[x]$-module;
// - Any quotient of an injective $k[x]$-module is injective; 
// - $k[x, x^(-1)]$ is a flat $k[x]$-module since it is the localisation of $x$ in $k[x]$; alternatively, it can be constructed as a filtered colimit of flat modules $k[x] ->^(x^(-1)) x^(-1) k[x] -> ^(x^(-2))  x^(-2) k[x] ->...$.

// === Resolutions 

// #align(center, table(columns: (auto, auto, auto), inset: 7pt, stroke: none, 
// [Type], [Object], [Resolution],
// table.hline(),
// [projective], $k[x] over (x^m)$, $0->k[x]->^(x^m) k[x] -> k[x] over (x^m) -> 0$,
// [injective], $k[x]$, $0-> k[x] -> k(x) -> k(x) over k[x] -> 0$,
// [flat], $k[x, x^(-1)] over k[x]$, $0 -> k[x]  -> k[x, x^(-1)]  -> k[x, x^(-1)] over k[x] -> 0$, 
// ))
#import "libs/template.typ": *
#import "libs/var.typ": *
#import "libs/commute.typ": node, arr, commutative-diagram

#set heading(numbering: "1.a.")

#show: project.with(
  title: "Algebraic Topology",
  authors: (
    "Yuhang Wei",
  ),
  date: "October 24, 2023",
)

= Lecture 6

The data for a delta-complex contains ${I_n}_(n >= 0)$ and $ d^0, ..., d^n : I_n -> I_(n-1) $ for each $n$, where 

$ d^j oo d^i = d^(i-1) oo d^j (*) $ if $j < i$.

$ C^"simlicial"_n (X; R) = plus.circle.big _(alpha in I_n) R $

$ diff alpha = sum_(i=0)^n (-1)^n d^i alpha $

(\*) indicates
$ diff oo diff = 0 $

The cohomology is 

$ C_"simplicial"^n ( X; R) = product_(alpha in I_n) R $
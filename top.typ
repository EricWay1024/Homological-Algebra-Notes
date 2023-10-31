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

= Lecture 1

Fundamental group $pi_1 (X)$, or the first homotopy group.

We have the $n$-th homotopy group, $pi_n (X)$. 

We need a base point $x in X$ and $pi_n (X)$ depends on $x$. 
But it's "weak dependence", because if the space is path-connected then choosing any $x in X$ we get the same $pi_n (X)$. 

Recall we could define $pi_1 (X)$ as the set of maps from a circle into $X$, with a distinguished point on the circle mapping to the base point, up to homotopy; alternatively, it is also the set of maps from $[0, 1]$ into $X$ with $0$ and $1$ both mapping to the base point. 

$ pi_n(X) = {f: [0, 1]^n -> X | f |_(diff [0, 1]^n) equiv x } over tilde $

where we define the equivalence relation $tilde$ as follows:
$f tilde g$ if $ exists h : [0 , 1] times [0, 1]^n -> X $ such that $ h |_([0, 1] times diff [0, 1]^n) equiv x \ h|_({0} times [0, 1]^n) = f \ h|_({1} times [0, 1]^n) = g $

Recall that $A -> "Map"(B, C)$ continuous is typically better expressed as $A times B -> C$ continuous. 

Group operation on $pi_n (X)$:

$ f ast g (t_1, t_2, ..., t_n) = cases(
  f(2 t_1, t_2,..., t_n ) quad &t_1 <= 1/2,
  g(2 t_1 -1, t_2, ..., t_n) quad &t_1 >= 1/2
) $

Notice we are doing operations on the equivalent classes, so it is really 
$ [f] + [g] = [f+ g] $

#align(center,image("imgs/2023-10-31-21-53-40.png",width:30%))
#proposition[
  $pi_n (X)$ is an abelian group for $n >=2 $.  
]

#proof[
  We need to show that $f * g tilde g * f$. 
  #align(center,image("imgs/2023-10-31-22-01-20.png",width:100%))
  Notice that we send points in the blank regions to the base point $x$. Since we send $ diff f$ and $ diff g$ also to $x$, there is no contradiction and the map is continuous.  

  This is the case for $n = 2$, but for $n >= 3$, you just don't move the rest of the coordinates. Also notice in $n = 1$ you don't have the room for such manoeuvre. 
]

#example[
  $ pi_1(S^1) = ZZ $
  $ pi_1(T^2) = ZZ times ZZ $

  In general, we have 
  $ pi_n (A times B) = pi_n (A) times pi_n (B) $

  $ pi_1 (RR ^2 without {ast, ast }) = F_2 $
  which is a free group.
  #align(center,image("imgs/2023-10-31-22-17-52.png",width:20%))
  $ pi_1 ("two holed torus") = angle.l a, b, c, d | [a, b][c, d] angle.r $
  where $[a, b] = a b a^(-1) b^(-1)$. This is an example of a CW complex.
  #align(center,image("imgs/2023-10-31-22-21-41.png",width:50%))

  $ pi_1 (S^1 or S^1) = F_2 $
]

#definition[
  Two maps $f, g : X -> Y$ are *homotopic* if there exists $h : [0, 1] times X -> Y$ such that 
  $ h|_({0} times X) = f \ h|_({1} times X) = g $
  We denote $f tilde g$. 
]

#definition[
  Two spaces $X, Y$ are called *homotopy equivalent* if there exists maps $f: X-> Y$ and $g : Y -> X$ such that $f oo g tilde id_Y$ and $g oo f tilde id_X$. 
]

Notice if two spaces are homeomorphic, we can find maps $f: X-> Y$ and $g : Y -> X$ such that $f oo g = id_Y$ and $g oo f = id_X$.

$ pi_1 (S^1 or S^1) = F_2 $
$ pi_1 (RR ^2 without {ast, ast }) = F_2 $

#align(center,image("imgs/2023-10-31-22-28-08.png",width:50%))

= Lecture 2


= Lecture 6

The data for a delta-complex contains ${I_n}_(n >= 0)$ and $ d^0, ..., d^n : I_n -> I_(n-1) $ for each $n$, where 

$ d^j oo d^i = d^(i-1) oo d^j (*) $ if $j < i$.

$ C^"simlicial"_n (X; R) = plus.circle.big _(alpha in I_n) R $

$ diff alpha = sum_(i=0)^n (-1)^n d^i alpha $

(\*) indicates
$ diff oo diff = 0 $

The cohomology is 

$ C_"simplicial"^n ( X; R) = product_(alpha in I_n) R $
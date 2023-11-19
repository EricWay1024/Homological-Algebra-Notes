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

Notice we are doing operations on the equivalence classes, so it is really 
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
$ pi_1 : Top_ast over tilde -> Grp $
$ pi_n : Top_ast over tilde -> Ab $

Let $f, g :X-> Y$, then $f tilde g$ if they are homotopic (pointed) maps. Then $f_ast, g_ast : pi_1 (X) -> pi_1 (Y)$ are equal. This also holds for $pi_n$.

$Top over tilde$ is the category of topological spaces and homotopy classes of continuous maps. $Top_ast over tilde$ is the category of pointed topological spaces and homotopy classes of base-point-preserving continuous maps. 

This class is mainly concerned about homology:
$ H_n : Top over tilde -> Ab $
for $n >= 0$ and cohomology: 
$ H^n : Top over tilde -> Ab $
for $n >= 0$. 

The cohomology is a contravariant functor. If we have $f : X-> Y$, then it will induce $f_ast : H_n (X) -> H_n (Y)$ and $f^ast: H^n (Y) -> H^n (X)$. 

== Homology

One definition $H_1\(X) := pi_1 (X)_"ab"$ (abelianised). This only applies to path-connected spaces. 

First idea: Take $pi_1$ and drop base-point condition. We hence look at the set 
$ {S^1 -> X} over tilde $

#lemma[
  If $X$ is path-connected (we might just say connected), ${S^1 -> X} over tilde$ is equal to the conjugacy classes in $pi_1 (X)$. 
]

#proof[
  Any map $S^1 -> X$ can be deformed to a base-point-preserving map since $X$ is connected.
    #align(center,image("imgs/2023-11-01-09-39-44.png",width:50%))
  We can start from the base point, follow the green path, go around the loop, and return along the green path. This defines a map ${S^1 -> X} -> pi_1 (X)$, but this is a map that depends on the choice of the green path.

  If we choose another green path, 
  #align(center,image("imgs/2023-11-01-09-42-51.png",width:50%))
  the result gets modified by a conjugation. 
  [TODO] But this is off topic.
]

In homology, we can separate loops like this:
#align(center,image("imgs/2023-11-01-09-48-08.png",width:50%))

Roughly speaking, $ H_n\(X) = {"closed" n"-dimensional stuff mapping to " X} over tilde $

Simplices are the stuff we are going to use.

== Simplex 
#align(center,image("imgs/2023-11-01-09-52-02.png",width:50%))

$ Delta^n = {(t_0, ... t_n) in RR^(n+1)_(>=0) | sum t_i = 1} $

Notice for $Delta^n$ we need one more dimension, in $RR^(n+1)$, to make things easier.

Now we have $"Map"(Delta^n, X)$; and we take the free abelian group on it. 

#definition[
  The $n$-chains on $X$ is defined as the free abelian group (informally, linear combination) of $ { sigma: Delta^n -> X } $ denoted as $C_n\(X)$.
]

This is our "$n$-dimensional stuff mapping to $X$".

What do we mean by closed? 
#align(center,image("imgs/2023-11-01-10-01-29.png",width:50%))
We have to make sure at each point the number of "flow-in" is equal to "flow-out". This is an example of a closed $1$-chain.

#align(center,image("imgs/2023-11-01-10-06-44.png",width:50%))
Now it's the edges must satisfy some conditions. 

We define the boundary of an $n$-chain.

#definition[
  The boundary of an $n$-chain $c in C_n (X)$ is an $(n-1)$-chain $diff c in C_(n-1) (X)$.
]

#definition[
  $c in C_n (X; R)$ is closed if and only if $diff c = 0$. 
]

#align(center,image("imgs/2023-11-01-10-10-10.png",width:50%))
#align(center,image("imgs/2023-11-01-10-12-03.png",width:50%))

= Lecture 3
#definition[
  A map $sigma: Delta^n -> X$ is called a *singualr simplex*. 
]

A typical $n$-chain is written $ sum r_sigma sigma $ (finite sum). By default $r_sigma in ZZ$. More generally, $r_sigma in R$ for any abelian group $R$, which leads to $H_n\(X; R)$, the $n$-th homology of $X$ with coefficients in $R$. (Free $R$-module on the set!) But $R$ is an abelian group not a ring, so $ C_n (X; R) = plus.circle.big_(sigma: Delta ^n -> X) R $

Notice: not all $n$-chains represent a class in $H_n (X)$. Only the closed ones; we have to make sure the boundary is zero.
#align(center,image("imgs/2023-11-01-10-22-32.png",width:50%))

#definition[The boundary map
$diff : C_n (X; R) -> C_(n-1) (X; R)$ 
$ sigma mapsto sum _(i=0) ^n (-1)^i sigma |_[0, ..., hat(i), ..., n] $
This can be linearly extended for any $sum r sigma $.
]

#align(center,image("imgs/2023-11-01-10-37-37.png",width:50%))
#align(center,image("imgs/2023-11-01-10-38-07.png",width:30%))

$sigma|_[0 , 2, 3]$ is a map $Delta^2 -> X$. 

#definition[
Formally, the $i$-th face of a singular simplex is defined as 
$ sigma|_[0, ..., hat(i), ..., n] (x_0, ..., x_(n-1)) := sigma(x_0, ..., x_(i-1), 0, x_i, ..., x_(n-1)) $
]

Now we look at the equivalence relation. 

#align(center,image("imgs/2023-11-01-10-47-42.png",width:50%))

$ diff a = c_2 - c_1 $
#definition[
  Two closed $n$-chains $c_1, c_2$ are *homologous* if there exists an $(n+1)$-chain $a$ such that $diff a = c_2 - c_1$. 
]
It is easily seen that this is an equivalence relation. 

#definition[
$ H_n\(X; R) := {"closed " n"-chains"} over "homologous" $
]

#definition[
  A chain complex is a sequence of abelian groups ${C_n}_(n in ZZ)$ and linear maps $diff_n: C_n -> C_(n-1)$ such that $diff oo diff = 0$. 
  This whole package is called $Ccx$. 
]

#definition[The $n$-th homology group
  $ H_n (Ccx) = {c in C_n | diff c = 0} over {c in C_n | exists a in C_(n+1) diff a = c}  = ker(diff_n) over im (diff_(n+1)) $
]
We need $diff (diff sigma ) = 0$ so that $ im (diff_(n+1)) subset.eq ker(diff_n) $.

#lemma[
  $ diff (diff sigma ) = 0 $
]
#proof[
  TODO
]

= Lecture 4

$ d_i : Delta^(n-1) -> Delta^n $ that $ d_i(x_0, ..., x_(n-1)) = (x_0, ..., x_(i-1), 0, x_i, ..., x_(n-1)) $
Then $ diff sigma = sum_(i=0)^n (-1)^i (sigma oo d_i) $
We know that $ d_i oo d_j = d_j oo d_(i+1) $ if $i > j$ and thus $diff oo diff = 0$.
#align(center,image("imgs/2023-11-01-17-45-19.png",width:90%))

$Z_n (Ccx) = ker (diff : C_n -> C_(n-1))$ is the $n$-cycles.

$B_n (Ccx) = im (diff : C_(n+1) -> C_n)$ is the $n$-boundaries.

$H_n (Ccx) = Z_n (Ccx) over B_n (Ccx)$

A morphism of chain complex $Ccx -> Dcx$ consists of morphisms of abelian groups $f_n : C_n -> D_n$ for each $n in ZZ$ satisfying
#align(center,image("imgs/2023-11-01-17-50-13.png",width:30%)) 
We thus have the category of chain complexes.

If we have $f: X-> Y$ a continous map between topological spaces, then it induces $f_ast: Ccx (X) -> Ccx(Y)$, defined by the linear expansion of $ sigma |-> f oo sigma $

Quick check: 
#align(center,image("imgs/2023-11-01-17-55-10.png",width:50%))

Note: $f_* : Ccx -> Dcx$ induces $Z_n (Ccx) -> Z_n (Dcx)$, $B_n (Ccx) -> B_n (Dcx)$, and therefore also $H_n (Ccx) -> H_n (Dcx)$.

What if we have coefficients in $R$ instead of $ZZ$? Apply $- tp_ZZ R$. (Still, $R$ is an abelian group, not a ring.)
#align(center,image("imgs/2023-11-01-18-37-28.png",width:100%))

Cohomology.
#align(center,image("imgs/2023-11-01-18-45-15.png",width:100%))
#align(center,image("imgs/2023-11-01-18-51-18.png",width:100%))


$ C_n (X; R) = plus.circle.big_(sigma : Delta^n -> X) R $
$ C^n (X; R) = product_(sigma : Delta^n -> X) R $
$ diff sigma = sum_(i=0)^n (-1)^i (sigma|_[0 ... hat(i) ... n]) $
$ delta phi.alt (sigma) = sum_(i=0)^n (-1)^i phi.alt (sigma|_[0 ... hat(i) ... n]) $

It is better to view the product as a function $phi.alt$ that takes a $sigma$ and returns an element in $R$.

We have now defined homology and cohomology with coefficients in $R$.

#proposition[
  When the space is connected, $H_0 = ZZ$.
]

#example[
  The 2-dimensional sphere $S^2$ has $H_0(S^2) = ZZ$, $H_2(S^2) = ZZ$.
]
#example[
  The mobius band is homotopy equivalent to a circle. $H_0 = ZZ$, $H_1 = ZZ$.
]
#example[
  The torus. $H_0 = ZZ$, $H_1 = ZZ^2$, $H_2 = ZZ$.
]

#example[
  $RR PP^2$. $H_0 = ZZ$, $H_1= ZZ over 2$, $H_2 = 0$ but $H_2(RR PP^2, ZZ over 2) = ZZ over 2$.
  TODO
]
= Lecture 5
#align(center,image("imgs/2023-11-09-11-09-12.png",width:90%))
#align(center,image("imgs/2023-11-09-11-14-21.png",width:50%))

$ diff sigma = sigma|_[1 2] - sigma|_[0 2] + sigma |_[0 1] $

#align(center,image("imgs/2023-11-09-11-16-07.png",width:50%))
The idea is you have to have the minus sign for things to work.


#pagebreak()




= Lecture 6

The data for a delta-complex contains ${I_n}_(n >= 0)$ and $ d^0, ..., d^n : I_n -> I_(n-1) $ for each $n$, where 

$ d^j oo d^i = d^(i-1) oo d^j (*) $ if $j < i$.

$ C^"simlicial"_n (X; R) = plus.circle.big _(alpha in I_n) R $

$ diff alpha = sum_(i=0)^n (-1)^n d^i alpha $

(\*) indicates
$ diff oo diff = 0 $

The cohomology is 

$ C_"simplicial"^n ( X; R) = product_(alpha in I_n) R $

(TODO some examples Klein bottles, etc)

= Homotopy invariance 
The next is the main theorem in this section.
#theorem[
If $f, g: X -> Y$ are homotopic, they induce the same map in homology and cohomology.
]
Once the main theorem is proven we can have the following corollary:
#corollary[
  If $X iso Y$, then $H_n (X) iso H_n (Y)$ and $H^n (X) iso H^n (Y)$.
]
#proof[
  We have $ f: X -> Y\ g: Y -> X \ f oo g tilde id \ g oo f tilde id $
  Apply $H_n$ to all of them and get 
  $ f_ast : H_n (X) -> H_n (Y) \ g_ast : H_n (Y) -> H_n (X) \ f_ast oo g_ast = id \ g_ast oo f_ast = id $
  It is the same for cohomolgy.
]

Now to prove the main theorem we need some reductions. 
#proposition[
  It is enough to prove the special case where $Y = X times I$, where $I = [0, 1]$, and $f : x mapsto (x, 0)$ and $g : x mapsto (x, 1)$.
]
#proof[
  Let $i(x) = (x, 0)$ and $j(x) = (x, 1)$.
  Let $f, g : X -> Y$ be homotopic maps, i.e. there exists $h : X times I -> Y$ such that $f = h oo i$ and $ g = h oo j$. Apply $H_n$, we get $f_ast = h_ast oo i_ast$ and $g_ast = h_ast oo j_ast$. But by assumption, $i_ast = j_ast$ and thus $f_ast = g_ast$. The same proof works for cohomology.
]

Our goal now is to show that chain maps $i_ast, j_ast : Ccx (X) -> Ccx (X times I)$ induce the same map in homology. It turns out we need them to have the following property:

#definition[
  Two chain maps $f_cx, g_cx: C_cx -> D_cx$ are called *chain homotopic* if there exists $ {h_n : C_n -> D_(n+1)}_(n in ZZ) $ such that $diff^D oo h + h oo diff^C = g - f$.
]

#proposition[
  Suppose that chain maps
$f_cx comma g_cx colon C_cx arrow.r D_cx$ are chain homotopic.
Then the induced maps
$f_* comma g_* colon H_n lr((C)) arrow.r H_n lr((D))$
are equal.
]
#proof[
  See homological algebra.
]

Now our goal is to prove the chain maps $i_ast, j_ast$ are chain homotopic, from which it easily follows that $i^ast, j^ast: C^cx (X times I) -> C^cx (X)$ are also chain homotopic by applying $hom_ZZ (-, R)$.

#endlec(6)

#align(center,image("imgs/2023-11-18-22-08-32.png",width:90%))

We want to construct $h$, which sends $n$-chains on $X$ to $(n+1)$-chains on $X times I$, subject to the equation $diff h = g_ast - f_ast - h diff$. The easist idea is to multiply any $n$-chain on $X$ with $I$, but it might not be a $(n+1)$-chain on $X times I$ readily, and we need to triangulate it and give each triangle an orientation.

#align(center,image("imgs/2023-11-18-22-19-23.png",width:90%))

$ h(sigma)= sum_(i=0)^n (-1)^i (sigma times I)|_(mat(, , i, ..., n; 0, ..., i, , )) $

where $mat(, , i, ..., n; 0, ..., i, , )$ means using vertices $0, ..., i$ at the bottom, i.e. $X times {0}$, and $i, ..., n$ at the top, i.e. $X times {1}$. Formally,
$ (sigma times I)|_(mat(, , i, ..., n; 0, ..., i, , )) : Delta^(n+1) &-> X times I \ 
(x_0, ..., x_(n+1)) &mapsto (sigma (x_0, ... , x_(i-1), underbrace(x_i + x_(i_1), i"-th" ), x_(i+1), ..., x_(n+1)), x_(i+1) + ... + x_(n+1))
$

#proposition[
  $h$ defined above gives the chain homotopy we desire.
]
#proof[
Now recall the formula for the boundary: 
$
  diff (sigma) = sum_(j=0)^n (-1)^j sigma | _[0, ..., j-1, j+1, ..., n]
$
where 
$
  sigma | _[0, ..., j-1, j+1, ..., n] : Delta^(n-1) &-> X \

  (x_0, ..., x_(n-1)) &|-> sigma (x_0, ..., x_(j-1), underbrace(0, j"-th"), x_j, ..., x_(n-1))
$

So we have 

$
  diff h(sigma) = sum_(j < i) (-1)^(i+j) (sigma times I) | _mat(, , , , i, ..., n; 0, ..., hat(j), ..., i, , ) + sum_(j > i) (-1)^(i+j +1) (sigma times I) | _mat(
    zws, zws, i, ..., hat(j), ..., n; 
    0, ..., i, zws, zws, zws, zws) \
    + (sigma times I) |_mat(0, 1, ..., n; zws, , , ,) - (sigma times I) |_mat( zws, , , ; 0, 1, ..., n)
$

where 
$
(sigma times I) | _mat(, , , , i, ..., n; 0, ..., hat(j), ..., i, , ) : Delta^n &-> X times I \

(x_0, ..., x_n) &mapsto (sigma(x_0, ..., x_(j-1), underbrace(0, j), x_j, ..., underbrace(x_(i-1) + x_i, i), ..., x_n), x_i + ... + x_n)
$

$
(sigma times I) | _mat(
    zws, zws, i, ..., hat(j), ..., n; 
    0, ..., i, zws, zws, zws, zws) : Delta^n &-> X times I \
    
    (x_0, ..., x_n) &mapsto (sigma(x_0, ..., underbrace(x_i + x_(i+1), i), ..., x_j, underbrace(0, j), x_(j+1), ..., x_n), x_(i+1), ..., x_n)

$

Also

$
(sigma times I) |_mat(0, 1, ..., n; zws, , , ,) = g_ast (sigma)
$

$
(sigma times I) |_mat( zws, , , ; 0, 1, ..., n) = f_ast (sigma)
$

Notice the terms with $i=j$ come in cancelling pairs and thus can be removed, except the beginning and the end. These correspond to the hyperplanes we use to slice this simplex.

Now we compute 

$
  h diff (sigma) = sum_(i < j) (-1)^(i+j) (sigma times I) |_mat(zws, zws, i, ..., j-1, j+1, n; 0, ..., i) + sum_(i > j) (-1)^(i+j+1) (sigma times I)_mat(zws, zws, zws, zws, zws, i, ..., n; 0, ..., j-1, j+1, ..., i)
$

From which we finally conclude
$ diff h (sigma) = g_ast (sigma) - f_ast (sigma) - h diff (sigma) $
which makes us very happy.]
#endlec(7)

= Exact sequences


#example[
  For ${"pt"}$, we have $H_0 = ZZ$ and $H_n = 0$ for $n > 0$. It is the same for any contractible space because of the homotopy invariance.
]

#proposition[
  $ H_n (product.co_(i in I) X_i) = plus.circle.big_(i in I) H_n (X_i) $
  $ H^n (product.co_(i in I) X_i) = product_(i in I) H^n (X_i) $
]
#proof[
  #TODO
]

#definition[
  A *short exact sequence* $ ses(A, B, C, f: f, g: g) $ means $f$ is injective, $g$ is surjective and $im(f) = ker(f)$.
]
#definition[
  A *long exact sequence* is a chain complex whose homology is trivial. Namely, one where $im diff = ker diff$ at every position.
]

#definition[
  Let $A subset X$, then it induces $C_cx (A) arrow.hook Ccx (X)$. We define $
    C_cx (X, A) := C_cx (X)  over C_cx (A) 
  $
  Note that the differential on $C_cx (X)$ descends to a differential on $Ccx (X, A)$.
   We also define $
    C^cx (X, A) := hom (C_cx (X, A), ZZ)
  $ The *relative homology* is 
  $
    H_ast (X, A) := H_ast (C_cx (X, A))
  $
]
#remark[
  It is also true that $ C_ast (X, A) = plus.circle.big _(sigma: Delta^n -> X, im(sigma) subset.not A) ZZ  $ but it is better to think of it as a quotient group rather than a subgroup.
]

Let $A arrow.hook X$ be a subspace. Then $H_n (A) -> H_n (X)$ can be fit in a long exact sequence
$ ... -> H_n (A) -> H_n (X) -> H_n (X, A) -> H_(n-1) (A) -> ... $
where $H_n (X, A)$ is the *relative homology*. We also have for the cohomology:

$ ... <- H^n (A) <- H^n (X) <- H^n (X, A) <- H^(n-1) (A) <- ... $

The maps $ H_n (A) -> H_n (X) -> H_n (X, A) $ are clear because they are induced by the inclusion and quotient maps, i.e. the short exact sequence of chain complexes:
$
  0-> Ccx(A) arrow.hook Ccx(X) arrow Ccx(X) over Ccx(A) -> 0
$

We work on a general theorem about short exact sequence of chain complexes, the Snake Lemma.
#proposition[
  Every #sest of chain complexes has an associated #lest of homology groups.
]
Here all the rows are exact and each column is a chain complex:
#align(center,image("imgs/2023-11-19-11-03-03.png",width:50%))
We claim that we can always get the following:
#align(center,image("imgs/2023-11-19-11-05-03.png",width:50%))
where the zigzagging arrow is the *boundary homomorphism*.
#proof[
  For $[c] in H_(n+1) (Ccx)$, define $diff [c]$ to be $[a]$ for $a in A_n$... #TODO Digram Chasing

  We need to check the following:
  - $diff a = 0$;
  - replacing $b$ by $b'$ doesn't affect $[a]$;
  - depends on $c$ within $[c]$?
]

To dualise the argument, we can get the short exact sequence 
$ 0<- C^cx (A) <- C^cx (X) <- C^cx (X, A) <- 0 $
This is still a short exact sequence becasue the original short exact sequence is split and applying $hom(-, ZZ)$ preserves split short exact sequence.

#theorem(name: "Excision")[
  Let $A subset X$ and $macron(E) subset circle(A)$, then 
  $ H_ast (X, A) iso H_ast (X \\ E, A \\ E) $
]

#definition[
  The *reduced homology* of a space $X$ is $ tilde(H)_ast (X) := H_ast (X, ast) $
  where $ast$ is the space of a single point.
]
#proposition[
  $tilde(H)_n (X) = H_n (X)$ for $n >=1 $ and $H_0 (X) = tilde(H)_0 (X) xor ZZ$.
]
#proof[ Drawing the long exact sequence associated to the relative homolgy easily gives the result:
  #align(center,image("imgs/2023-11-19-12-01-32.png",width:50%))
]

#remark[
  Everything here also holds for coefficient ring $H_ast (X, R)$ and $H_ast (X, A, R)$.
]
#example[
  #align(center,image("imgs/2023-11-19-11-55-05.png",width:80%))
  $
     tilde(H)_ast (S^1) = H_ast (S^1, ast) = H_ast (S^1, A) = H_ast ( [0, 1], {0, 1})
  $
  #align(center,image("imgs/2023-11-19-12-05-26.png",width:80%))
]

#endlec(8)

= Computing homology groups

#theorem(name: "Small Simplices Theorem")[
  Let $X = union.big_alpha U_alpha $ be an open cover, denoted as $cal(U)$. Set 
  $ C_n^cal(U) (X) = plus.circle.big_(sigma: Delta^n -> X \ sigma(Delta^n) subset.eq U_alpha "for some" alpha )  ZZ subset.eq C_n (X) $
  which is a subchain complex. Then $C_n^cal(U) (X) -> C_n (X)$ induces an isomorphism in homology.
]
The proof is delayed later. We will first present some consequences of this theorem; but before doing that, we need the following lemma, a tool to prove isomorphisms using long exact sequences.
#lemma(name: "The Five Lemma")[
  Assume we are given a diagram of modules:
  #align(center,image("imgs/2023-11-19-12-18-27.png",width:50%))
  such that 
  - rows are exact;
  - $m, p$ are isomorphisms;
  - $l$ is surjective;
  - $q$ is injective.
  Then $n$ is an isomorphism. 
]
#remark[
We are usually only concerned with a weaker form, where we assume $m, p, l, n$ are all isomorphisms.
]
#proof[
  #TODO Diagram chasing
]

#theorem(name: "Excision Theorem")[
  Let $A subset X$ and $macron(E) subset circle(A)$, then 
  $ H_ast (X, A) iso H_ast (X \\ E, A \\ E) $
]
#remark[
  $macron(E)$ is the closure of $E$ and $circle(A)$, also denoted as $A^circle.small$, is the interior of $A$. 
]
#proof[
  Consider the open cover $X = circle(A) union (X \\ macron(E))$. We observe that given a simplex $sigma: Delta^n -> X$ landing in $circle(A)$ or $X \\ macron(E)$, $sigma$ is either disjoint from $E$ or $sigma$ is contained in $circle(A)$.
  This implies that $ C_cx^cal(U) (X \\ E, A \\ E) = C^cal(U)_cx (X, A) $
  Hence $
    H_ast^cal(U) (X \\ E, A \\ E) = H_ast^cal(U) (X, A)
  $
  Consider map of #sess
  // $ ses(C_cx^cal(U) (A), C_cx^cal(U) (X), C_cx^cal(U) (X, A)) $
  #align(center,image("imgs/2023-11-19-12-39-30.png",width:50%))
  Passing to homology, we get a map of long exact sequences:
  #align(center,image("imgs/2023-11-19-12-41-03.png",width:80%))
  By small simplices theorem, maps 1, 2, 4, 5 are isomorphisms.
  By the five lemma, map 3 is an isomorphism. Thus $ H_ast (X\\E, A \\E) iso H_ast (X, A) $
  #TODO (why we can remove the $cal(U)$?)
]

#definition[
  $A subset.eq X$ is a *good pair* if $A$ is a nonempty closed subspace and $A$ is a deformation retract of some open neighbourhood $V$ of $A$ in $X$.
]

#TODO what's deformation retract

#remark[
  If $(A subset.eq X), V$ are as above, then $H_ast (A) -> H_ast (V)$ is an isomorphism.
]

#example[
  In the topologist's sine curve, the segment on the $y$-axis does not make a good pair with the whole space.
]
#corollary[
  If $A subset.eq X$ is a good pair, then $H_ast (X, A) = tilde(H)_ast (X over A)$.
]
#remark[
  $X over A$ is such a space that $[x] = [y]$ if $x, y in A$ or $x = y$. 
]
#proof[
  Pick an open neighborhoold $V$ of $A$ as in the definition of good pair.
  Map of pair $(X, A) -> (X, V)$ gives a map of long exact sequences. 
  #align(center,image("imgs/2023-11-19-12-56-51.png",width:80%))
  By the Five Lemma, $H_ast (X, A) -> H_ast (X, V)$ is an isomorphism.
  By the Excision Lemma, for $A subset.eq V subset.eq X$, 
  $ H_ast (X, V) iso H_ast (X \\ A, V \\ A) $
  Apply the Excision Lemma again for $ A over A subset.eq V over A subset.eq X over A$,
  $ H_ast (X \\ A, V \\ A) iso H_ast (X over A, V over A) $
  Since $ast = A over A$ is a deformation retract of $V over A$, the long exact sequence associated with $(A over A arrow.hook X over A) -> (V over A arrow.hook X over A)$ shows that $ H_ast (X over A, V over A) = H_ast (X over A, ast) = tilde(H) (X over A) $
  Thus we have shown  $H_ast (X, A) = tilde(H)_ast (X over A)$.
]

#remark[
  Don't confuse $\\$ (set-theoretic without) with $over$ (quotient).
]
#example[
  When $A = S^1$ and $X = S^1 or S^1$, $A subset X$ is a good pair. Thus 
  $ H_ast (S^1 or S^1, S^1) = tilde(H)_ast (S^1) $
]
#theorem(name: "Mayer-Vietoris Theorem")[
  Let $X = A union B$ be an open cover by two sets. Then there is a #lest 
  $ ...-> H_n (A sect B) -> H_n (A) xor H_n (B) -> H_n (X) -> H_(n-1) (A sect B) -> ... $
#align(center,image("imgs/2023-11-19-13-11-54.png",width:80%))
]
#proof[
  Consider the open cover $cal(U) = {A, B}$. Then we get a #sest 
  $ ses(Ccx(A sect B), Ccx (A) xor Ccx (B), C_cx^cal(U) (X)) $
  We then obtain a #lest on homology groups. Apply small simplices theorem to replace $H_ast^cal(U) (X) $ by $H_ast (X)$. 
]
#endlec(9)
#definition[
  A space $X$ is a *well-pointed* one if $ ast in X$ is a good pair.
]

#example[
  Let $ast in X$, $ast in Y$ be two well-pointed spaces. Then 
  $ H_n (X or Y)  = H_n (X) xor H_n (Y) $
  for $n > 0$.
]
  #align(center,image("imgs/2023-11-19-13-23-03.png",width:30%))
#proof[
  Cover $X or Y$ by $A = X union U_y$, where $U_y $ is an open neighborhood of $ast in Y$ as in the definition of good pair, and $B = Y union U_x$, where $U_x$ is defined similarly.
  Apply MV Theorem to get a #lest
  $
    ...-> H_n (U_x union U_y) -> H_n (X union U_y) xor H_n (Y union U_x) -> H_n (X or Y) ->  H_(n-1) (U_x union U_y) ->...
  $
  But $U_x union U_y iso ast$, $X union U_y iso X$ and $Y union U_x iso Y$.
  For $n >= 2$, we easily see $  H_n (X ) xor H_n (Y ) = H_n (X or Y)  $
  For $n = 1$ we need some reasoning:
  #align(center,image("imgs/2023-11-19-13-31-12.png",width:60%))
]

#example[
  $X = S^2$. We define $A$ as "the northen hemisphere plus $epsilon$" (a narrow band across the equator) and $B$ as "the southern hemisphere plus $epsilon$". Note that $ A iso ast iso B$ and $A sect B = S^1$. #align(center,image("imgs/2023-11-19-13-36-38.png",width:15%))
  By the MV theorem,
  #align(center,image("imgs/2023-11-19-13-42-37.png",width:50%))
  We can compute that
  $H_n (S^2) = 0$ for $n >= 3$ and $n = 1$, and $H_n (S^2) = ZZ$ for $n = 0, 2$.
]

#example[
  #align(center,image("imgs/2023-11-19-14-04-39.png",width:50%))
  $ A sect B = S^1 $
  #TODO
]

Now we prove the Small Simplices Theorem. The strategy of the proof:
+ Define a "subdivision operator" $S : C_cx (X) -> C_cx (X)$. For example: #align(center,image("imgs/2023-11-19-14-20-27.png",width:50%))
+ Prove that $S$ is chian homotopic to $id : C_cx (X) -> Ccx (X)$;
+ Prove for all $c in Ccx(X)$, there exists $N$ such that $S^N (c) in C^cal(U) (X) $.

Assume we have shown the above, we could prove the theorm in the following way:
#proof[
  First, we show $H^cal(U) (X) -> H (X)$ is surjective. Pick $[c] in H_n (X)$. As $S iso id$, for all $N$ we have $[S^N (c)] = [c]$. But $S^N (c) in C^cal(U) (X)$ for $N$ large enough. 

  Second, we show $H^cal(U) (X) -> H (X)$ is injective. Pick $[c] in H_n^cal(U) (X)$ such that its image in $H_n (X)$ is zero. Pick $d in C_(n+1) (X)$ such that $diff d = c$. By assumption, we can pick $N$ large enough such that $S^N d in C^cal(U) (X)$. We can also pick a chain homotopy $k$ from $id $ to $S^N$. Thus we have $ d - S^n d = k diff d + diff k d = k c + diff k d $
  Applying $diff$ to get
  $ diff k c = c - diff (S^N d) $
  and therefore $c = diff (k c + S^N d)$ (minus sign? #TODO) and hence $[c] = 0$.
]

Our current goal is to define $S : Ccx(X) -> Ccx(X)$ and $h: C_n (X) -> C_(n+1) (X)$ with $h diff + diff h = id - S$ in a way that is natural in $X$, i.e. for all $f: X-> Y$, the following diagrams commute:
#align(center,image("imgs/2023-11-19-14-39-38.png",width:30%))
#align(center,image("imgs/2023-11-19-14-39-58.png",width:30%))
As any simplex $sigma in C_n$ can be obtained as $sigma_ast (iota)$ for $iota in C_n (Delta^n)$, the "identity simplex", it is enough to find $S, h$ on simplices $iota in C_n (Delta^n)$. ($sigma_ast : Ccx(Delta^n) -> Ccx(X)$ is the push-forward of $sigma: Delta^n -> X$.) In general, we have $S(sigma) = sigma_ast (S(iota))$ and $h(sigma) = sigma_ast (h(iota))$.

To define $S(iota)$, we need the *cone operator* $C_k (Delta^n) -> C_(k+1) (Delta^n)$. 
#definition[
Write the *berycentre* $ b = 1/(n+1) sum_(i=0)^n e_i $ Given a singular $k$-simplex $sigma : Delta^k -> Delta^n$, define a  $(k+1)$-simplex $cone(sigma) : Delta^(k+1) -> Delta^n$ by
$
  cone(sigma)(x_0, ..., x_(k+1)) = x_0 b + (1-x_0) sigma (x_1 / (1-x_0), ..., x_(k+1) / (1-x_0))
$
#align(center,image("imgs/2023-11-19-17-18-16.png",width:50%))
]
#proposition[
  This operation satisfies
  $ diff oo cone = id - cone oo diff $
]
#proof[
  #TODO
]

#definition[
  Induction definition of $S$. When $n = 0$, then $S : C_0 (X) -> C_0 (X)$ is the identity. When $n > 0$, define
  $ S(iota) = cone(S (diff iota )) $
]

#TODO Unravel this definition for $n = 2$.

#definition[
  When $n = 0$, $h : C_0 (X) -> C_1 (X)$ is the zero map. When $n > 0$, $ h(iota) = cone(iota - h(diff iota)) $
]
#proposition[
  For all $sigma$, $ h diff sigma + diff h sigma = sigma - S sigma $
]
#proof[
  TODO
]

The final task: 
3. Prove for all $c in Ccx(X)$, there exists $N$ such that $S^N (c) in C^cal(U) (X) $.

#endlec(10)

= Universal coefficient theorem

 Basic questions that the UCT tries to
answer: 
- Is $H_ast lr((X comma R))$ determined by $H_ast lr((X comma bb(Z)))$? 
- Is $H^ast lr((X comma R))$ determined by $H_ast lr((X comma bb(Z)))$? \(And, if yes, how?)
$ upright(" input ") eq H_ast lr((X comma bb(Z))) $

Certainly, $Ccx lr((X comma R))$ and
$C^cx lr((X comma R))$ are determined by
$Ccx lr((X comma bb(Z)))$, via the formulas
$ Ccx lr((X comma R)) eq Ccx lr((X comma bb(Z))) times.circle R upright(" and ") C^cx lr((X comma R)) eq "Hom"_Z lr((Ccx lr((X comma bb(Z))) comma R)) $

Recall $hom_ZZ$ just means homomorphisms of abelian groups.
The subscript $zws_ZZ$ means $ZZ$-module, but a $ZZ$-module is the
same thing as an abelian group.

#definition[
$A times.circle B$ \(also denoted $A times.circle_ZZ B$ ) is the abelian
group whose elements are formal sums $sum_i a_i times.circle b_i$ with
$a_i in A$ and $b_i in B$, modulo the equivalence relation generated by
$lr((a plus a^prime)) times.circle b tilde.op a times.circle b plus a^prime times.circle b$
and by
$a times.circle lr((b plus b^prime)) tilde.op a times.circle b plus a times.circle b^prime$.
]

Alternatively, $A times.circle B$ is the quotient of $xor_A B$ by the
subgroup generated by
$ lr((a plus a^prime)) times.circle b tilde.op a times.circle b plus a^prime times.circle b $
or the quotient of $xor_B A$ by the subgroup generated by
$ a times.circle lr((b plus b^prime)) tilde.op a times.circle b plus a times.circle b^prime $

In order to formulate the UCT, one needs $Ext$ and $Tor$ which, just like
$hom$ and $times.circle$, are bifunctors. They take two abelian groups as
input, and produce a new ablelian group.

#definition[
For any abelian group A, using that evey
subgroup of a free abelian group is free, one can find a short exact
sequence
$ 0 arrow.r bb(Z)^(xor J) ->^f bb(Z)^(xor I) arrow.r A arrow.r 0 $
\(The chain complex
$dots.h 0 arrow.r 0 arrow.r bb(Z)^(xor J) arrow.r bb(Z)^(xor I)$
is called a *free resolution* of $A$.)

One then defines
$ "Ext"lr((A, B)) := "coker"lr((f^ast.basic colon product_I B arrow.r product_(J) B)) $
and
$ "Tor"lr((A comma B)) := ker lr((f_ast colon plus.circle.big_(J) B arrow.r plus.circle.big_(I) B)) $
where we’ve applied the functors $"Hom"lr((minus comma B))$ and
$minus times.circle_ZZ B$ to the map
$f colon bb(Z)^(xor J) arrow.r bb(Z)^(xor I)$, respectively.
]

#proposition[
$"Ext"lr((A comma B))$ is a contravariant functor of the variable $A$, and covariant of the variable $B$ \(just
like $hom$). 

$"Tor"lr((A comma B))$ is a covariant functor of each
variable, and satisfies $"Tor"lr((A comma B)) eq "Tor"lr((B comma A))$
\(just like $ - times.circle minus$ ).
]
#proof[Omitted.]
#example[
$  & "Ext"lr((bb(Z) slash 2 comma B)) eq B slash brace.l 2 b colon b in B brace.r\
 & "Tor"lr((bb(Z) slash 2 comma B)) eq brace.l b in B colon 2 b eq 0 brace.r $
\(can be seen by taking the free resolution of $bb(Z) slash 2$ given by
$bb(Z) ->^2 bb(Z)$.)
]

#proposition[
  $ hom (A, B) = ker(f^ast: product_I B -> product _J B) $
  $ A tp B = coker(f_ast : plus.circle.big_J B -> plus.circle.big_I B ) $
]

// $bold(A) times.circle bold(B) eq "coker" lr((upright(f) dot.basic colon xor_(upright(J)) upright(B) arrow.r xor_1 upright(med B)))$
// because that’s coker
// $lr((bb(Z)^(xor upright(J)) times.circle upright(B) arrow.r bb(Z)^(xor 1) times.circle upright(B)))$.

#proof[
Notice that $ hom(A, B) = ker (hom (ZZ^(xor I), B) -> hom(ZZ^(xor J), B)) $ and $ A tp B = coker(ZZ^(xor J) tp B -> ZZ^(xor I) tp B) $

The second one is harder to show.

The map 
$ coker lr((bb(Z)^(xor J) times.circle B arrow.r bb(Z)^(xor I) times.circle B)) arrow.r A times.circle B $
is visibly surjective. Because for a typical element
$sum_i a_i times.circle b_i in A times.circle B$, one can lift each
$a_i$ to $bb(Z)^(xor I)$. 

We need to see that if
$ sum_i x_i times.circle b_i in bb(Z)^(xor I) times.circle B mapsto 0 in A times.circle B $
then it comes from $bb(Z)^(xor J) times.circle B$. The expression
$sum_i x_i times.circle b_i$ represents an element of
$xor_B lr((bb(Z)^(xor I)))$. Since its image in $xor_B A$ represents zero
in $A times.circle B$, it can be written as
$ sum_k a_k times.circle lr((b_k^prime plus b^(prime prime)_k)) minus a_k times.circle b_k^prime minus a_k times.circle b^(prime prime)_k in xor_B A $
Lift each $a_k in A$ to some $x_k^prime in Z^(xor I)$ and consider the
corresponding sum
$ sum_k x_k^prime times.circle lr((b_k^prime plus b^(prime prime)_k)) minus x_k^prime times.circle b_k^prime minus x_k^prime times.circle b^(prime prime)_k in xor_B lr((bb(Z)^(xor I))) $
That new element of $xor_(B) lr((bb(Z)^(xor I)))$ differs
from our original $sum_i x_i times.circle b_i$ by something in
$ xor_B ker lr((bb(Z)^(xor I) arrow.r A)) eq xor_B lr((bb(Z)^(xor J))) $
We have written
$sum_i x_i times.circle b_i in xor_B lr((bb(Z)^(xor I)))$ as a sum of
something in $xor_B lr((bb(Z)^(xor J)))$ and something that
represents 0 in $bb(Z)^(xor I) times.circle B$. Thus we have
written our
$sum_i x_i times.circle b_i in bb(Z)^(xor I ) times.circle B$ as
something in $bb(Z)^(xor J) times.circle B$. #TODO]

#theorem(name: "Universal coefficient theorem")[
  There exsit natural, split #sess:
  $ ses(H_n (X, ZZ) tp R, H_n (X, R), Tor(H_(n-1) (X, ZZ), R)) $
  $ ses(Ext(H_(n-1) (X, ZZ), R), H^n (X, R), hom (X_n (X, ZZ), R))  $
]
#proof[
  The #sest (\*) $ ses(Z_n (X),  C_n (X), B_(n-1) (X), g: diff) $
  can be interpreted as a #sest of chain complexes:
  $ ses( Z_cx (X), Ccx (X), B_cx (X)) $
  where the first and third terms are viewed as chain complexes with zero differential.
  Now we look at the associated #lest of homology groups. The connecting homomorphism $B_(cx -1) (X) -> Z_(cx -1) (X)$ is just the usual inclusion. 
  #align(center,image("imgs/2023-11-19-22-20-42.png",width:50%))
  Applying the functors $ - tp R$ and $hom (-, R)$ to get two new #sest of chain complexes:

  $ ses(Z_cx (X) tp R, Ccx (X, R), B_(cx - 1) (X) tp R) $
  $ ses(hom(B_(cx - 1)(X), R), C^cx (X, R), hom (Z_cx (X), R)) $
  
  Note: these two functors do not in general send #sest to #sest. But the #sest (\*) is split because $B_(n-1) (X)$ is a free abelian group. Recall that every subgroup of a free abelian group is free.

  We get the corresponding #lest in (co)homology:

  // We get corresponding LES in \(co)homology: and
$   quad dots.h arrow.r B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R arrow.r H_n lr((X comma R)) arrow.r B_(n minus 1) lr((X)) times.circle R arrow.r Z_(n minus 1) lr((X)) times.circle R arrow.r dots.h $
and 
 $
  dots.h arrow.r "Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r  "Hom"lr((B_(n minus 1) lr((X)) comma R)) arrow.r H^ast.basic lr((X comma R)) \ arrow.r   "Hom"lr((Z_n lr((X)) comma R)) arrow.r  "Hom"lr((B_n lr((X)) comma R)) arrow.r dots.h $
Like above, the maps
$B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R$ and
$"Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r "Hom"lr((B_(n minus 1) lr((X)) comma R))$
are induced by the inclusion
$B_n lr((X)) times.circle R arrow.r.hook Z_n lr((X))$. 

We rewrite this as short exact sequences: 
$ 0 arrow.r "coker"lr((B_n lr((X)) times.circle R arrow.r Z_n lr((X)) times.circle R)) arrow.r H_n lr((X comma R)) \ arrow.r ker lr((B_(n minus 1) lr((X)) times.circle R arrow.r Z_(n minus 1) lr((X)) times.circle R)) arrow.r 0 $
and
$ 0 arrow.r coker lr(("Hom"lr((Z_(n minus 1) lr((X)) comma R)) arrow.r  "Hom"lr((B_(n minus 1) lr((X)) comma R)))) arrow.r H^ast.basic lr((X comma R)) \ arrow.r ker lr(("Hom"lr((Z_n lr((X)) comma R)) arrow.r "Hom"lr((B_n lr((X)) comma R)))) arrow.r 0 $

which we then recognise as 
$ 0 arrow.r H_n lr((X comma bb(Z))) times.circle R arrow.r H_n lr((X comma R)) arrow.r "Tor"lr((H_(n minus 1) lr((X comma bb(Z))) comma R)) arrow.r 0 $
and 
$ 0 arrow.r "Ext"lr((H_(n minus 1) lr((X comma bb(Z))) comma R)) arrow.r H^ast.basic lr((X comma R)) arrow.r "Hom"lr((H_n lr((X comma bb(Z))) comma R)) arrow.r 0 $

In view of the fact that
$ dots.h arrow.r 0 arrow.r B_n lr((X)) arrow.r Z_n lr((X)) $ is a
free resolution of $H_n lr((X))$. Here, we’ve used that if
$dots.h arrow.r 0 arrow.r bb(Z)^(xor J) arrow.r^f bb(Z)^(xor I)$
is a free resolution of $A$, then
  $
  A times.circle R &eq "coker"lr((f_ast colon xor_(J) R arrow.r xor_(I) R)) \
  "Tor"lr((A comma R)) &eq ker lr((f_ast colon xor_(J) R arrow.r xor_I R)) \
"Ext"lr((A comma R)) &eq "coker"lr((f^ast colon product_I R arrow.r product_J R)) \
"Hom"lr((A comma R)) &eq ker lr((f^star.op colon product_I R arrow.r product_J R))
  $
]
#TODO a lot of stuff
#corollary[ Excision stuff ]

#endlec(11)

= Equivalence of singular and simplicial homology

Our next
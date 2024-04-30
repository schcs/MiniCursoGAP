## Aritmética básica

### Operações aritméticas

<div class="task">
As operações mais comuns em GAP são `+` (adição), `-` (subtração), `*` (multiplicação), `/` (divisão), `mod`, `^` (exponenciação). Considere os seguintes exemplos
```python
gap> 2+3;
5
gap> 2/4;
1/2
gap> (2+3)*(1/2);
5/2
gap> 2^3*3;
24
gap> 2^-2*3;
3/4
gap> 2.0;
2.
gap> 2.01+3.11;
5.12
gap> 1/3;
1/3
gap> 1.0/3;
0.333333
```
</div>
Note a diferença de trabalhar com valores exatos (como por exemplo `1/3`) e valores aproximados (por exemplo `1.0/3`).

Quando trabalhamos com estruturas algébricas, precisamos trabalhar com corpos além do corpo $\mathbb Q$. Aqui em baixo veremos alguns exemplos para aritmética com corpos finitos.
```python
gap> F := GF(11);
GF(11)
gap> e := One( F );
Z(11)^0
gap> z := Zero( F );
0*Z(11)
gap> p := PrimitiveElement( F );
Z(11)
gap> e+p;
Z(11)^8
gap> e+p^2;
Z(11)^4
gap> IntFFE( e+p^2 );
5
```


### Variáveis

As variáveis guardam valores. Uma variável é um string de letras, números e alguns carateres especiais. Aqui é um exemplo simples.
```python
gap> 3a := 2;
2
gap> _3a := 2;
2
gap> a := 2; 
2
gap> b := 3;
3
gap> a + b; a*b;
5
6

```
Variávies podem conter valores mais complexos, como nos seguintes exemplos.

```python
gap> s1 := "Hello";
"Hello"
gap> s2 := " World!";
" World!"
gap> Concatenation( s1, s2 );
"Hello World!"
```

### Funções

Funções em ```GAP``` podem ser usadas para realizar computações que queremos fazer várias vezes com diferentes objetos. Por exemplo a função que, dado ```x``` computa ```3*x+1``` pode ser definida de duas maneiras diferentes.
```python
gap> f1 := function( x )
> return 3*x+1;
> end;
function( x ) ... end
gap> f2 := x -> 3*x + 1;
function( x ) ... end
gap> f1 = f2;
false
gap> f1( 5 );
16
gap> f2( -2 );
-5
```

Nos exemplos anteriores, a função não precisa de variáveis adicionais para executar sua tarefa. Isso pode acontecer com funções simples, mas uma função mais complicada pode precisar introduzir as suas próprias variáveis, chamadas de variáveis locais. Considere a seguinte implementação do exemplo em cima.
```python
gap> f3 := function( x )
> local y;
> y := 3*x;
> return y+1;
> end;
function( x ) ... end
gap> f3(4);
13
gap> y;
Error, Variable: 'y' must have a value
not in any function at *stdin*:44
```
As últimas linhas do exemplo anterior mostram que o variável ```y``` não está visível fora da função. Isso permite que variáveis com o mesmo nome sejam usadas em várias funções sem que sejam confundidas. O mesmo também impede que a varíavel local ```y``` definida dentro da função ```f3``` seja confundida com uma possível variável global também chamada de ```y```. O seguinte código mostra que o nome `y` tem significado diferente dentro e fora da função. 
```python
gap> f3 := function( x )
> local y;
> y := 3*x;
> Print( "O valor de y é ", y, "\n" );
> return y+1;
> end;
function( x ) ... end
gap> y := -5;
-5
gap> f3(10);
O valor de y é 30
31
gap> y;
-5
```





### Listas e Matrizes

Listas são importantes em ```GAP```. Listas contém uma sequência de objetos. Os objetos nas listas podem ser números, carateres, ou até objetos complexos, tais como grupos, subgrupos de um grupo, etc. Os seguintes exemplos mostram a criação de listas e as operações básicas com listas.

```python
gap> L1 := [1,3,5,7,9,10,8,6,4,2,0];
[ 1, 3, 5, 7, 9, 10, 8, 6, 4, 2, 0 ]
gap> L2 := ["a","b","c","z","x","y"];
[ "a", "b", "c", "z", "x", "y" ]
gap> L1[3];
5
gap> 10 in L1;
true
gap> 10 in L2;
false
gap> "a" in L2;
true
gap> Union( L1, L2 );
[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "a", "b", "c", "x", "y", "z" ]
gap> Position( L1, 10 );
6
gap> Position( L1, -1 );
fail
gap> Intersection( L1, L2 );
[  ]
gap> Filtered( L, x -> x mod 2 = 0 );
Error, Variable: 'L' must have a value
not in any function at *stdin*:2
gap> Filtered( L1, x -> x mod 2 = 0 );
[ 10, 8, 6, 4, 2, 0 ]
gap> Filtered( L1, x -> x mod 2 = 1 );
[ 1, 3, 5, 7, 9 ]
gap> Filtered( L1, x -> IsEvenInt( x ));
[ 10, 8, 6, 4, 2, 0 ]
gap> Filtered( L1, x -> IsOddInt( x ));
[ 1, 3, 5, 7, 9 ]
gap> Filtered( L1, IsEvenInt );
[ 10, 8, 6, 4, 2, 0 ]
gap> Filtered( L1, IsOddInt );
[ 1, 3, 5, 7, 9 ]
gap> 
```

Listas podem ser criadas usando outras listas. Por exemplo, criamos a list dos quadrados dos primeiros 10 números naturais:
```python
gap> List( [1..10], x->x^2 );
[ 1, 4, 9, 16, 25, 36, 49, 64, 81, 100 ]

```
Em `GAP` uma matriz é lista de listas (que são as linhas da matriz). As entradas de matrizes são tipicamente números ou, mais geralmente, elementos de um anel ou corpo. As matrizes podem ser somadas e multiplicadas exatamente como números.
```python
gap> List( [1..10], x->x^2 );
[ 1, 4, 9, 16, 25, 36, 49, 64, 81, 100 ]
gap> m1 := [[1,2,0],[0,-2,3]];
[ [ 1, 2, 0 ], [ 0, -2, 3 ] ]
gap> Display( m1 );
[ [   1,   2,   0 ],
  [   0,  -2,   3 ] ]
gap> m2 := [[1,-1],[0,3],[4,1/2]];
[ [ 1, -1 ], [ 0, 3 ], [ 4, 1/2 ] ]
gap> Display( m2 );
[ [    1,   -1 ],
  [    0,    3 ],
  [    4,  1/2 ] ]
gap> m1*m2;
[ [ 1, 5 ], [ 12, -9/2 ] ]
gap> Display( last );
[ [     1,     5 ],
  [    12,  -9/2 ] ]
gap> m2*m1;
[ [ 1, 4, -3 ], [ 0, -6, 9 ], [ 4, 7, 3/2 ] ]
gap> Display( last );
[ [    1,    4,   -3 ],
  [    0,   -6,    9 ],
  [    4,    7,  3/2 ] ]
```
Outro objeto fundamento quando trabalhamos com grupos finitos é a permutação. Permutações em `GAP` podem ser definidas como produto de cíclos disjuntos mas também usando uma lista. 
```python
gap> p1 := (1,2,3)(4,5,6);
(1,2,3)(4,5,6)
gap> p1^2;
(1,3,2)(4,6,5)
gap> p2 := PermList( [1,5,4,3,2] );
(2,5)(3,4)
gap> p1*p2;
(1,5,6,3)(2,4)
gap> p2*p1;
(1,2,6,4)(3,5)
```

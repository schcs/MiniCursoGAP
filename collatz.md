<link href="style.css" rel="stylesheet"></link>

## Projeto 1: A Conjetura de Collatz

$\newcommand{\N}{\mathbb N}$
<div class="problem">
Considere a seguinte função $f:\N\to \N$:
$$
    f(n)=\left\{\begin{array}{cc} n/2 & \mbox{se $n$ for par;}\\
    3n+1 & \mbox{se $n$ for ímpar.}\end{array}\right.
$$
A [Conjetura de Collatz](https://en.wikipedia.org/wiki/Collatz_conjecture) afirma que para todo $n\in\N$, existe um número $k$ tal que aplicando a função $f$ $k$ vezes em $n$, o resultado vai ser igual a $1$. Em outras, palavras, $f^k(n)=1$.
</div>

### Tarefa
<div class="subproblem">
Escreva uma função `collatz( n )` que toma $n$ como input e devolve $f(n)$. Faça testes da sua função com vários números. 
</div>

<div class="hint">
Precisa testar se o input é par ou ímpar e para isso pode usar a operação `mod` [(manual)](https://docs.gap-system.org/doc/ref/chap4_mj.html#X7B66C8707B5DE10A).
```python
gap> 3 mod 2;
1
gap> 6 mod 2;
0
```
Além disso, a sua função precisará usar a expressão `if` [(manual)](https://docs.gap-system.org/doc/ref/chap4_mj.html#X875000188622700D).
</div>

<div class="example_run">
A sua função deve comportar-se de acordo com os seguintes exemplos:
```python
gap> collatz( 15 );
46
gap> collatz( 14 );
7
gap> collatz( 5 );
16
```
</div>


### Tarefa 2
<div class="subproblem">
Escreva uma função `nr_steps( n )` que vai calcular o número de vezes a função $f$ precisa ser aplicado em $n$ para obter o número $1$. Em outras palavras,  `nr_steps( n )` deve devolver o menor número $k$ tal que $f^k(n)=1$.
</div>

<div class="hint">
Você usará a função a função `collatz( n )` na tarefa anterior em um laço `while` [(manual)](https://docs.gap-system.org/doc/ref/chap4_mj.html#X87AA46408783383F) ou `repeat` [(manual)](https://docs.gap-system.org/doc/ref/chap4_mj.html#X87AA46408783383F). 
</div>

<div class="example_run">
A sua função precisa devolver input de acordo com os seguintes exemplos.
```python
gap> nr_steps( 1 );
0
gap> nr_steps( 3 );
7
gap> nr_steps( 14 );
17
gap> nr_steps( 32 );
5
```
</div>


### Tarefa 3
<div class="subproblem">
Escreva uma função `max_nr_steps( n )` para determinar o número $k\in\{1,\ldots,n\}$ tal que `nr_steps( k )` é maior possível.
</div>

<div class="hint">
Pode usar a função `nr_steps( k )` escrita na tarefa anterior em um laço  `for` [(manual)](https://docs.gap-system.org/doc/ref/chap4_mj.html#X78783E777867638A) que roda na lista `[1..n]`. 
</div>

<div class="example_run">
O comportamento da sua função seguirá os seguintes exemplos:
```python
gap> max_nr_steps( 1000 );
[ 871, 178 ]
gap> max_nr_steps( 10000 );
[ 6171, 261 ]
gap> max_nr_steps( 100000 );
[ 77031, 350 ]
```
</div>

### Tarefa 4
<div class="subproblem">
Calcular `nr_steps( k )` separadamente para todo $k\in \{1,\ldots,n\}$ faz muita computação redundante. Por exemplo, calculando `max_nr_steps( 6 )` deste jeito, fazemos as seguintes contas 
```python
1 -> 1 
2 -> 1
3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 
4 -> 2 -> 1 
5 -> 16 -> 8 -> 4 -> 2 -> 1
6 -> 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
```
Ou seja, a computação `nr_steps( 6 )` deve realizar que `nr_steps( 3 )` já foi calculado e simplificar a conta por computar que `nr_steps( 6 ) = nr_steps( 3 ) + 1`. Escreva uma versão da função `max_nr_steps( n )` utilizando as computações anteriores e compare o tempo de execução das duas versões.
</div>

## A linguagem de programação

### Expressões `if-then`

A expressão `if-then` está usada quando queremos executar instruções de acordo com alguma condição que pode ser verdadeira ou falsa. Considere o seguinte exemplo:
```python
gap> a := 3;                # seja a inicialmente 3
3
gap> if a mod 2 = 0 then    # se a for par, dividimos a por 2
> b := a/2;
> fi;
gap> a;                     # valor de a continua 3
3
gap> if a mod 2 = 1 then    # se a for ímpar, multiplicamos a por 3 e somamos 1
> a := 3*a+1;
> fi;
gap> a;                     # o valor de a mudou
10
```
Expressões mais complicadas podem ser montadas usando as palavras chaves `else` e `elif`.
```python
gap> a := 3;
3
gap> if a mod 2 = 0 then 
> a := a/2;
> else
> a := 3*a+1;
> fi;
gap> a;
10
gap> a := 8;
8
gap> if a mod 2 = 0 then
> a := a/2;
> else
> a := 3*a+1;
> fi;
gap> a;
4
```

### Laço `for`

### Laço `while`

### Laço `repeat`

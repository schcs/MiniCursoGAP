collatz := function( n )

    if n mod 2 = 0 then 
        return n/2;
    else 
        return 3*n+1;
    fi;
end;

nr_steps := function( n )
    local st;

    st := 0;
    while n > 1 do 
        n := collatz( n );
        st := st+1;
    od;

    return st;
end;


max_nr_steps := function( n )
    local max, max_i, i, max_nr_i;

    max := 0; max_i := 1;
    for i in [1..n] do
        max_nr_i := nr_steps( i );  
        if max_nr_i > max then 
            max := max_nr_i;
            max_i := i; 
        fi;
    od; 

    return [max_i, max];
end;

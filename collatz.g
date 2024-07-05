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

max_nr_steps_v2 := function( n )
    local nr_steps, max_i, max_nr, i, k, i0, nr_steps_local;

    nr_steps := [0];

    max_i := 0; max_nr := 0;
    for i in [2..n] do

        if IsBound( nr_steps[i]) then 
            continue;
        fi;

        k := 0; i0 := i;
        repeat 
            i0 := collatz( i0 );
            k := k+1;
            if IsBound( nr_steps[i0] ) then
                nr_steps_local := nr_steps[i0] + k; 
                nr_steps[i] := nr_steps_local;
                if nr_steps_local > max_nr then 
                    max_i := i;
                    max_nr := nr_steps_local;
                fi;
                break;
            fi;
        until false; 
    od; 

    return [max_i,max_nr];    
end;


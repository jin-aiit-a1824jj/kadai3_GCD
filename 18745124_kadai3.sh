#!/bin/bash

echo `clear`                                                                                                                   

function main(){
    
   input_num_1=$(input_number "1つ目の整数を入力→ " "$1")
   if (( $? != 0  ));then
       echo "1つ目の整数を入力 error! → $input_num_1"
       echo "0より大きい正の整数を入力してください！"
       exit 1
   fi

   input_num_1=$(check_zero_start_number $input_num_1)
   if (( $input_num_1 == 0 ));then
       echo "1つ目の整数 error! 入力値がゼロです！"
       exit 1
   fi

   input_num_2=$(input_number "2つ目の整数を入力→ " "$2")     
   if (( $? != 0 ));then
       echo "2つ目の整数を入力 error! → $input_num_2"
       echo "0より大きい正の整数を入力してください！"
       exit 1
   fi
   
   input_num_2=$(check_zero_start_number $input_num_2)
   if (( $input_num_2 == 0 ));then
       echo "2つ目の整数 error! 入力値がゼロです！"
       exit 1
   fi

   calc_gcd $input_num_1 $input_num_2
}

function input_number(){
    if [ -n "$2" ]; then
	var=$2
    else
	read -p "$1" var
    fi

    if expr "$var" : "[0-9]*$" >&/dev/null;then
        # echo "is a number"
	echo $var
    else
        # echo "is not a number"
	echo $var
        exit 1
    fi
}

function check_zero_start_number(){
    var=$1
    echo $var | sed -e 's/^0\+\([0-9]\+\)$/\1/'  
}

function calc_gcd(){
    a=$1
    b=$2
    #echo "before: $a, $b"    
    if (( $a < $b ));then
	tmp=$a
	a=$b
	b=$tmp
    fi

    printf "入力した整数 [$a], [$b] の最大公約数は→ "

    while [ 1 ]
    do
	n=`expr ${a} % ${b}`
	a=$b
	b=$n

	if (( $b == 0)); then
	    echo $a
	    break
	fi	
    done
}

main $1 $2

exit 0

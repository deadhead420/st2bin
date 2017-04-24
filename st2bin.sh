#!/bin/bash

int=0
bytes=1
raw=false

case "$1" in
	-r|--raw)	raw=true ; shift ;;
	-h|--help)	usage ; exit ;;
esac

case "$(tput cols)" in
	[0-9]|[1][0-9]|[2][0-4])	x=1 ;;
	[2][5-9]|[3][0-4])			x=2 ;;
	[3][5-9]|[4][0-4])     		x=3 ;;
	[4][5-9]|[5][0-4])     		x=4 ;;
	[5][5-9]|[6][0-4])     		x=5 ;;
	[6][5-9]|[7][0-4])     		x=6 ;;
	[7][5-9]|[8][0-4])			x=7 ;;
	*)							x=8 ;;
esac

for i in $(echo $* | sed 's/\(.\{1\}\)/\1 /g;s/  / br/g'); do
	case "$i" in
		"0")	echo -n "00110000 " ;;
		"1")	echo -n "00110001 " ;;
		"2")	echo -n "00110010 " ;;
		"3")	echo -n "00110011 " ;;
		"4")	echo -n "00110100 " ;;
		"5")	echo -n "00110001 " ;;
		"6")	echo -n "00110110 " ;;
		"7")	echo -n "00110111 " ;;
		"8")	echo -n "00111000 " ;;
		"9")	echo -n "00111001 " ;;
		"a")	echo -n "01100001 " ;;
		"b")	echo -n "01100010 " ;;
		"c")	echo -n "01100011 " ;;
		"d")	echo -n "01100100 " ;;
		"e")	echo -n "01100101 " ;;
		"f")	echo -n "01100110 " ;;
		"g")	echo -n "01100111 " ;;
		"h")	echo -n "01101000 " ;;
		"i")	echo -n "01101001 " ;;
		"j")	echo -n "01101010 " ;;
		"k")	echo -n "01101011 " ;;
		"l")	echo -n "01101100 " ;;
		"m")	echo -n "01101101 " ;;
		"n")	echo -n "01101110 " ;;
		"o")	echo -n "01101111 " ;;
		"p")	echo -n "01110000 " ;;
		"q")	echo -n "01110001 " ;;
		"r")	echo -n "01110010 " ;;
		"s")	echo -n "01110011 " ;;
		"t")	echo -n "01110100 " ;;
		"u")	echo -n "01110101 " ;;
		"v")	echo -n "01110110 " ;;
		"w")	echo -n "01110111 " ;;
		"x")	echo -n "01111000 " ;;
		"y")	echo -n "01111001 " ;;
		"z")	echo -n "01111010 " ;;
		"A")	echo -n "01000001 " ;;
		"B")    echo -n "01000010 " ;;
		"C")    echo -n "01000011 " ;;
		"D")    echo -n "01000100 " ;;
		"E")    echo -n "01000101 " ;;
		"F")    echo -n "01000110 " ;;
		"G")    echo -n "01000111 " ;;
		"H")    echo -n "01001000 " ;;
		"I")    echo -n "01001001 " ;;
		"J")    echo -n "01001010 " ;;
		"K")    echo -n "01001011 " ;;
		"L")    echo -n "01001100 " ;;
		"M")    echo -n "01001101 " ;;
		"N")    echo -n "01001110 " ;;
		"O")    echo -n "01001111 " ;;
		"P")    echo -n "01010000 " ;;
		"Q")    echo -n "01010001 " ;;
		"R")    echo -n "01010010 " ;;
		"S")    echo -n "01010011 " ;;
		"T")    echo -n "01010100 " ;;
		"U")    echo -n "01010101 " ;;
		"V")    echo -n "01010110 " ;;
		"W")    echo -n "01010111 " ;;
		"X")    echo -n "01011000 " ;;
		"Y")    echo -n "01011001 " ;;
		"Z")    echo -n "01011010 " ;;
		"~")	echo -n "01111110 " ;;
		'`')	echo -n "01100000 " ;;
		"!")	echo -n "00100001 " ;;
		"@")	echo -n "01000000 " ;;
		"#")	echo -n "00100011 " ;;
		"$")	echo -n "00100100 " ;;
		"%")	echo -n "00100101 " ;;
		"^")	echo -n "01011110 " ;;
		"&")	echo -n "00100110 " ;;
		"*")	echo -n "00101010 " ;;
		"(")	echo -n "00101000 " ;;
		")")	echo -n "00101001 " ;;
		"-")	echo -n "00101101 " ;;
		"_")	echo -n "01011111 " ;;
		"=")	echo -n "00111101 " ;;
		"+")	echo -n "00101011 " ;;
		"[")	echo -n "01011011 " ;;
		"{")	echo -n "01111011 " ;;
		"]")	echo -n "01011101 " ;;
		"}")	echo -n "01111101 " ;;
		'\')	echo -n "01011100 " ;;
		"|")	echo -n "01111100 " ;;
		";")	echo -n "00111011 " ;;
		":")	echo -n "00111010 " ;;
		"'")	echo -n "00100111 " ;;
		'"')	echo -n "00100010 " ;;
		",")	echo -n "00101100 " ;;
		"<")	echo -n "00111100 " ;;
		".")	echo -n "00101110 " ;;
		">")	echo -n "00111110 " ;;
		"/")	echo -n "00101111 " ;;
		"?")	echo -n "00111111 " ;;
		"br")	echo -n "00100000 " ;;
	esac

	if ! "$raw" ; then
		int=$((int+1))
		bytes=$((bytes+1))
    
		if [ "$i" == "br" ]; then
			char+=" "
		else
			char+="$i"
		fi
    
		if [ "$int" -eq "$x" ] || [ "$bytes" -eq $(echo $* | wc -c) ]; then
			if [ "$int" -lt "$x" ]; then
				offset=$((x-int))
			else
				offset=0
			fi
    
			until [ "$offset" -eq "0" ]; do
				echo -n "         "
				offset=$((offset-1))
			done
    
			echo -en ">: $char\n"
			int=0
			unset char
		fi
	fi
done

if "$raw" ; then
	echo
fi

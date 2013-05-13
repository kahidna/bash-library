#!/bin/bash
# colors tests

######## Inclusion of the lib
libfile="`dirname $0`/../src/library.sh"
if [ -f "$libfile" ]; then source "$libfile"; else
    padder=$(printf '%0.1s' "#"{1..1000})
    printf "\n### %*.*s\n    %s\n    %s\n%*.*s\n\n" 0 $(($(tput cols)-4)) "ERROR! $padder" \
        "Unable to find required library file '$libfile'!" "Sent in '$0' by '`whoami`' - pwd is '`pwd`'" \
        0 $(tput cols) "$padder";
    exit 1
fi
######## !Inclusion of the lib

NAME="Bash colors tests"
parsecomomnoptions "$@"
quietecho "_ go"
echo

linelg=$(tput cols)
normalcode=$(gettextoptiontag normal)
padder=$(printf '%0.1s' "-"{1..1000})

colorstr=""
col1lg=$(( ($linelg-4)/5 ))
col2lg=$(( 2*$col1lg ))
printf -v line "+%*.*s+%*.*s+%*.*s+\n" 0 $col1lg "$padder" 0 $col2lg "$padder"  0 $col2lg "$padder";
colorstr="${colorstr}${line}"
for col in ${libcolors[@]}; do
    fgcolor=$(getcolorcode $col)
    bgcolor=$(getcolorcode $col true)
    fgcolorcode=$(gettextformattag $fgcolor)
    bgcolorcode=$(gettextformattag $bgcolor)
    printf -v line \
        "|%-*s|%-*s|%-*s|\n" \
        $col1lg " color ${col} " \
        $(($col2lg+`strlen "$fgcolorcode"`+`strlen "$normalcode"`)) " ${fgcolorcode} foreground code=${fgcolor} ${normalcode} " \
        $(($col2lg+`strlen "$bgcolorcode"`+`strlen "$normalcode"`)) " ${bgcolorcode} background code=${bgcolor} ${normalcode} ";
    colorstr="${colorstr}${line}"
done
printf -v line "+%*.*s+%*.*s+%*.*s+\n" 0 $col1lg "$padder" 0 $col2lg "$padder"  0 $col2lg "$padder";
colorstr="${colorstr}${line}"
echo "## Text colors demo:"
echo "$colorstr"

txtoptstr=""
col1lg=$(( ($linelg-3)/5 ))
col2lg=$(( 4*$col1lg ))
printf -v line "+%*.*s+%*.*s+\n" 0 $col1lg "$padder" 0 $col2lg "$padder";
txtoptstr="${txtoptstr}${line}"
for col in ${libtextoptions[@]}; do
    txtopt=$(gettextoptioncode $col)
    txtoptcode=$(gettextformattag $txtopt)
    cell="using code=${txtopt}: ${txtoptcode}%-.*s${normalcode}";
    printf -v cuttedcell "$cell" $(($col2lg-`strlen "$cell"`+`strlen "$txtoptcode"`+`strlen "$normalcode"`)) "$LOREMIPSUM"
    printf -v line \
        "|%-*s|%-*s|\n" \
        $col1lg " text option ${col} " \
        $(($col2lg+`strlen "$txtoptcode"`+`strlen "$normalcode"`-6)) " $cuttedcell ";
    txtoptstr="${txtoptstr}${line}"
done
printf -v line "+%*.*s+%*.*s+\n" 0 $col1lg "$padder" 0 $col2lg "$padder";
txtoptstr="${txtoptstr}${line}"
echo "## Text options demo:"
echo "$txtoptstr"

quietecho "_ ok"
scriptdebug
exit 0

# Endfile
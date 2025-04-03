echo "Number Exchange"
echo -n "First Number: "
read num1
echo -n "Second Number: "
read num2

tmp=$num1
num1=$num2
num2=$tmp

echo "Numbers are: "
echo "Num1: $num1"
echo "Num2: $num2"

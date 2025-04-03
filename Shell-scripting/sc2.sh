echo "Enter your Number: "
echo -n "1st: "
read num1
echo -n "2nd: "
read num2
echo -n "3rd: "
read num3
echo -n "4th: "
read num4

sum=$((num1+num2+num3+num4))
avg=$(($sum/4))
product=$((num1*num2*num3*num4))

echo "Sum is: $sum"
echo "Average is: $avg"
echo "Product is: $product"

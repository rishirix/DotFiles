echo -n "Enter Number: "
read num

if ! [[ "$num" =~ ^[0-9]+$ ]]; then
	echo "Invalid Input"
	exit 1
fi

factorial=1
for ((  i=1;i<=num;i++ )); do
	factorial=$(( factorial * i ))
done

echo "Factorial of $num is: $factorial"

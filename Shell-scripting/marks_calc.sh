calc_marks(){
	grade=$1

if [ $grade -ge 90 ] && [ $grade -le 100 ]; then
	echo "A Grade"
	exit 1
elif
	[ $grade -ge 70 ] && [ $grade -le 89 ]; then
	echo "B Grade"
	exit 1
elif
	[ $grade -ge 40 ] && [ $grade -le 69 ]; then
	echo "C Grade"
	exit 1
elif
	[ $grade -lt 40 ]; then
	echo "Grade F"
	exit 1
else
	echo "Invalid Input"
	exit 1
fi
}

echo -n "Enter Marks to Know Grade: "
read marks
echo "Your Grade is : $(calc_marks $marks)"

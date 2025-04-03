is_prime() {
	num=$1
	i=2
	while [ $i -le $(($num / 2)) ]; do
		if [ $(( $num % $i)) -eq 0 ]; then
			return 1
		fi
		i=$(( i+1 ))
	done
	return 0
}

num=2
while [ $num -le 100 ]; do
	is_prime $num
	if [ $? -eq 0 ]; then
		echo $num
	fi
	num=$(( num + 1))
done

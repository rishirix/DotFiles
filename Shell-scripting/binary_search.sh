binary_search(){
	local arr=($(echo "$1" | tr '' '\n' | sort -n ))
	local target=$2
	local left=0
	local right=$((${#arr[@]} -1 ))
	
	while [ $left -le $right ]
	do
		mid=$(((left+right) /2))
		if [ ${arr[mid]} -eq $target ]; then
			echo "Number found at position: $((mid + 1))"
			return
		elif 
			[ ${arr[mid]} -lt $target ]; then
			left=$((mid + 1 ))
		else
			right=$((mid - 1))
		fi
	done
	echo "Number not found"
}

echo -n "Enter space separated numbers: "
read input_list
echo -n "Enter Number to Search: "
read search_number

binary_search "$input_list" "$search_number"

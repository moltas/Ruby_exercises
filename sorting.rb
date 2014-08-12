


numbers = [4, 2, 3, 1, 9]

def bubble_sort(arr)

	counter = arr.size-1

	while counter > 0

		1.upto(counter) do |i|
			if arr[i-1] > arr[i]
				temp = arr[i-1]
				arr[i-1] = arr[i]
				arr[i] = temp
			end
		end
		counter -= 1
	end #while	

	print arr.to_s

end #end method




def bubble_sort_by(arr)

	counter = arr.size-1

	while counter > 0

		1.upto(counter) do |i|
			if yield(arr[i-1], arr[i]) < 0
				temp = arr[i-1]
				arr[i-1] = arr[i]
				arr[i] = temp
			end
				
		end

		counter -= 1
	end #while	

	print arr.to_s
end

#bubble_sort(numbers)
bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length }
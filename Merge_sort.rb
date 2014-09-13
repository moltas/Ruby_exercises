
#Merge sort in Ruby

def merge_sort(ary)

	if ary.length <= 1
		ary
	else
		mid = (ary.length / 2).floor
		c = merge_sort(ary[0..mid - 1])
		b = merge_sort(ary[mid..ary.length])
		merge(b, c)
	end
end


def merge(b, c)

	if b.empty?
		c
	elsif c.empty?
		b
	elsif c.first < b.first
		[c.first] + merge(c[1..c.length], b)
	else
		[b.first] + merge(c, b[1..b.length])
	end
end




array = [23, 51, 10, 2, 6, 23]


puts merge_sort(array)





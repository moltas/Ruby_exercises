numbers = [4, 2, 3, 1, 9]


def bubble_sort(arr)
  
  return unless arr.size > 1
  indices = arr.each_index
  begin
    swapped = false
    i = indices.next
    indices.each do |j|
      a = arr[i]
      b = arr[j]
      if a > b
        arr[i] = b
        arr[j] = a
        swapped = true
      end
      i = j
    end
    indices.rewind
  end while swapped
end

bubble_sort(numbers)

puts numbers.inspect
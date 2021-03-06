%{
Description

In computational complexity theory, the 3SUM problem asks if a given set of n real numbers contains three elements that sum to zero. A naive solution works in O(N2) time, and research efforts have been exploring the lower complexity bound for some time now.
Input Example

You will be given a list of integers, one set per line. Example:
9 -6 -5 9 8 3 -4 8 1 7 -4 9 -9 1 9 -9 9 4 -6 -8
Output Example

Your program should emit triplets of numbers that sum to 0. Example:
-9 1 8
-8 1 7
-5 -4 9
-5 1 4
-4 1 3
-4 -4 8
}

challenge_input1 = [4, 5, -1, -2, -7, 2, -5, -3, -7, -3, 1]
challenge_input2 = [-1, -6, -3, -7, 5, -8, 2, -8, 1]
challenge_input3 = [-5, -1, -4, 2, 9, -9, -6, -1, -7]
example = [9, -6, -5, 9, 8, 3, -4, 8, 1, 7, -4, 9, -9,
           1, 9, -9, 9, 4, -6, -8]

def three_sum(array)
  answer = []
  new_array = array.combination(3).to_a.each(&:sort!)
  new_array.uniq.each do |sub_array|
    answer.push(sub_array) if sub_array.inject(&:+).zero?
  end
  answer.each { |sub_array| puts sub_array.join(' ').to_s }
end

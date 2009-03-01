require 'rubygems'
require 'mathn'
require 'facets/dictionary'

def augment( a, b)
  i = a.row_size
  temp_array  = Array.new
  temp_matrix = Array.new
  i.times do |i|
    temp_array  = a.row(i).to_a << b.row(i).to_a
    temp_matrix[i] = temp_array.flatten
  end 
  Matrix.rows( temp_matrix )
end

def make_tableau( objective, constraints )
  temp_matrix = []
  temp_array  = []
  constraints.each do |answer,coef|
    temp_matrix << coef
    temp_array  << answer
  end
  temp_matrix << objective
  i = Matrix.identity(temp_matrix.length)
  a = Matrix.rows( temp_matrix )
  augment( a, i )
end

A = Matrix.rows([[1,2,3,-1],[4,5,6,-2],[7,8,9,-3]])
I = Matrix.identity(4)
puts augment(A,I)

constraints = Dictionary.new
objective = [-1,-2,-3]
constraints[6]  = [7,0,1]
constraints[20] = [1,2,0]
constraints[30] = [0,3,4] 
puts (make_tableau objective, constraints)



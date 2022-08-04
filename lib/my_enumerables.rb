module Enumerable
  
  def my_each_with_index
    return self unless block_given?
    for i in 0..self.length-1 do
      yield(self[i],i)
    end
    self
  end

  def my_select
    temp_arr = []
    for i in 0..self.length-1 do
      temp_arr << self[i] if yield(self[i])
    end
    temp_arr
  end

  def my_all?
    for i in 0..self.length-1 do
      return false if !yield(self[i])
    end
    true
  end

  def my_any?
    for i in 0..self.length-1 do
      return true if yield(self[i])
    end
    false
  end

  def my_none?
    for i in 0..self.length-1 do
      return false if yield(self[i])
    end
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    for i in 0..self.length-1 do
      count += 1 if yield(self[i])
    end
    count
  end

  def my_map
    temp_arr = []
    for i in 0..self.length-1 do
      temp_arr << yield(self[i])
    end
    temp_arr
  end

  def my_inject(value)
    for i in 0..self.length-1 do
      value = yield(value , self[i])
    end
    value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self do
      yield(element)
    end
    self
  end
end

require 'byebug'

class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= max && num >= 0 
  end

  def validate!(num)
    is_valid?(num)
  end
  
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] = num
  end

  def remove(num)
    i = num % num_buckets
    @store.delete(i)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

# set = IntSet.new(20)
# set.insert(5)
# set.insert(10)
# p set
# set.remove(5)
# p set

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    # resize!
  end

  def insert(num)
    if num_buckets == count
      resize!
    end
    if !self.include?(num)
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = (Array.new(num_buckets * 2) { Array.new })
    @store.each do |arr|
      arr.each { |ele| new_array[ele % new_array.length] << ele}
    end
    @store = new_array
  end

end

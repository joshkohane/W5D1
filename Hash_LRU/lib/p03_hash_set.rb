class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end
    if !self.include?(key)
      self[key.hash] << key
      @count += 1
      return true
    end
    false
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
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
      arr.each { |ele| new_array[(ele.hash) % new_array.length] << ele}
    end
    @store = new_array
  end
end

#Hashing Function Properties 

=begin
1. Senstive (slightly different input will give different outputs)
2. One-way (cant predict input from look @ output)
3. Outputs are uniform 
=end
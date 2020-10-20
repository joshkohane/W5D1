class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    #hash elements and then add them together 
    #maybe involve index when hashing so order is taken into account 

    sum = ""
    self.each do |ele|
      # num = ele.to_s(2)
      # sum = (sum ^ num).to_s(2)
    #  sum = ele.to_s(2)
      sum += ele.to_s(2)
    end
    p sum.to_i
    # self.inject do |acc, el|
    #  acc + el.to_s(2)

    # end
  end
end

# p [1,2,3].hash

class String
  def hash
    #turn string into array and then call array hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    #order doesn't matter 
    #turn it into a sorted array and then we can call our array hash function on it
    
    0
  end
end

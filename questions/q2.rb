# Before Action && After Action


module BeforeMethod

  def before(array, hash)
    @@array = array
    @@hash = hash
    @@check = true
    def method_added method
      if(@@check)
        @@check = false
        if(@@array.include?(method.to_sym))
          old = instance_method(method)
          define_method method do
            @@hash.each_value do |val|
              send val
            end
            old.bind(self).call
          end
        end
        @@check = true
      else
      end
    end
  end

end

class A
  extend BeforeMethod
  before [:a, :b], run: :c, fun: :d

  def a
    puts 'a'
  end

  def b
    puts 'b'
  end

  def d
    puts 'd'
  end

  private
  def c
    puts 'c'
  end
end

A.new.a
A.new.b
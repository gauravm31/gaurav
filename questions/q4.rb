# Q) To make an object of child class from a instance of parent class


class A
  @@subs = []
  def self.inherited (sub)
    @@subs << sub
  end

  def self.new *param
    if param.length == 1
      if(@@subs.include?(param[0]))
        param[0].new
      end
    else
      super()
    end
  end
end

class B < A
end

class C < A
end

class D
end

p A.new(B)
p A.new(C)
p A.new(D)

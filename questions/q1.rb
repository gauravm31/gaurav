# Q) Alias method without using alias_method (Note define your own alias method)

module Aliasing
  def alias_m(m2, m1)
    m = instance_method(m1.to_s)
    p = instance_method(m1.to_s).parameters
    class_eval do
      define_method m2 do |*p|
        m.bind(self).call *p
      end
    end
  end
end

class A
  extend Aliasing
  def abc a, b=1, *c
    p a, b
  end

  alias_m :xyz, :abc
end
A.new.xyz('abcd')
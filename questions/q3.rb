# Q) alias_attr method for a instance variable

module AttrAlias
  def alias_attr(a2, a1)
    class_eval  do
      define_method :create_aliases do
        a = instance_variable_get(a1)
        instance_variable_set(a2, a)
      end
    end
  end
end

class A
  extend AttrAlias
  
  def initialize
    @a = '12'
    create_aliases
  end

  alias_attr :@b, :@a

  def show
    puts @b
  end
end

a = A.new
a.show

class Parrot
  def fly
    print 'Parrot flying'
  end
end

class Airplane
  def fly
    puts 'Airplane flying'
  end
end

class Whale
  def swim
    puts 'Whale swimming'
  end
end

def lift_off(entity)
  entity.fly
end

parrot = Parrot.new
airplane = Airplane.new
whale = Whale.new

lift_off(parrot)
lift_off(airplane)
lift_off(whale)

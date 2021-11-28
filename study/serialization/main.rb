require 'yaml'
require 'json'
require 'msgpack'

class Person 
  attr_accessor :name, :age, :gender 

  def initialize(name, age, gender) 
    @name = name 
    @age = age 
    @gender = gender 
  end 

  def to_yaml 
    YAML.dump ({
      :name => @name, 
      :age => @age, 
      :gender => @gender
    })
  end 

  def self.from_yaml(string) 
    data = YAML.load string 
    p data 
    self.new(data[:name], data[:age], data[:gender])
  end 

  def to_json
    JSON.dump ({
      :name => @name,
      :age => @age, 
      :gender => @gender
    })
  end 

  def self.from_json(string) 
    data = JSON.load string 
    p data
    self.new(data['name'], data['age'], data['gender'])
  end 

  def to_msgpack 
    MessagePack.dump ({
      :name => @name, 
      :age => @age,
      :gender => @gender
    })
  end 

  def self.from_msgpack(string) 
    data = MessagePack.load string 
    p data
    self.new(data['name'], data['age'], data['gender'])
  end 
end 

p = Person.new "Yuu", "27", "male"
p "yaml: #{p.to_yaml}"
p "json: #{p.to_json}"
p "msgpack: #{p.to_msgpack}"

puts "from yaml ......"
p = Person.from_yaml(p.to_yaml) 
puts "Name: #{p.name}"
puts "Age: #{p.age}"
puts "Gender: #{p.gender}"
puts 

puts "from json ......"
p = Person.from_json(p.to_json) 
puts "Name: #{p.name}"
puts "Age: #{p.age}"
puts "Gender: #{p.gender}"
puts

puts "from msgpack ......"
p = Person.from_msgpack(p.to_msgpack) 
puts "Name: #{p.name}"
puts "Age: #{p.age}"
puts "Gender: #{p.gender}"
puts

class Person
    include ActiveModel::Conversion
    include ActiveModel::Validations

    validates_presence_of :name

    attr_accessor :name

    def initialize(attributes = {})
        @name = attributes[:name]
    end
end

person1 = Person.new(:name => "matz")
p person1.valid?

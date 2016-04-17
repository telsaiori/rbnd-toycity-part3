class Customer
    attr_reader :name
    @@customers = []
    
    def initialize(options = {})
        @name = options[:name]
        add_customer
    end
    
    def self.all
        @@customers
    end
    
    private
    
    def add_customer
        if @@customers.map{|user|user.name}.include?(@name)
            raise DuplicateProductError, "#{@name}  already exists."
        else
            @@customers << self
        end
    end
end
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
    
    def self.find_by_name(name)
        @@customers.each do |user|
           if user.name == name
            return user
           end
        end
    end
    
    def purchase(product)
        #Transaction.new(self.name, product)
        Transaction.new(self, product)
    end
    
    
    private
    
    def add_customer
        if @@customers.map{|user|user.name}.include?(@name)
            raise DuplicateCustomerError, "#{@name}  already exists."
        else
            @@customers << self
        end
    end
end
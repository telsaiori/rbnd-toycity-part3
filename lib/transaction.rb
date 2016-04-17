class Transaction
    attr_reader :customer, :product, :id
    @@id = 0
    
    def initialize(customer, product)
        @customer = customer
        @product = product
        @id = @@id += 1
    end
    

end
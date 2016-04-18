class Transaction
    attr_reader :customer, :product, :id
    @@id = 0
    @@transaction = []
    
    def initialize(customer, product)
        @customer = customer
        @product = product
        @id = @@id += 1
        @@transaction << self
        transact
    end
    
    def self.all
        @@transaction
    end
    
    def self.find(id)
        @@transaction[id-1]
    end
    
    def del_order
        @@transaction.delete_if do |item|
            item.id == self.id
        end
    end
    
    private
    def transact
        if @product.stock ==0
            raise DuplicateProductError, "#{@product.title} is out of stock."
        else
            @product.stock -= 1
        end
    end

    

end
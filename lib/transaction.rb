class Transaction
    attr_reader :customer, :product, :id
    @@id = 0
    @@transaction = []
    
    def initialize(customer, product)
        @customer = customer
        @product = product
        @@id += 1
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
    
    def self.find_by(option = {})
        if option[:customer]
            @@transaction.each do |item|
                if item.customer.name == "Walter Latimer"
                    p item
                end
            end
        end
        if option[:product]
            @@transaction.each do |item|
                if item.customer.name == "Walter Latimer"
                    p item
                end
            end
        end
    end

    
    def transact
        if @product.stock ==0
            raise DuplicateProductError, "#{@product.title} is out of stock."
        else
            @product.stock -= 1
        end
    end

    

end
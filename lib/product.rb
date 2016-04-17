class Product
    attr_reader :title
    @@products = []
    
    def initialize(options = {})
        @title = options[:title]
        add_to_products
    end
    
    def self.all
        @@products
    end
    
    private
    
    def add_to_products
        p "ADD PRODUCT#{@@products}"
        @@products.each do |item|
            p item.title
            if item.title == @title
                raise DuplicateProductError, "#{@title} already exists."
            else
                @@products << self
                break
            end
        end
        if @@products == []
            @@products << self
        end
    end
end
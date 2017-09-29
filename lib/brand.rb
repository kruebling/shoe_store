class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand, {:presence => true, :length => {:maximum => 100}})
  validates(:brand, uniqueness: { case_sensitive: false })
  before_save(:upcase)

  private

  def upcase
    array = self.brand.split
    array.each do | i |
      i.capitalize!
    end
    self.brand = array.join(' ')
  end

  # def format
  #   price = self.price.to_s()
  #   return price + ".00"
  # end
end

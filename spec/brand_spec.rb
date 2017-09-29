require 'spec_helper'

describe(Brand) do
  it { should have_and_belong_to_many(:stores)}

  it('limites the length of input to 100 characters') do
    brand = Brand.new({:brand => 'This title is too long'.*(5)})
    expect(brand.save()).to(eq(false))
  end

  it('prevents duplicate entries') do
    Brand.create({:brand => 'Dupli Cate'})
    brand = Brand.new({:brand => 'Dupli Cate'})
    expect(brand.save()).to(eq(false))
  end

  it('capitalizes the title') do
    brand = Brand.new({:brand => 'test'})
    brand.save()
    expect(brand.brand).to(eq('Test'))
  end

end

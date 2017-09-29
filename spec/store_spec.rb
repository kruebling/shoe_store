require 'spec_helper'

describe(Store) do
  it { should have_and_belong_to_many(:brands)}

  it('limites the length of input to 100 characters') do
    store = Store.new({:name => 'This title is too long'.*(5)})
    expect(store.save()).to(eq(false))
  end

  it('prevents duplicate entries') do
    Store.create({:name => 'Dupli Cate'})
    store = Store.new({:name => 'Dupli Cate'})
    expect(store.save()).to(eq(false))
  end

  it('capitalizes the title') do
    store = Store.new({:name => 'testing'})
    store.save()
    expect(store.name).to(eq('Testing'))
  end
end

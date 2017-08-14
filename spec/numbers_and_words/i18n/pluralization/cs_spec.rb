require 'spec_helper'

describe I18n, 'cs' do
  before(:each) do
    @hash = {}
    %w[one few many other].each { |key| @hash[key.to_sym] = key }
    @backend = I18n.backend
  end

  it 'should pluralize correctly' do
    expect(@backend.send(:pluralize, :cs, @hash, 1)).to eq('one')
    expect(@backend.send(:pluralize, :cs, @hash, 2)).to eq('few')
    expect(@backend.send(:pluralize, :cs, @hash, 3)).to eq('few')
    expect(@backend.send(:pluralize, :cs, @hash, 5)).to eq('many')
    expect(@backend.send(:pluralize, :cs, @hash, 10)).to eq('many')
    expect(@backend.send(:pluralize, :cs, @hash, 11)).to eq('many')
    expect(@backend.send(:pluralize, :cs, @hash, 21)).to eq('one')
    expect(@backend.send(:pluralize, :cs, @hash, 29)).to eq('many')
    expect(@backend.send(:pluralize, :cs, @hash, 52)).to eq('few')
    expect(@backend.send(:pluralize, :cs, @hash, 131)).to eq('one')
    expect(@backend.send(:pluralize, :cs, @hash, 1.31)).to eq('other')
    expect(@backend.send(:pluralize, :cs, @hash, 2.31)).to eq('other')
    expect(@backend.send(:pluralize, :cs, @hash, 3.31)).to eq('other')
  end
end
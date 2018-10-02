require 'rails_helper'

describe 'Merchants api' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)
  end
end

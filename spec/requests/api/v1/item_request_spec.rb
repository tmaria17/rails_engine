require 'rails_helper'

describe 'items api' do
  it 'sends a list of items' do
    merchant = Merchant.create!(name: "Houses For Animals")
    item1 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
    item2 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
    item3 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
    item4 = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )


    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(4)
  end

  it 'finds one item'do
    merchant = Merchant.create!(name: "Houses For Animals")
    item = Item.create!(name:"trash can", description: "a house for a raccoon", unit_price: 400, merchant_id: merchant.id )
    item_id = item.id
    get "/api/v1/items/#{item_id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["id"]).to eq(item_id)
  end
end

require 'rails_helper'

RSpec.describe "bills/index", type: :view do
  before(:each) do
    assign(:bills, [
      Bill.create!(
        name: "Name",
        amount: 2,
        description: "MyText"
      ),
      Bill.create!(
        name: "Name",
        amount: 2,
        description: "MyText"
      )
    ])
  end

  it "renders a list of bills" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end

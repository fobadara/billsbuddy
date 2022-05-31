require 'rails_helper'

RSpec.describe "bills/edit", type: :view do
  before(:each) do
    @bill = assign(:bill, Bill.create!(
      name: "MyString",
      amount: 1,
      description: "MyText"
    ))
  end

  it "renders the edit bill form" do
    render

    assert_select "form[action=?][method=?]", bill_path(@bill), "post" do

      assert_select "input[name=?]", "bill[name]"

      assert_select "input[name=?]", "bill[amount]"

      assert_select "textarea[name=?]", "bill[description]"
    end
  end
end

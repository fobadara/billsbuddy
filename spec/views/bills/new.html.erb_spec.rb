require 'rails_helper'

RSpec.describe "bills/new", type: :view do
  before(:each) do
    assign(:bill, Bill.new(
      name: "MyString",
      amount: 1,
      description: "MyText"
    ))
  end

  it "renders new bill form" do
    render

    assert_select "form[action=?][method=?]", bills_path, "post" do

      assert_select "input[name=?]", "bill[name]"

      assert_select "input[name=?]", "bill[amount]"

      assert_select "textarea[name=?]", "bill[description]"
    end
  end
end

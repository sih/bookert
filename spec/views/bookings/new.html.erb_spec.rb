require 'spec_helper'

describe "bookings/new" do
  before(:each) do
    assign(:booking, stub_model(Booking,
      :booking_id => "124356",
      :nights => 1,
      :rooms => 1,
      :booking_date => "2013-07-22",
      :room_type => "MyString",
      :price => 1
    ).as_new_record)
  end

  it "renders new booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookings_path, :method => "post" do
      assert_select "input#booking_booking_id", :name => "booking[booking_id]"
      assert_select "input#booking_nights", :name => "booking[nights]"
      assert_select "input#booking_rooms", :name => "booking[rooms]"
      assert_select "input#booking_booking_date", :name => "booking[booking_date]"
      assert_select "input#booking_room_type", :name => "booking[room_type]"
      assert_select "input#booking_price", :name => "booking[price]"
    end
  end
end

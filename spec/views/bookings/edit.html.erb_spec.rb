require 'spec_helper'

describe "bookings/edit" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :booking_id => "1243567",
      :nights => 1,
      :rooms => 1,
      :date => "2013-07-22",
      :room_type => "DB",
      :price => 1
    ))
  end

  it "renders the edit booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookings_path(@booking), :method => "post" do
      assert_select "input#booking_booking_id", :name => "booking[booking_id]"
      assert_select "input#booking_nights", :name => "booking[nights]"
      assert_select "input#booking_rooms", :name => "booking[rooms]"
      assert_select "input#booking_booking_date", :name => "booking[booking_date]"
      assert_select "input#booking_room_type", :name => "booking[room_type]"
      assert_select "input#booking_price", :name => "booking[price]"
    end
  end
end

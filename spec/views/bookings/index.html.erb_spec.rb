require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
        :booking_id => "123456",
        :nights => 1,
        :rooms => 2,
        :booking_date => "2013-07-22",
        :room_type => "Room Type",
        :price => 3
      ),
      stub_model(Booking,
        :booking_id => "123456",
        :nights => 1,
        :rooms => 2,
        :booking_date => "2013-07-22",
        :room_type => "Room Type",
        :price => 3
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "123456".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "2013-07-22".to_s, :count => 2
    assert_select "tr>td", :text => "Room Type".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

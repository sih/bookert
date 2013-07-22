require 'spec_helper'

describe "bookings/show" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :booking_id => "1234567",
      :nights => 1,
      :rooms => 2,
      :booking_date => "2013-07-22",
      :room_type => "Room Type",
      :price => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1234567/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/2013-07-22/)
    rendered.should match(/Room Type/)
    rendered.should match(/3/)
  end
end

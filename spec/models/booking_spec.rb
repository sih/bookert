require 'spec_helper'

describe Booking do
  
  describe "when creating a new booking" do
    
    before(:each) do
      @b = Booking.new(:booking_id => "1243567", :booking_date => "2013-07-22", :nights => 2, :rooms => 2, :room_type => Booking::DOUBLE, :price => 104000)
      @b.valid?.should be_true
    end

    it "should validate the date as ISO-8601" do
      @b.booking_date = "2013/07/22"
      @b.valid?.should be_false
    end
    
    it "should not trim leading zeros in the month" do
      @b.booking_date = "2013-7-22"
      @b.valid?.should be_false
    end    


    it "should not trim leading zeros in the day" do
      @b.booking_date = "2013-07-2"
      @b.valid?.should be_false
    end    
    
    it "should make sure room nights is a postive number" do
      @b.nights = -1
      @b.valid?.should be_false
    end

    it "should accept zero room nights" do
      @b.nights = 0
      @b.valid?.should be_true
    end
    
  end

  describe "when querying by booking date" do
    
    before(:each) do
      @b = Booking.new(:booking_id => "1243567", :booking_date => "2013-07-24", :nights => 2, :rooms => 2, :room_type => Booking::DOUBLE, :price => 104000)
      @b.save.should be_true
    end
    
    describe "when there are no bookings" do
      
      it "should return an empty array" do
        Booking.on_date("2013-07-22").should be_empty
      end
      
    end
    
    describe "when there is a booking" do
      before(:each) do
        @bookings = Booking.on_date("2013-07-24")
      end
      
      it "should have a single booking in the array" do
        @bookings.size.should == 1
      end
      
      it "should match the booking created above" do
        @bookings.first.should eq(@b)
      end

    end
    
    describe "when no params are passed" do
      it "should return an empty array" do
        Booking.on_date().should be_empty
      end      
    end
    
  end


end

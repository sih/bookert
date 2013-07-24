#
# Basic model representing a hotel booking
# #boston, #pemaquid
#
class Booking
  include Mongoid::Document
  
  DOUBLE="DB"
  SINGLE="SG"
  QUEEN="QN"  
  KING="KG"
  EXECUTIVE="EX"
  JUNIOR="JN"

  
  field :booking_id, :type => String
  field :nights, :type => Integer
  field :rooms, :type => Integer
  field :booking_date, :type => String
  field :room_type, :type => String
  field :price, :type => Integer
  
  validates_format_of :booking_date, :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/
  validates :nights, :numericality => { :greater_than_or_equal_to => 0 }
  
  #
  # Return all bookings on this date
  #
  def self.on_date(book_date=nil)
    results = []
    results = Booking.where(booking_date: book_date) unless book_date.nil?
    results 
  end
  
end



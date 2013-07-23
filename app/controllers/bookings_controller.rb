class BookingsController < ApplicationController
  
  # make doubles most likely
  ROOM_TYPES = [Booking::DOUBLE,Booking::DOUBLE,Booking::SINGLE,Booking::DOUBLE,Booking::QUEEN,Booking::QUEEN,Booking::KING,Booking::EXECUTIVE,Booking::EXECUTIVE,Booking::SINGLE,Booking::SINGLE,Booking::DOUBLE,Booking::DOUBLE,Booking::JUNIOR]
  
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

  #
  # GET /stream/10000
  #
  def stream
    
    stream_count = (params[:items] || 1000).to_i 
    
    start = Time.now
    added = 0
    
    stream_count.times do
      b = Booking.new(
        :booking_id => Fakey.string, 
        :nights => Fakey.number(4), 
        :rooms => Fakey.number(1)+1, 
        :booking_date => Fakey.iso_date_short(50), 
        :room_type => ROOM_TYPES[Fakey.number(ROOM_TYPES.length)],
        :price => 100+Fakey.number(76))
      
      added += 1 if b.save
      
    end
    
    elapsed = (Time.now - start).to_i
    
    respond_to do |format|
      format.html { redirect_to :bookings, notice: "#{added} bookings successfully created in #{elapsed}s." }
      format.json { render json: "#{added} bookings successfully created in #{elapsed}s.", status: :created}
    end    
    
  end



end

class Fakey
  
  def self.string(chars=10)
    (0...chars).map{('a' ... 'z').to_a[rand(26)] }.join
  end
  
  def self.number(max=10)
    (rand*max).to_i
  end
  
  def self.iso_date_long(days_out=365)
    d = (rand*days_out).to_i
    (Time.now + d.days).to_s
  end  
  
  def self.iso_date_short(days_out=365)
    Fakey.iso_date_long.slice(0,10)
  end
  
end
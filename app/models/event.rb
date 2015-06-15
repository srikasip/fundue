class Event < ActiveRecord::Base

  def addresses
    addresses = Address.where(["event_id = ?", self.id])
  end

end

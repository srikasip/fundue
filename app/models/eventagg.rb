class Eventagg < ActiveRecord::Base
  has_many :xstuffs

  def allTags
    ["eventName_xpath",
    "eventLocation_xpath",
    "eventDateTime_xpath",
    "eventDescription_xpath",
    "eventPrice_xpath",
    "eventImage_xpath"]
  end

  def readableTags
    ["Event Name", 
    "Event Location", 
    "Event Date and Time",
    "Event Description",
    "Event Price",
    "Event Image Src"]
  end

  def event_details
    return EventAgg.where(eventagg_id: self.id)
  end


end
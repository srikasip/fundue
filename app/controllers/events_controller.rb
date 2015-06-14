class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:jsonListener, :processedJsonListener]

  # GET /events
  # GET /events.json

  def processedJsonListener
    allEvents = params[:event]
    eventCounter = 0
    saveCounter = 0
    Event.delete_all
    Address.delete_all

     for event in allEvents
      begin
        newevent = Event.new
        newevent.name = nil_or_string(event[:name])
        newevent.description = nil_or_string(event[:description])
        newevent.price = nil_or_string(event[:price])
        newevent.imagepath = nil_or_string(event[:imagePath])
        newevent.source = nil_or_string(event[:source])
        newevent.location = nil_or_string(event[:location])
        newevent.datetime = nil_or_string(event[:datetime])

        newevent.dump = nil_or_string(event[:dump])

        newevent.ptime = flatten(event[:time])
        newevent.pdate = flatten(event[:date])

        if newevent.save
          saveCounter+=1
          if event[:addresses][:addresses] != nil and event[:addresses][:addresses].count > 0
            for address in event[:addresses][:addresses]
              newaddy = Address.new
              newaddy.event_id = newevent.id
              newaddy.full_address = nil_or_string(address[:full_address])
              newaddy.city = nil_or_string(address[:city])
              newaddy.region = nil_or_string(address[:region1])

              newaddy.save
            end
          end
        end

      rescue
        #do nothing
      ensure
        eventCounter+=1
      end
    end

    statistic = Statistic.new
    statistic.num_sent = eventCounter
    statistic.total_events = saveCounter
    statistic.num_addresses = (Address.count(:all, :group => :event_id)).count()
    
    statsAllEvents = Event.all
    
    statistic.num_pdate = clean_and_count(statsAllEvents.pluck(:pdate))
    statistic.num_ptime = clean_and_count(statsAllEvents.pluck(:ptime))
    statistic.num_price = clean_and_count(statsAllEvents.pluck(:price))
    statistic.save()

    responseString = '{"total": "'+eventCounter.to_s+'", "saved":"'+saveCounter.to_s+'"}'
    respond_to do |format|
        format.html { render :html => responseString }
        format.json { render :json => responseString }
      
    end
  end

  def jsonListener
    allEvents = params[:event]
    eventCounter = 0
    saveCounter = 0

    for event in allEvents
      begin
        newevent = Event.new
        newevent.name = event[:name]
        newevent.location = event[:location]
        newevent.description = event[:description]
        newevent.datetime = event[:datetime]
        newevent.price = event[:price]
        newevent.imagepath = event[:imagePath]
        newevent.save
        saveCounter += 1
      rescue
        #do nothing
      ensure
        eventCounter += 1
      end
    end
    responseString = '{"total": "'+eventCounter.to_s+'", "saved":"'+saveCounter.to_s+'"}'
    respond_to do |format|
        format.html { render :html => responseString }
        format.json { render :json => responseString }
    end
  end




  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :location, :description, :datetime, :price, :imagepath, :pdate, :ptime, :dump)
    end

    def clean_and_count(sentArray)
      sentArray.delete_if { |item| my_remove(item, ",.|\t\n\r").blank? }

      return sentArray.count
    end

    def my_remove(sentString, delims)
      returnString = sentString
      if returnString
        delims.split("").each do |delim|
          hold = returnString.slice!(delim.to_s)
        end
      else
        returnString = ""
      end
      return returnString
    end

    def flatten(sentArray)
      str = ""
      if sentArray and sentArray.count>0
        for item in sentArray
          str += item + " | "
        end
      else
        str = nil
      end
      return str
    end

    def nil_or_string(sentString)
      if sentString
        sentString = sentString.strip()
        if sentString == nil or sentString == ""
          return nil
        else
          return sentString
        end
      else
        return nil
      end
    end

end

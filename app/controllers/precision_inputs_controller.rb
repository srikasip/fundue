class PrecisionInputsController < ApplicationController
  before_action :set_precision_input, only: [:show, :edit, :update, :destroy]

  # GET /precision_inputs
  # GET /precision_inputs.json
  def date_validation
    #get a new session_id that is valid
    pastValidHold = PrecisionInput.count(:all, :group => 'session_id')
    if pastValidHold
      if pastValidHold.count()>0
        sessionID = pastValidHold.max[0] + 1
      else
        sessionID = 1
      end
    else
      sessionID = 1
    end
    statID = Statistic.all.pluck(:id).max

    #send a random sample of events and associated precision_inputs



    @validateEvents = Event.all.sample(10)

    @precInputs = []
    @validateEvents.each do |event|
      precinput = PrecisionInput.new
      precinput.event_id = event.id
      precinput.field_name = "pdate"
      precinput.session_id = sessionID
      precinput.statistic_id = statID
      precinput.save
      @precInputs << precinput
    end
  end

  def time_validation
    #get a new session_id that is valid
    pastValidHold = PrecisionInput.count(:all, :group => 'session_id')
    if pastValidHold
      if pastValidHold.count()>0
        sessionID = pastValidHold.max[0] + 1
      else
        sessionID = 1
      end
    else
      sessionID = 1
    end
    statID = Statistic.all.pluck(:id).max

    #send a random sample of events and associated precision_inputs



    @validateEvents = Event.all.sample(10)

    @precInputs = []
    @validateEvents.each do |event|
      precinput = PrecisionInput.new
      precinput.event_id = event.id
      precinput.field_name = "ptime"
      precinput.session_id = sessionID
      precinput.statistic_id = statID
      precinput.save
      @precInputs << precinput
    end
  end

  def price_validation
    #get a new session_id that is valid
    pastValidHold = PrecisionInput.count(:all, :group => 'session_id')
    if pastValidHold
      if pastValidHold.count()>0
        sessionID = pastValidHold.max[0] + 1
      else
        sessionID = 1
      end
    else
      sessionID = 1
    end
    statID = Statistic.all.pluck(:id).max

    #send a random sample of events and associated precision_inputs



    @validateEvents = Event.all.sample(10)

    @precInputs = []
    @validateEvents.each do |event|
      precinput = PrecisionInput.new
      precinput.event_id = event.id
      precinput.field_name = "price"
      precinput.session_id = sessionID
      precinput.statistic_id = statID
      precinput.save
      @precInputs << precinput
    end
  end


  def address_validation
    #get a new session_id that is valid
    pastValidHold = PrecisionInput.count(:all, :group => 'session_id')
    if pastValidHold
      if pastValidHold.count()>0
        sessionID = pastValidHold.max[0] + 1
      else
        sessionID = 1
      end
    else
      sessionID = 1
    end
    statID = Statistic.all.pluck(:id).max

    #send a random sample of events and associated precision_inputs



    @validateEvents = Event.all.sample(10)

    @precInputs = []
    @validateEvents.each do |event|
      precinput = PrecisionInput.new
      precinput.event_id = event.id
      precinput.field_name = "address"
      precinput.session_id = sessionID
      precinput.statistic_id = statID
      precinput.save
      @precInputs << precinput
    end
  end

  def cleanOut
    PrecisionInput.delete_all('is_correct is NULL')
    responseString = '{"outcome":"done"}'
    respond_to do |format|
      format.html { render :html => responseString }
      format.json { render :json => responseString }
    end
  end


  def saveCorrect
    @precision_input = PrecisionInput.find(params[:id])
    @precision_input.is_correct = true

    if @precision_input.save
      responseString = '{"outcome":"saved"}'
    else
      responseString = '{"outcome":"error"}'
    end

    respond_to do |format|
      format.html { render :html => responseString }
      format.json { render :json => responseString }
    end

  end

  def saveWrong
    @precision_input = PrecisionInput.find(params[:id])
    @precision_input.is_correct = false
    @precision_input.how_wrong = params[:precError]

    if @precision_input.save
      responseString = '{"outcome":"saved"}'
    else
      responseString = '{"outcome":"error"}'
    end

    respond_to do |format|
      format.html { render :html => responseString }
      format.json { render :json => responseString }
    end

  end

  def index
    @precision_inputs = PrecisionInput.all
  end

  # GET /precision_inputs/1
  # GET /precision_inputs/1.json
  def show
  end

  # GET /precision_inputs/new
  def new
    @precision_input = PrecisionInput.new
  end

  # GET /precision_inputs/1/edit
  def edit
  end

  # POST /precision_inputs
  # POST /precision_inputs.json
  def create
    @precision_input = PrecisionInput.new(precision_input_params)

    respond_to do |format|
      if @precision_input.save
        format.html { redirect_to @precision_input, notice: 'Precision input was successfully created.' }
        format.json { render action: 'show', status: :created, location: @precision_input }
      else
        format.html { render action: 'new' }
        format.json { render json: @precision_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precision_inputs/1
  # PATCH/PUT /precision_inputs/1.json
  def update
    respond_to do |format|
      if @precision_input.update(precision_input_params)
        format.html { redirect_to @precision_input, notice: 'Precision input was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @precision_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precision_inputs/1
  # DELETE /precision_inputs/1.json
  def destroy
    @precision_input.destroy
    respond_to do |format|
      format.html { redirect_to precision_inputs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_precision_input
      @precision_input = PrecisionInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def precision_input_params
      params.require(:precision_input).permit(:session_id, :event_id, :field_name, :is_correct, :how_wrong)
    end
end

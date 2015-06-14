class PrecisionInputsController < ApplicationController
  before_action :set_precision_input, only: [:show, :edit, :update, :destroy]

  # GET /precision_inputs
  # GET /precision_inputs.json
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

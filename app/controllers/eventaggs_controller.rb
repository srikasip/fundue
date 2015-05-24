class EventaggsController < ApplicationController
  before_action :set_eventagg, only: [:show, :edit, :update, :destroy]

  # GET /eventaggs
  # GET /eventaggs.json
  def index
    @eventaggs = Eventagg.all

  end

  # GET /eventaggs/1
  # GET /eventaggs/1.json
  def show
  end

  # GET /eventaggs/new
  def new
    @eventagg = Eventagg.new
  end

  # GET /eventaggs/1/edit
  def edit
  end

  # POST /eventaggs
  # POST /eventaggs.json
  def create
    @eventagg = Eventagg.new(eventagg_params)

    respond_to do |format|
      if @eventagg.save
        format.html { redirect_to @eventagg, notice: 'Eventagg was successfully created.' }
        format.json { render action: 'show', status: :created, location: @eventagg }
      else
        format.html { render action: 'new' }
        format.json { render json: @eventagg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventaggs/1
  # PATCH/PUT /eventaggs/1.json
  def update
    respond_to do |format|
      if @eventagg.update(eventagg_params)
        format.html { redirect_to @eventagg, notice: 'Eventagg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @eventagg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventaggs/1
  # DELETE /eventaggs/1.json
  def destroy
    @eventagg.destroy
    respond_to do |format|
      format.html { redirect_to eventaggs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventagg
      @eventagg = Eventagg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventagg_params
      params.require(:eventagg).permit(:name, :link, :site_type, :pagination, :domain, :eventpage)
    end
end

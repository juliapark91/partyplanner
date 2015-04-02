class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    @guests = @party.guests
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to @party, notice: 'Party was successfully created.'
      
    else
      flash[:error] = "Error creating party. Please try again."
      render :new
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    if @party.update(party_params)
      redirect_to @party, notice: 'Party was successfully updated.'
    else
      flash[:error] = "Error editing party. Please try again."
      render :edit
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:title, :started_at, :ended_at, :city, :state, :zip_code, :phone, :email)
    end
end

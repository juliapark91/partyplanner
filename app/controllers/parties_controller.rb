class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.all
  end

  def show
    @guest = @party.guests.build
    @guests = @party.guests
  end

  def new
    @party = Party.new
  end

  def edit
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to @party, notice: 'Party was successfully created.'
      
    else
      flash[:error] = "Error creating party. Please try again."
      render :new
    end
  end

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
    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:title, :started_at, :ended_at, :city, :state, :zip_code, :phone, :email, :guest_id)
    end
end

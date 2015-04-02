class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
  end

  def show
    @parties = @guest.parties
  end

  def new
    @guest = Guest.new
  end

  def edit
  end

  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      redirect_to @guest, notice: 'Guest was successfully created.'
    else
      flash[:error] = "Error saving guest. Please try again."
      render :new
    end
  end

  def update
    if @guest.update(guest_params)
      redirect_to @guest, notice: 'Guest was successfully updated.'
    else
      flash[:error] = "Error editing guest."
      render :edit
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :email, :party_id)
    end
end

class HousingsController < ApplicationController
  before_action :set_housing, only: [:show, :edit, :update, :destroy]

  # GET /housings
  # GET /housings.json
  def index
    if current_user.nil? then
      @housings = Housing.all
    else
      @housings = Housing.where("user_id != ?", current_user.id)
    end
  end

  # GET /housings/1
  # GET /housings/1.json
  def show
  end

  # GET /housings/new
  def new
    authenticate_user!
    @housing = Housing.new
  end

  # GET /housings/1/edit
  def edit
    authenticate_user!
  end

  # POST /housings
  # POST /housings.json
  def create
    authenticate_user!
    @housing = current_user.housings.new(housing_params)

    respond_to do |format|
      if @housing.save
        format.html { redirect_to @housing, notice: 'Housing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @housing }
      else
        format.html { render action: 'new' }
        format.json { render json: @housing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /housings/1
  # PATCH/PUT /housings/1.json
  def update
    authenticate_user!
    respond_to do |format|
      if @housing.update(housing_params)
        format.html { redirect_to @housing, notice: 'Housing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @housing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.json
  def destroy
    @housing.destroy
    respond_to do |format|
      format.html { redirect_to housings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing
      @housing = Housing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_params
      params.require(:housing).permit(:title, :description, :address, :image_url)
    end
end

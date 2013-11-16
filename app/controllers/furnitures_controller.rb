class FurnituresController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  # GET /furnitures
  # GET /furnitures.json
  def index
    if current_user.nil? then
      @furnitures = Furniture.all
    else
      @furnitures = Furniture.where("user_id != ?", current_user.id)
    end
  end

  # GET /furnitures/1
  # GET /furnitures/1.json
  def show
  end

  # GET /furnitures/new
  def new
    authenticate_user!
    @furniture = Furniture.new
  end

  # GET /furnitures/1/edit
  def edit
    authenticate_user!
    @furniture = Furniture.new
  end

  # POST /furnitures
  # POST /furnitures.json
  def create
    authenticate_user!
    @furniture = current_user.furnitures.new(furniture_params)

    respond_to do |format|
      if @furniture.user != current_user then
        format.html { redirect_to @furniture, alert: 'You don\'t have right for this action.' }
        format.json { head :no_content }
      else 
        if @furniture.save
          format.html { redirect_to @furniture, notice: 'Furniture was successfully created.' }
          format.json { render action: 'show', status: :created, location: @furniture }
        else
          format.html { render action: 'new' }
          format.json { render json: @furniture.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /furnitures/1
  # PATCH/PUT /furnitures/1.json
  def update
    authenticate_user!
    respond_to do |format|
      if @furniture.user != current_user then
        format.html { redirect_to @furniture, alert: 'You don\'t have right for this action.' }
        format.json { head :no_content }
      else 
        if @furniture.update(furniture_params)
          format.html { redirect_to @furniture, notice: 'Furniture was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @furniture.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /furnitures/1
  # DELETE /furnitures/1.json
  def destroy
    @furniture.destroy
    respond_to do |format|
      format.html { redirect_to furnitures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture
      @furniture = Furniture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_params
      params.require(:furniture).permit(:title, :description, :image_url)
    end
end

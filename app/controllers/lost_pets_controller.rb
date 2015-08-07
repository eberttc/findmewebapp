class LostPetsController < ApplicationController
  before_action :set_lost_pet, only: [:show, :edit, :update, :destroy]

  # GET /lost_pets
  # GET /lost_pets.json
  def index
    @lost_pets = LostPet.all.where({ status: "1"}).order("report_date DESC")
    @lost_pets = LostPet.by_distrito(params[:district_id]).where({ status: "1"}).order("report_date DESC") unless params[:district_id].blank?
    @lost_pets= LostPet.by_tipo(params[:pet_type_id]).where({ status: "1"}).order("report_date DESC") unless params[:pet_type_id].blank?
    @lost_pets= current_user.lost_pets.all.where({ status: "1"}).order("report_date DESC") unless params[:id_user].blank?
   
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @lost_pets.to_json(:include => :pet) }
    end
  end


  def addLostPet
    @my_search = MySearch.new()
    @my_search.lost_pet_id=params[:id]
    @my_search.user_id=params[:user_id]
    @my_search.state=1
    
     respond_to do |format|
      if @my_search.save
       # format.html { redirect_to user_my_searches_path(:user_id => params[:user_id]), notice: 'My search was successfully created.' }
        format.html { redirect_to   lost_pet_path(params[:id]), notice: 'You have started searching this pet.' }
        format.json { render json: @my_search}
      else
        format.html { render :new }
        format.json { render json: @my_search.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # GET /lost_pets/1
  # GET /lost_pets/1.json
  def show
  end

  # GET /lost_pets/new
  def new
    @lost_pet = LostPet.new
    @lost_pet.latitude="-12.086794"
    @lost_pet.longitude="-77.035828"
    @MyPets=current_user.pets.all
    pet_lost = Pet.find(params[:id_pet]) if ! params[:id_pet].nil?
    if pet_lost
       @lost_pet.pet=pet_lost
    end  
   
  end

  # GET /lost_pets/1/edit
  def edit
     @MyPets=current_user.pets.all
  end

  # POST /lost_pets
  # POST /lost_pets.json
  def create
    @lost_pet = LostPet.new(lost_pet_params)
    @lost_pet.status="1"
    @lost_pet.report_date=Time.now
    respond_to do |format|
      if @lost_pet.save
        pet = Pet.find(@lost_pet.pet_id)
        pet.update_attribute(:state ,"P") 
        
        @my_search = MySearch.new()
        @my_search.lost_pet_id=@lost_pet.id
        @my_search.user_id=@lost_pet.user_id
        @my_search.state=1
        @my_search.save
        
        format.html { redirect_to @lost_pet, notice: 'Lost pet was successfully created.' }
        format.json { render :show, status: :created, location: @lost_pet }
      else
        format.html { render :new }
        format.json { render json: @lost_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lost_pets/1
  # PATCH/PUT /lost_pets/1.json
  def update
    respond_to do |format|
      if @lost_pet.update(lost_pet_params)
        format.html { redirect_to @lost_pet, notice: 'Lost pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @lost_pet }
      else
        format.html { render :edit }
        format.json { render json: @lost_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_pets/1
  # DELETE /lost_pets/1.json
  def destroy
    #@lost_pet.destroy
   
    respond_to do |format|
         if @lost_pet.update_attribute(:status ,"0") #Se anula
            pet = Pet.find(@lost_pet.pet_id)
            pet.update_attribute(:state ,"A")
            format.html { redirect_to lost_pets_url, notice: 'Lost pet was successfully removed.' }
            format.json { head :no_content }
         else
            format.html { redirect_to lost_pets_url, notice: 'Lost pet error' }
            format.json {  render json: @lost_pet.errors, status: :unprocessable_entity }
         end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_pet
      @lost_pet = LostPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lost_pet_params
      params.require(:lost_pet).permit(:status, :info, :report_date, :lost_date, :latitude, :longitude, :found_date, :pet_id, :user_id, :district_id)
    end
end



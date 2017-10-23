class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  # GET /pets
  # GET /pets.json
  def index
    @user = User.find(params[:user_id])
    #@pets = @user.pets.all
    @pets = @user.pets.all.where({ state:["A", "P"]})
   
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @user = User.find(params[:user_id])
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @user=current_user
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.state="A"
    respond_to do |format|
      if @pet.save
        format.html { redirect_to user_pet_path(current_user,@pet), notice: 'Pet was successfully created.' }
        format.json { render json: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to user_pet_path(current_user,@pet), notice: 'Pet was successfully updated.' }
        format.json { render json: @pet}
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
  
      
    respond_to do |format|
        
        if @pet.update_attribute(:state ,"D")
          format.html { redirect_to user_pets_url, notice: 'Pet was successfully destroyed.' }
          format.json { head :no_content }
        else
           format.html { redirect_to user_pets_url, notice: 'Error' }
           format.json { render json: @pet.errors, status: :unprocessable_entity }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :sex, :race_id, :age, :vaccinated, :information, :state, :pet_type_id, :user_id ,:photo,:picture)
      
      
      
      
    end
end
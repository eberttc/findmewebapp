class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @lost_pet=LostPet.find(params[:lost_pet_id])
    @comments = @lost_pet.comments.order("created_at DESC")
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @lost_pet=LostPet.find(params[:lost_pet_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @lost_pet=LostPet.find(params[:lost_pet_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to lost_pet_comment_path(@lost_pet,@comment), notice: 'Comment was successfully created.' }
        format.json { render json: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to lost_pet_comment_path(@lost_pet,@comment), notice: 'Comment was successfully updated.' }
        format.json { render json: @comment  }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to lost_pet_comments_path(@lost_pet), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @lost_pet=LostPet.find(params[:lost_pet_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :founded, :lost_pet_id, :user_id)
    end
end

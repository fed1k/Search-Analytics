class AnalsController < ApplicationController
  before_action :set_anal, only: %i[ show edit update destroy ]

  # GET /anals or /anals.json
  def index
    @anals = Anal.where(user_id: params[:user_id]).order('count DESC')
    @uniqAnals = @anals.uniq { |anal| anal.name }
  end

  # GET /anals/1 or /anals/1.json
  def show
  end

  # GET /anals/new
  def new
    @anal = Anal.new
  end

  # GET /anals/1/edit
  def edit
  end

  # POST /anals or /anals.json
  def create
    @anal = Anal.new(anal_params)
    @anal.user_id = params[:user_id]

    respond_to do |format|
      if @anal.save
        format.json { render json: @anal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anals/1 or /anals/1.json
  def update
    respond_to do |format|
      if @anal.update(anal_params)
        format.json { render json: @anal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anals/1 or /anals/1.json
  def destroy
    Anal.where(user_id: params[:user_id]).order('count DESC').destroy_all
    redirect_to "/users/#{params[:user_id]}/articles"
    # respond_to do |format|
    #   format.html { redirect_to user_articles_path(params[:user_id]), notice: "Anal was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  def remove_all
    Anal.where(user_id: params[:user_id]).order('count DESC').delete_all
    flash[:notice] = "You have removed all results!"
    redirect_to user_articles_path(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anal
      @anal = Anal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anal_params
      params.permit(:name, :user_id)
    end
end

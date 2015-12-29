class PlanCategoriesController < ApplicationController
  before_action :set_plan_category, only: [:show, :edit, :update, :destroy]

  # GET /plan_categories
  # GET /plan_categories.json
  def index
    @plan_categories = PlanCategory.all
  end

  # GET /plan_categories/1
  # GET /plan_categories/1.json
  def show
  end

  # GET /plan_categories/new
  def new
    @plan_category = PlanCategory.new
  end

  # GET /plan_categories/1/edit
  def edit
  end

  # POST /plan_categories
  # POST /plan_categories.json
  def create
    @plan_category = PlanCategory.new(plan_category_params)

    respond_to do |format|
      if @plan_category.save
        format.html { redirect_to @plan_category, notice: 'Plan category was successfully created.' }
        format.json { render :show, status: :created, location: @plan_category }
      else
        format.html { render :new }
        format.json { render json: @plan_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_categories/1
  # PATCH/PUT /plan_categories/1.json
  def update
    respond_to do |format|
      if @plan_category.update(plan_category_params)
        format.html { redirect_to @plan_category, notice: 'Plan category was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_category }
      else
        format.html { render :edit }
        format.json { render json: @plan_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_categories/1
  # DELETE /plan_categories/1.json
  def destroy
    @plan_category.destroy
    respond_to do |format|
      format.html { redirect_to plan_categories_url, notice: 'Plan category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_category
      @plan_category = PlanCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_category_params
      params.require(:plan_category).permit(:plan_id, :category_id)
    end
end

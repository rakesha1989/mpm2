class PlanAssignmentsController < ApplicationController
  before_action :set_plan_assignment, only: [:show, :edit, :update, :destroy]

  # GET /plan_assignments
  # GET /plan_assignments.json
  def index
    @plan_assignments = PlanAssignment.all
  end

  # GET /plan_assignments/1
  # GET /plan_assignments/1.json
  def show
  end

  # GET /plan_assignments/new
  def new
    @plan_assignment = PlanAssignment.new
  end

  # GET /plan_assignments/1/edit
  def edit
  end

  # POST /plan_assignments
  # POST /plan_assignments.json
  def create
    @plan_assignment = PlanAssignment.new(plan_assignment_params)

    respond_to do |format|
      if @plan_assignment.save
        format.html { redirect_to @plan_assignment, notice: 'Plan assignment was successfully created.' }
        format.json { render :show, status: :created, location: @plan_assignment }
      else
        format.html { render :new }
        format.json { render json: @plan_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plan_assignments/1
  # PATCH/PUT /plan_assignments/1.json
  def update
    respond_to do |format|
      if @plan_assignment.update(plan_assignment_params)
        format.html { redirect_to @plan_assignment, notice: 'Plan assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan_assignment }
      else
        format.html { render :edit }
        format.json { render json: @plan_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plan_assignments/1
  # DELETE /plan_assignments/1.json
  def destroy
    @plan_assignment.destroy
    respond_to do |format|
      format.html { redirect_to plan_assignments_url, notice: 'Plan assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_assignment
      @plan_assignment = PlanAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_assignment_params
      params.require(:plan_assignment).permit(:plan_id, :assignment_id)
    end
end

class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @plan_assignment=PlanAssignment.new(plan_assignment_params)
    @assignment = Assignment.new(assignment_params)
    @assignment_user=AssignmentUser.new
    @plan = Plan.find(params[:plan_id])
    @plan_assignment.plan_id = @plan.id

    


    respond_to do |format|
      if @assignment.save
        @plan_assignment.assignment_id = @assignment.id
        @assignment_user.assignment_id = @assignment.id
        @plan_assignment.save
        @assignment_user.save
        format.html { redirect_to plan_path(@plan), notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_complete
    @assignment = Assignment.find(params[:assignment_id])
    @assignment.update_attributes(is_completed: true)
    redirect_to :back
  end

  def mark_as_incomplete
    @assignment = Assignment.find(params[:assignment_id])
    @assignment.update_attributes(is_completed: false)
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :due_at, :activity_id, :category_id, :is_completed)
    end
end

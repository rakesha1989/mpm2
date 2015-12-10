class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :find_record, only: [:edit, :show, :update, :destroy]
  load_and_authorize_resource

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = (current_user.role? "director") ? Assignment.all : current_user.assignments
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = (current_user.role? "director") ? Asssignment.find(params[:id]) : current_user.assignments.find(params[:id]) 
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
    @assignment = Assignment.new(assignment_params)
    @plan = Plan.find(params[:plan_id])
    @assignment.plan_id = @plan.id
    respond_to do |format|
      if @assignment.save
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

def completed_assignments

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:name, :due_at, :activity_id, :category_id, :status, :is_completed, user_ids: [])
    end



    def find_record
    begin
    @assignment = Assignment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: "Record Doesn't exist"
  end
end



end

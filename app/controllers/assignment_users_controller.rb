class AssignmentUsersController < ApplicationController
  before_action :set_assignment_user, only: [:show, :edit, :update, :destroy]

  # GET /assignment_users
  # GET /assignment_users.json
  def index
    @assignment_users = AssignmentUser.all
  end

  # GET /assignment_users/1
  # GET /assignment_users/1.json
  def show
  end

  # GET /assignment_users/new
  def new
    @assignment_user = AssignmentUser.new
  end

  # GET /assignment_users/1/edit
  def edit
  end

  # POST /assignment_users
  # POST /assignment_users.json
  def create
    @assignment_user = AssignmentUser.new(assignment_user_params)

    respond_to do |format|
      if @assignment_user.save
        format.html { redirect_to @assignment_user, notice: 'Assignment user was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_user }
      else
        format.html { render :new }
        format.json { render json: @assignment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_users/1
  # PATCH/PUT /assignment_users/1.json
  def update
    respond_to do |format|
      if @assignment_user.update(assignment_user_params)
        format.html { redirect_to @assignment_user, notice: 'Assignment user was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_user }
      else
        format.html { render :edit }
        format.json { render json: @assignment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_users/1
  # DELETE /assignment_users/1.json
  def destroy
    @assignment_user.destroy
    respond_to do |format|
      format.html { redirect_to assignment_users_url, notice: 'Assignment user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_user
      @assignment_user = AssignmentUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_user_params
      params.require(:assignment_user).permit(:assignment_id, :user_id)
    end
end

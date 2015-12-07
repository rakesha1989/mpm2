class MeetingUsersController < ApplicationController
  before_action :set_meeting_user, only: [:show, :edit, :update, :destroy]

  # GET /meeting_users
  # GET /meeting_users.json
  def index
    @meeting_users = MeetingUser.all
  end

  # GET /meeting_users/1
  # GET /meeting_users/1.json
  def show
  end

  # GET /meeting_users/new
  def new
    @meeting_user = MeetingUser.new
  end

  # GET /meeting_users/1/edit
  def edit
  end

  # POST /meeting_users
  # POST /meeting_users.json
  def create
    @meeting_user = MeetingUser.new(meeting_user_params)

    respond_to do |format|
      if @meeting_user.save
        format.html { redirect_to @meeting_user, notice: 'Meeting user was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_user }
      else
        format.html { render :new }
        format.json { render json: @meeting_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_users/1
  # PATCH/PUT /meeting_users/1.json
  def update
    respond_to do |format|
      if @meeting_user.update(meeting_user_params)
        format.html { redirect_to @meeting_user, notice: 'Meeting user was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_user }
      else
        format.html { render :edit }
        format.json { render json: @meeting_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_users/1
  # DELETE /meeting_users/1.json
  def destroy
    @meeting_user.destroy
    respond_to do |format|
      format.html { redirect_to meeting_users_url, notice: 'Meeting user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_user
      @meeting_user = MeetingUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_user_params
      params.require(:meeting_user).permit(:meeting_id, :user_id)
    end
end

class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_action :find_record, only: [:update, ]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = (current_user.role? "director") ? Meeting.all : current_user.meetings
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = (current_user.role? "director") ? Meeting.find(params[:id]) : current_user.meetings.find(params[:id])  
  @meetings = @meeting.plans
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:plan_month, :date, :company_id, :category)
    end

    def find_record
      begin
        @meeting = current_user.meetings.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, notice: "Record Doesn't exist"
      end
    end
end

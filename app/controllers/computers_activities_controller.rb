class ComputersActivitiesController < ApplicationController
  before_action :set_computers_activity, only: [:show, :edit, :update, :destroy]

  # GET /computers_activities
  # GET /computers_activities.json
  def index
    @computers_activities = ComputersActivity.all
  end

  # GET /computers_activities/1
  # GET /computers_activities/1.json
  def show
  end

  # GET /computers_activities/new
  def new
    @computers_activity = ComputersActivity.new
  end

  # GET /computers_activities/1/edit
  def edit
  end

  # POST /computers_activities
  # POST /computers_activities.json
  def create
    @computers_activity = ComputersActivity.new(computers_activity_params)

    respond_to do |format|
      if @computers_activity.save
        format.html { redirect_to @computers_activity, notice: 'Computers activity was successfully created.' }
        format.json { render :show, status: :created, location: @computers_activity }
      else
        format.html { render :new }
        format.json { render json: @computers_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_activities/1
  # PATCH/PUT /computers_activities/1.json
  def update
    respond_to do |format|
      if @computers_activity.update(computers_activity_params)
        format.html { redirect_to @computers_activity, notice: 'Computers activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_activity }
      else
        format.html { render :edit }
        format.json { render json: @computers_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_activities/1
  # DELETE /computers_activities/1.json
  def destroy
    @computers_activity.destroy
    respond_to do |format|
      format.html { redirect_to computers_activities_url, notice: 'Computers activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_activity
      @computers_activity = ComputersActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_activity_params
      params.require(:computers_activity).permit(:name, :description)
    end
end

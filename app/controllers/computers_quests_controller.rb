class ComputersQuestsController < ApplicationController
  before_action :set_computers_quest, only: [:show, :edit, :update, :destroy]

  # GET /computers_quests
  # GET /computers_quests.json
  def index
    @computers_quests = ComputersQuest.all
  end

  # GET /computers_quests/1
  # GET /computers_quests/1.json
  def show
  end

  # GET /computers_quests/new
  def new
    @computers_quest = ComputersQuest.new
  end

  # GET /computers_quests/1/edit
  def edit
  end

  # POST /computers_quests
  # POST /computers_quests.json
  def create
    @computers_quest = ComputersQuest.new(computers_quest_params)

    respond_to do |format|
      if @computers_quest.save
        format.html { redirect_to @computers_quest, notice: 'Computers quest was successfully created.' }
        format.json { render :show, status: :created, location: @computers_quest }
      else
        format.html { render :new }
        format.json { render json: @computers_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_quests/1
  # PATCH/PUT /computers_quests/1.json
  def update
    respond_to do |format|
      if @computers_quest.update(computers_quest_params)
        format.html { redirect_to @computers_quest, notice: 'Computers quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_quest }
      else
        format.html { render :edit }
        format.json { render json: @computers_quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_quests/1
  # DELETE /computers_quests/1.json
  def destroy
    @computers_quest.destroy
    respond_to do |format|
      format.html { redirect_to computers_quests_url, notice: 'Computers quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_quest
      @computers_quest = ComputersQuest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_quest_params
      params.require(:computers_quest).permit(:activityId, :quest, :domain, :createdat, :updatedat)
    end
end

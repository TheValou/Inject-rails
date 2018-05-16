class ComputersQuestsRespsController < ApplicationController
  before_action :set_computers_quests_resp, only: [:show, :edit, :update, :destroy]

  # GET /computers_quests_resps
  # GET /computers_quests_resps.json
  def index
    @computers_quests_resps = ComputersQuestsResp.all
  end

  # GET /computers_quests_resps/1
  # GET /computers_quests_resps/1.json
  def show
  end

  # GET /computers_quests_resps/new
  def new
    @computers_quests_resp = ComputersQuestsResp.new
  end

  # GET /computers_quests_resps/1/edit
  def edit
  end

  # POST /computers_quests_resps
  # POST /computers_quests_resps.json
  def create
    @computers_quests_resp = ComputersQuestsResp.new(computers_quests_resp_params)

    respond_to do |format|
      if @computers_quests_resp.save
        format.html { redirect_to @computers_quests_resp, notice: 'Computers quests resp was successfully created.' }
        format.json { render :show, status: :created, location: @computers_quests_resp }
      else
        format.html { render :new }
        format.json { render json: @computers_quests_resp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_quests_resps/1
  # PATCH/PUT /computers_quests_resps/1.json
  def update
    respond_to do |format|
      if @computers_quests_resp.update(computers_quests_resp_params)
        format.html { redirect_to @computers_quests_resp, notice: 'Computers quests resp was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_quests_resp }
      else
        format.html { render :edit }
        format.json { render json: @computers_quests_resp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_quests_resps/1
  # DELETE /computers_quests_resps/1.json
  def destroy
    @computers_quests_resp.destroy
    respond_to do |format|
      format.html { redirect_to computers_quests_resps_url, notice: 'Computers quests resp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_quests_resp
      @computers_quests_resp = ComputersQuestsResp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_quests_resp_params
      params.require(:computers_quests_resp).permit(:questId, :resp, :indice)
    end
end

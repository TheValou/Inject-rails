class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
  end  

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  # POST /computers.json
  def create
    puts params
    puts "CREEAAATTIIONN"
    @computer = Computer.new(computer_params)

    respond_to do |format|
      if @computer.save

        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    puts params
    aczfég"(hu)
    puts "UUUPPDDAAAATE"
    # respond_to do |format|
    #   if @computer.update(computer_params)
    #     format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @computer }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @computer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    ComputersPrice.where(computer_id: @computer.id).delete_all
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: 'Computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:osid, :keyboardid, :cpuid, :screenId, :gpuid, :activityid, :chipsetid, :picture, :designation, :model, :connector_available, :weight, :length, :width, :height, :memory_size, :memory_type, :memory_max_size, :storage_size, :storage_type, :network, :webcam, :active, :createdat, :updatedat)
    end
  end

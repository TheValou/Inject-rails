class ComputersOsController < ApplicationController
  before_action :set_computers_o, only: [:show, :edit, :update, :destroy]

  # GET /computers_os
  # GET /computers_os.json
  def index
    @computers_os = ComputersO.all
  end

  # GET /computers_os/1
  # GET /computers_os/1.json
  def show
  end

  # GET /computers_os/new
  def new
    @computers_o = ComputersO.new
  end

  # GET /computers_os/1/edit
  def edit
  end

  # POST /computers_os
  # POST /computers_os.json
  def create
    @computers_o = ComputersO.new(computers_o_params)

    respond_to do |format|
      if @computers_o.save
        format.html { redirect_to @computers_o, notice: 'Computers o was successfully created.' }
        format.json { render :show, status: :created, location: @computers_o }
      else
        format.html { render :new }
        format.json { render json: @computers_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_os/1
  # PATCH/PUT /computers_os/1.json
  def update
    respond_to do |format|
      if @computers_o.update(computers_o_params)
        format.html { redirect_to @computers_o, notice: 'Computers o was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_o }
      else
        format.html { render :edit }
        format.json { render json: @computers_o.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_os/1
  # DELETE /computers_os/1.json
  def destroy
    @computers_o.destroy
    respond_to do |format|
      format.html { redirect_to computers_os_url, notice: 'Computers o was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_o
      @computers_o = ComputersO.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_o_params
      params.require(:computers_o).permit(:name, :description)
    end
end

class ComputersCpusController < ApplicationController
  before_action :set_computers_cpu, only: [:show, :edit, :update, :destroy]

  # GET /computers_cpus
  # GET /computers_cpus.json
  def index
    @computers_cpus = ComputersCpu.all
  end

  # GET /computers_cpus/1
  # GET /computers_cpus/1.json
  def show
  end

  # GET /computers_cpus/new
  def new
    @computers_cpu = ComputersCpu.new
  end

  # GET /computers_cpus/1/edit
  def edit
  end

  # POST /computers_cpus
  # POST /computers_cpus.json
  def create
    @computers_cpu = ComputersCpu.new(computers_cpu_params)

    respond_to do |format|
      if @computers_cpu.save
        format.html { redirect_to @computers_cpu, notice: 'Computers cpu was successfully created.' }
        format.json { render :show, status: :created, location: @computers_cpu }
      else
        format.html { render :new }
        format.json { render json: @computers_cpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_cpus/1
  # PATCH/PUT /computers_cpus/1.json
  def update
    respond_to do |format|
      if @computers_cpu.update(computers_cpu_params)
        format.html { redirect_to @computers_cpu, notice: 'Computers cpu was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_cpu }
      else
        format.html { render :edit }
        format.json { render json: @computers_cpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_cpus/1
  # DELETE /computers_cpus/1.json
  def destroy
    @computers_cpu.destroy
    respond_to do |format|
      format.html { redirect_to computers_cpus_url, notice: 'Computers cpu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_cpu
      @computers_cpu = ComputersCpu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_cpu_params
      params.require(:computers_cpu).permit(:name, :description)
    end
end

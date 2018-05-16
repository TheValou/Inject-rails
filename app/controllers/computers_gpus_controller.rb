class ComputersGpusController < ApplicationController
  before_action :set_computers_gpu, only: [:show, :edit, :update, :destroy]

  # GET /computers_gpus
  # GET /computers_gpus.json
  def index
    @computers_gpus = ComputersGpu.all
  end

  # GET /computers_gpus/1
  # GET /computers_gpus/1.json
  def show
  end

  # GET /computers_gpus/new
  def new
    @computers_gpu = ComputersGpu.new
  end

  # GET /computers_gpus/1/edit
  def edit
  end

  # POST /computers_gpus
  # POST /computers_gpus.json
  def create
    @computers_gpu = ComputersGpu.new(computers_gpu_params)

    respond_to do |format|
      if @computers_gpu.save
        format.html { redirect_to @computers_gpu, notice: 'Computers gpu was successfully created.' }
        format.json { render :show, status: :created, location: @computers_gpu }
      else
        format.html { render :new }
        format.json { render json: @computers_gpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_gpus/1
  # PATCH/PUT /computers_gpus/1.json
  def update
    respond_to do |format|
      if @computers_gpu.update(computers_gpu_params)
        format.html { redirect_to @computers_gpu, notice: 'Computers gpu was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_gpu }
      else
        format.html { render :edit }
        format.json { render json: @computers_gpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_gpus/1
  # DELETE /computers_gpus/1.json
  def destroy
    @computers_gpu.destroy
    respond_to do |format|
      format.html { redirect_to computers_gpus_url, notice: 'Computers gpu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_gpu
      @computers_gpu = ComputersGpu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_gpu_params
      params.require(:computers_gpu).permit(:name, :description)
    end
end

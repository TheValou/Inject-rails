class ComputersChipsetsController < ApplicationController
  before_action :set_computers_chipset, only: [:show, :edit, :update, :destroy]

  # GET /computers_chipsets
  # GET /computers_chipsets.json
  def index
    @computers_chipsets = ComputersChipset.all
  end

  # GET /computers_chipsets/1
  # GET /computers_chipsets/1.json
  def show
  end

  # GET /computers_chipsets/new
  def new
    @computers_chipset = ComputersChipset.new
  end

  # GET /computers_chipsets/1/edit
  def edit
  end

  # POST /computers_chipsets
  # POST /computers_chipsets.json
  def create
    @computers_chipset = ComputersChipset.new(computers_chipset_params)

    respond_to do |format|
      if @computers_chipset.save
        format.html { redirect_to @computers_chipset, notice: 'Computers chipset was successfully created.' }
        format.json { render :show, status: :created, location: @computers_chipset }
      else
        format.html { render :new }
        format.json { render json: @computers_chipset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_chipsets/1
  # PATCH/PUT /computers_chipsets/1.json
  def update
    respond_to do |format|
      if @computers_chipset.update(computers_chipset_params)
        format.html { redirect_to @computers_chipset, notice: 'Computers chipset was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_chipset }
      else
        format.html { render :edit }
        format.json { render json: @computers_chipset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_chipsets/1
  # DELETE /computers_chipsets/1.json
  def destroy
    @computers_chipset.destroy
    respond_to do |format|
      format.html { redirect_to computers_chipsets_url, notice: 'Computers chipset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_chipset
      @computers_chipset = ComputersChipset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_chipset_params
      params.require(:computers_chipset).permit(:name, :description)
    end
end

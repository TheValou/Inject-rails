class ComputersBrandsController < ApplicationController
  before_action :set_computers_brand, only: [:show, :edit, :update, :destroy]

  # GET /computers_brands
  # GET /computers_brands.json
  def index
    @computers_brands = ComputersBrand.all
  end

  # GET /computers_brands/1
  # GET /computers_brands/1.json
  def show
  end

  # GET /computers_brands/new
  def new
    @computers_brand = ComputersBrand.new
  end

  # GET /computers_brands/1/edit
  def edit
  end

  # POST /computers_brands
  # POST /computers_brands.json
  def create
    @computers_brand = ComputersBrand.new(computers_brand_params)

    respond_to do |format|
      if @computers_brand.save
        format.html { redirect_to @computers_brand, notice: 'Computers brand was successfully created.' }
        format.json { render :show, status: :created, location: @computers_brand }
      else
        format.html { render :new }
        format.json { render json: @computers_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_brands/1
  # PATCH/PUT /computers_brands/1.json
  def update
    respond_to do |format|
      if @computers_brand.update(computers_brand_params)
        format.html { redirect_to @computers_brand, notice: 'Computers brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_brand }
      else
        format.html { render :edit }
        format.json { render json: @computers_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_brands/1
  # DELETE /computers_brands/1.json
  def destroy
    @computers_brand.destroy
    respond_to do |format|
      format.html { redirect_to computers_brands_url, notice: 'Computers brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_brand
      @computers_brand = ComputersBrand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_brand_params
      params.require(:computers_brand).permit(:name, :description)
    end
end

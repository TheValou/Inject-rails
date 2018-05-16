class ComputersPricesController < ApplicationController
  before_action :set_computers_price, only: [:show, :edit, :update, :destroy]

  # GET /computers_prices
  # GET /computers_prices.json
  def index
    @computers_prices = ComputersPrice.all
  end

  # GET /computers_prices/1
  # GET /computers_prices/1.json
  def show
  end

  # GET /computers_prices/new
  def new
    @computers_price = ComputersPrice.new
  end

  # GET /computers_prices/1/edit
  def edit
  end

  # POST /computers_prices
  # POST /computers_prices.json
  def create
    @computers_price = ComputersPrice.new(computers_price_params)

    respond_to do |format|
      if @computers_price.save
        format.html { redirect_to @computers_price, notice: 'Computers price was successfully created.' }
        format.json { render :show, status: :created, location: @computers_price }
      else
        format.html { render :new }
        format.json { render json: @computers_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_prices/1
  # PATCH/PUT /computers_prices/1.json
  def update
    respond_to do |format|
      if @computers_price.update(computers_price_params)
        format.html { redirect_to @computers_price, notice: 'Computers price was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_price }
      else
        format.html { render :edit }
        format.json { render json: @computers_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_prices/1
  # DELETE /computers_prices/1.json
  def destroy
    @computers_price.destroy
    respond_to do |format|
      format.html { redirect_to computers_prices_url, notice: 'Computers price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_price
      @computers_price = ComputersPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_price_params
      params.require(:computers_price).permit(:computerId, :traderId, :pricing, :url, :createdat)
    end
end

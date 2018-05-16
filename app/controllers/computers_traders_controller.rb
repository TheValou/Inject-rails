class ComputersTradersController < ApplicationController
  before_action :set_computers_trader, only: [:show, :edit, :update, :destroy]

  # GET /computers_traders
  # GET /computers_traders.json
  def index
    @computers_traders = ComputersTrader.all
  end

  # GET /computers_traders/1
  # GET /computers_traders/1.json
  def show
  end

  # GET /computers_traders/new
  def new
    @computers_trader = ComputersTrader.new
  end

  # GET /computers_traders/1/edit
  def edit
  end

  # POST /computers_traders
  # POST /computers_traders.json
  def create
    @computers_trader = ComputersTrader.new(computers_trader_params)

    respond_to do |format|
      if @computers_trader.save
        format.html { redirect_to @computers_trader, notice: 'Computers trader was successfully created.' }
        format.json { render :show, status: :created, location: @computers_trader }
      else
        format.html { render :new }
        format.json { render json: @computers_trader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_traders/1
  # PATCH/PUT /computers_traders/1.json
  def update
    respond_to do |format|
      if @computers_trader.update(computers_trader_params)
        format.html { redirect_to @computers_trader, notice: 'Computers trader was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_trader }
      else
        format.html { render :edit }
        format.json { render json: @computers_trader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_traders/1
  # DELETE /computers_traders/1.json
  def destroy
    @computers_trader.destroy
    respond_to do |format|
      format.html { redirect_to computers_traders_url, notice: 'Computers trader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_trader
      @computers_trader = ComputersTrader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_trader_params
      params.require(:computers_trader).permit(:name, :description)
    end
end

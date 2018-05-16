class ComputersScreensController < ApplicationController
  before_action :set_computers_screen, only: [:show, :edit, :update, :destroy]

  # GET /computers_screens
  # GET /computers_screens.json
  def index
    @computers_screens = ComputersScreen.all
  end

  # GET /computers_screens/1
  # GET /computers_screens/1.json
  def show
  end

  # GET /computers_screens/new
  def new
    @computers_screen = ComputersScreen.new
  end

  # GET /computers_screens/1/edit
  def edit
  end

  # POST /computers_screens
  # POST /computers_screens.json
  def create
    @computers_screen = ComputersScreen.new(computers_screen_params)

    respond_to do |format|
      if @computers_screen.save
        format.html { redirect_to @computers_screen, notice: 'Computers screen was successfully created.' }
        format.json { render :show, status: :created, location: @computers_screen }
      else
        format.html { render :new }
        format.json { render json: @computers_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_screens/1
  # PATCH/PUT /computers_screens/1.json
  def update
    respond_to do |format|
      if @computers_screen.update(computers_screen_params)
        format.html { redirect_to @computers_screen, notice: 'Computers screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_screen }
      else
        format.html { render :edit }
        format.json { render json: @computers_screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_screens/1
  # DELETE /computers_screens/1.json
  def destroy
    @computers_screen.destroy
    respond_to do |format|
      format.html { redirect_to computers_screens_url, notice: 'Computers screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_screen
      @computers_screen = ComputersScreen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_screen_params
      params.require(:computers_screen).permit(:type, :resolution, :size, :refresh_rate, :description)
    end
end

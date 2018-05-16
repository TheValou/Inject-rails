class ComputersKeyboardsController < ApplicationController
  before_action :set_computers_keyboard, only: [:show, :edit, :update, :destroy]

  # GET /computers_keyboards
  # GET /computers_keyboards.json
  def index
    @computers_keyboards = ComputersKeyboard.all
  end

  # GET /computers_keyboards/1
  # GET /computers_keyboards/1.json
  def show
  end

  # GET /computers_keyboards/new
  def new
    @computers_keyboard = ComputersKeyboard.new
  end

  # GET /computers_keyboards/1/edit
  def edit
  end

  # POST /computers_keyboards
  # POST /computers_keyboards.json
  def create
    @computers_keyboard = ComputersKeyboard.new(computers_keyboard_params)

    respond_to do |format|
      if @computers_keyboard.save
        format.html { redirect_to @computers_keyboard, notice: 'Computers keyboard was successfully created.' }
        format.json { render :show, status: :created, location: @computers_keyboard }
      else
        format.html { render :new }
        format.json { render json: @computers_keyboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers_keyboards/1
  # PATCH/PUT /computers_keyboards/1.json
  def update
    respond_to do |format|
      if @computers_keyboard.update(computers_keyboard_params)
        format.html { redirect_to @computers_keyboard, notice: 'Computers keyboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @computers_keyboard }
      else
        format.html { render :edit }
        format.json { render json: @computers_keyboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers_keyboards/1
  # DELETE /computers_keyboards/1.json
  def destroy
    @computers_keyboard.destroy
    respond_to do |format|
      format.html { redirect_to computers_keyboards_url, notice: 'Computers keyboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computers_keyboard
      @computers_keyboard = ComputersKeyboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computers_keyboard_params
      params.require(:computers_keyboard).permit(:name, :description)
    end
end

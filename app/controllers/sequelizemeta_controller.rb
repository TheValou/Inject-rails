class SequelizemetaController < ApplicationController
  before_action :set_sequelizemetum, only: [:show, :edit, :update, :destroy]

  # GET /sequelizemeta
  # GET /sequelizemeta.json
  def index
    @sequelizemeta = Sequelizemetum.all
  end

  # GET /sequelizemeta/1
  # GET /sequelizemeta/1.json
  def show
  end

  # GET /sequelizemeta/new
  def new
    @sequelizemetum = Sequelizemetum.new
  end

  # GET /sequelizemeta/1/edit
  def edit
  end

  # POST /sequelizemeta
  # POST /sequelizemeta.json
  def create
    @sequelizemetum = Sequelizemetum.new(sequelizemetum_params)

    respond_to do |format|
      if @sequelizemetum.save
        format.html { redirect_to @sequelizemetum, notice: 'Sequelizemetum was successfully created.' }
        format.json { render :show, status: :created, location: @sequelizemetum }
      else
        format.html { render :new }
        format.json { render json: @sequelizemetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequelizemeta/1
  # PATCH/PUT /sequelizemeta/1.json
  def update
    respond_to do |format|
      if @sequelizemetum.update(sequelizemetum_params)
        format.html { redirect_to @sequelizemetum, notice: 'Sequelizemetum was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequelizemetum }
      else
        format.html { render :edit }
        format.json { render json: @sequelizemetum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequelizemeta/1
  # DELETE /sequelizemeta/1.json
  def destroy
    @sequelizemetum.destroy
    respond_to do |format|
      format.html { redirect_to sequelizemeta_url, notice: 'Sequelizemetum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequelizemetum
      @sequelizemetum = Sequelizemetum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sequelizemetum_params
      params.require(:sequelizemetum).permit(:active, :active, :activityid, :activityId, :authId, :chipsetid, :computerId, :connector_available, :cpuid, :createdat, :with, :time, :zone, :createdat, :with, :time, :zone, :createdat, :with, :time, :zone, :createdat, :with, :time, :zone, :description, :description, :description, :description, :description, :description, :description, :description, :description, :description, :designation, :domain, :email, :firstname, :gpuid, :height, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :id, :indice, :keyboardid, :lastname, :length, :memory_max_size, :memory_size, :memory_type, :model, :name, :name, :name, :name, :name, :name, :name, :name, :name, :name, :network, :osid, :password, :picture, :pricing, :quest, :questId, :refresh_rate, :resolution, :resp, :roleId, :screenId, :size, :storage_size, :storage_type, :traderId, :type, :updatedat, :with, :time, :zone, :updatedat, :with, :time, :zone, :updatedat, :with, :time, :zone, :url, :webcam, :weight, :width)
    end
end

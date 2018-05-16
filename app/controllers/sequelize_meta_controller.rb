class SequelizeMetaController < ApplicationController
  before_action :set_sequelize_metum, only: [:show, :edit, :update, :destroy]

  # GET /sequelize_meta
  # GET /sequelize_meta.json
  def index
    @sequelize_meta = SequelizeMetum.all
  end

  # GET /sequelize_meta/1
  # GET /sequelize_meta/1.json
  def show
  end

  # GET /sequelize_meta/new
  def new
    @sequelize_metum = SequelizeMetum.new
  end

  # GET /sequelize_meta/1/edit
  def edit
  end

  # POST /sequelize_meta
  # POST /sequelize_meta.json
  def create
    @sequelize_metum = SequelizeMetum.new(sequelize_metum_params)

    respond_to do |format|
      if @sequelize_metum.save
        format.html { redirect_to @sequelize_metum, notice: 'Sequelize metum was successfully created.' }
        format.json { render :show, status: :created, location: @sequelize_metum }
      else
        format.html { render :new }
        format.json { render json: @sequelize_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sequelize_meta/1
  # PATCH/PUT /sequelize_meta/1.json
  def update
    respond_to do |format|
      if @sequelize_metum.update(sequelize_metum_params)
        format.html { redirect_to @sequelize_metum, notice: 'Sequelize metum was successfully updated.' }
        format.json { render :show, status: :ok, location: @sequelize_metum }
      else
        format.html { render :edit }
        format.json { render json: @sequelize_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequelize_meta/1
  # DELETE /sequelize_meta/1.json
  def destroy
    @sequelize_metum.destroy
    respond_to do |format|
      format.html { redirect_to sequelize_meta_url, notice: 'Sequelize metum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sequelize_metum
      @sequelize_metum = SequelizeMetum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sequelize_metum_params
      params.fetch(:sequelize_metum, {})
    end
end

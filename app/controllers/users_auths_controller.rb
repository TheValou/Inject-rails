class UsersAuthsController < ApplicationController
  before_action :set_users_auth, only: [:show, :edit, :update, :destroy]

  # GET /users_auths
  # GET /users_auths.json
  def index
    @users_auths = UsersAuth.all
  end

  # GET /users_auths/1
  # GET /users_auths/1.json
  def show
  end

  # GET /users_auths/new
  def new
    @users_auth = UsersAuth.new
  end

  # GET /users_auths/1/edit
  def edit
  end

  # POST /users_auths
  # POST /users_auths.json
  def create
    @users_auth = UsersAuth.new(users_auth_params)

    respond_to do |format|
      if @users_auth.save
        format.html { redirect_to @users_auth, notice: 'Users auth was successfully created.' }
        format.json { render :show, status: :created, location: @users_auth }
      else
        format.html { render :new }
        format.json { render json: @users_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_auths/1
  # PATCH/PUT /users_auths/1.json
  def update
    respond_to do |format|
      if @users_auth.update(users_auth_params)
        format.html { redirect_to @users_auth, notice: 'Users auth was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_auth }
      else
        format.html { render :edit }
        format.json { render json: @users_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_auths/1
  # DELETE /users_auths/1.json
  def destroy
    @users_auth.destroy
    respond_to do |format|
      format.html { redirect_to users_auths_url, notice: 'Users auth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_auth
      @users_auth = UsersAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_auth_params
      params.require(:users_auth).permit(:name, :description)
    end
end

class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]

  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
  end  

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)
    # @computer.createdat = DateTime.now
    # @computer.updatedat = DateTime.now

    respond_to do |format|
      if @computer.save

        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end







    # if request.format == "application/json"
    #   puts params["Infos_commande"]["Jour"]
    #   puts params["Infos_commande"]["Horaire_livraison"]
    #   new_order = {
    #     "delivery_date" => (params["Infos_commande"]["Jour"]+" "+params["Infos_commande"]["Horaire_livraison"]).to_datetime,
    #     "delivery_hour" => params["Infos_commande"]["Horaire_livraison"].to_datetime, 
    #     "cash" => params["Infos_commande"]["Paiement_espece"] == "Oui" ? true : false,
    #     "delivered" => false,
    #   }

    #   main_client ={
    #     "gender" => params["Acheteur"]["Civilite"] == "Mademoiselle" ? "female" : "male",
    #     "firstname" => params["Acheteur"]["Prenom"],
    #     "lastname" => params["Acheteur"]["Nom"],
    #     "age" => params["Acheteur"]["Age"],
    #     "email" => params["Acheteur"]["Email"]
    #   }

    #   @client = Client.create_with(main_client).find_or_create_by(email: params["Acheteur"]["Email"])
    #   @client.save

    #   @order = Order.new(new_order)
    #   @order.client_id = @client.id

    #   saved =  @order.save

    #   num_com = 0
    #   total_price = 0

    #   params["Details_commande"].each do |x| 
    #     com = "Commande"+num_com.to_s

    #     client = {
    #       "gender" => x[com]["Civilite"] == "Mademoiselle" ? "female" : "male",
    #       "firstname" => x[com]["Prenom"],
    #       "lastname" => x[com]["Nom"],
    #       "age" => x[com]["Age"],
    #     }

    #     _client = Client.create_with(client).find_or_create_by(firstname: client["firstname"], lastname: client["lastname"],age: client["age"])
    #     _client.save

    #     _tarif = Tarif.where(name: x[com]["Tarif"]).first
    #     p "Le tarif : "+x[com]["Tarif"]
    #     p _tarif
    #     _plat = Plat.where(name: x[com]["Repas"]).first

    #     p "La compagnie :"+main_client["email"].match(/\@(.+)\.\w/)[1]
    #     _company = Company.find_or_create_by(name: main_client["email"].match(/\@(.+)\.\w/)[1])

    #     suborder = {
    #       "client_id" => _client.id,
    #       "dessert_id" => _plat.dessert_id,
    #       "company_id" => _company.id,
    #       "entree_id" => _plat.entree_id,
    #       "plat_id" => _plat.id,
    #       "tarif_id" => _tarif.id,
    #       "order_id" => @order.id
    #     }

    #     total_price += _tarif.price

    #     @suborder = Suborder.new(suborder)
    #     @suborder.save

    #     num_com +=1
    #   end

    #   @order.update(price: total_price)

    # else
    #   @order = Order.new(order_params)
    # end

    # respond_to do |format|
    #   if saved
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order}
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end




  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    ComputersPrice.where(computer_id: @computer.id).delete_all
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: 'Computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:osid, :keyboardid, :cpuid, :screenId, :gpuid, :activityid, :chipsetid, :picture, :designation, :model, :connector_available, :weight, :length, :width, :height, :memory_size, :memory_type, :memory_max_size, :storage_size, :storage_type, :network, :webcam, :active, :createdat, :updatedat)
    end
  end

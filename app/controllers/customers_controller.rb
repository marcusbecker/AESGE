class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @address = Address.new
    @address_business = Address.new
    
    @phoneRes = Phone.new
    @phoneCel = Phone.new
    @phoneRec = Phone.new
    @phoneRecCel = Phone.new
    @phoneCom = Phone.new    
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.json { render action: 'show', status: :created, location: @customer }#format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
      @address = @customer.addresses.first || Address.new
      @address_business = @customer.addresses.second || Address.new
      @phones = @customer.phones
      
      @phoneRes = @phones[0] || Phone.new
      @phoneCel = @phones[1] || Phone.new
      @phoneRec = @phones[2] || Phone.new
      @phoneRecCel = @phones[3] || Phone.new
      @phoneCom = @phones[4] || Phone.new
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :fname, :mname, :country, :city, :uf, :birth, :email, :annotation, :schooling, :civil_status, :cpf, :rg)
    end
end

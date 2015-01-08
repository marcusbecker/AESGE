class CustomerAddressesController < ApplicationController
  before_action :set_customer, only: [:create, :edit]
  
  def create
    @address = Address.new(address_params)
    @customer_address = CustomerAddress.new(:customer => @customer, :address => @address)
    @customer_address.commercial = params[:commercial]
    
    respond_to do |format|
      if @customer_address.save
        format.json { render :json => @address.to_json }#{ head :no_content }
      else
        format.json { head :no_content }
      end
    end
  end  
  
  def edit
    #@address = Address.find(params[:id])
    @address = CustomerAddress.where("customer_id = ? AND address_id = ?", @customer.id, params[:id]).first.address
    
    respond_to do |format|
      if @address.update(address_params)
        format.json { render :json => @address.to_json }#{ head :no_content }
      else
        format.json { head :no_content }
      end
    end
  end
  
    def set_customer
      @customer = Customer.find(params[:id_customer])
    end
      
  def address_params
    params.require(:address).permit(:zip_code, :type_address, :address, :number, :complement, :neighborhood, :city, :state, :note)
  end   
end

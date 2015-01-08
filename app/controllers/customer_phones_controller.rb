class CustomerPhonesController < ApplicationController
  #before_action :set_customer_phone, only: [:edit, :update, :destroy]

  # GET /customer_phone/new
  def new
    respond_to do |format|
        format.json { head :no_content }
    end    
  end

  # GET /customer_phone/1/edit
  def edit
  end

  # POST /customer_phone
  # POST /customer_phone.json
  def create
    @customer = Customer.find(params[:customer_id])
    @phone = @customer.phones.build(phone_params)   
    @cPhone = @customer.customer_phones.build
  
    @cPhone.phone = @phone

    respond_to do |format|
      if @cPhone.save
          format.json { head :no_content }
      else
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_phone/1
  # PATCH/PUT /customer_phone/1.json
  def update
    
    @cPhone = CustomerPhone.where('customer_id=? and phone_id=?', params[:customer_id], phone_params[:id]).first   
    @phone = @cPhone.phone
        
    respond_to do |format|
      if @phone.update(phone_params)
          format.json { head :no_content }
      else
          format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_phone/1
  # DELETE /customer_phone/1.json
  def destroy
    #@phone.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:id, :code, :number, :description)
    end
end

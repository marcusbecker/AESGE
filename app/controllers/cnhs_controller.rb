class CnhsController < ApplicationController
  before_action :set_cnh, only: [:show, :edit, :update, :destroy]

  # GET /cnhs
  # GET /cnhs.json
  def index
    @customer = Customer.find(params[:customer_id])
    @cnhs = @customer.cnhs
  end

  # GET /cnhs/1
  # GET /cnhs/1.json
  def show
  end

  # GET /cnhs/new
  def new
    @customer = Customer.find(params[:customer_id])
    @cnh = @customer.cnhs.build
  end

  # GET /cnhs/1/edit
  def edit
  end

  # POST /cnhs
  # POST /cnhs.json
  def create
    @customer = Customer.find(params[:customer_id])
    @cnh = @customer.cnhs.build(cnh_params)
    @photo = Photo.new
    
    uploaded_io = params[:cnh][:file]
    if uploaded_io.present?
      unless File.directory?('public/uploads')
        FileUtils::mkdir_p 'public/uploads'
      end      
      
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        @photo.path = uploaded_io.original_filename
        @cnh.photo = @photo
      end        
    end

    respond_to do |format|
      if @cnh.save
        format.html { redirect_to [@customer, @cnh], notice: 'Cnh was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cnh }
      else
        format.html { render action: 'new' }
        format.json { render json: @cnh.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cnhs/1
  # PATCH/PUT /cnhs/1.json
  def update
    
    uploaded_io = params[:cnh][:file]
    if uploaded_io.present?
      
      unless File.directory?('public/uploads')
        FileUtils::mkdir_p 'public/uploads'
      end      
      
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      
        if @cnh.photo.present?
          @cnh.photo.destroy
        end
        
        @photo = Photo.new
        @photo.path = uploaded_io.original_filename
        @cnh.photo = @photo
      end        
    end    
    
    respond_to do |format|
      if @cnh.update(cnh_params)
        format.html { redirect_to [@customer, @cnh], notice: 'Cnh was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cnh.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cnhs/1
  # DELETE /cnhs/1.json
  def destroy
    @cnh.destroy
    respond_to do |format|
      format.html { redirect_to customer_cnhs_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cnh
      @customer = Customer.find(params[:customer_id])
      @cnh = Cnh.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cnh_params
      params.require(:cnh).permit(:category, :registration, :first, :validity, :customer_id, :first_registration)
    end
end

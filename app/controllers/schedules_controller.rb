class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedule = Schedule.new
    
    if params[:date_init].nil?
      @schedule.date_init = Date.today 
    else
      @schedule.date_init = DateTime.parse(params[:date_init], "%d/%m/%Y").to_date
    end
    
    @schedule.date_end = @schedule.date_init + Schedule::Week_interval
    
    #@schedules = Schedule.where(date: @schedule.date_init..@schedule.date_end).includes("customer").order("customers.name")
    @schedules = Schedule.where(date: @schedule.date_init..@schedule.date_end).includes("vehicle").order("vehicles.show_order")
    
    @vehicles = Vehicle.by_order.where("active = ?", true)
    @customers = Customer.all
    @instructors = Instructor.where("active = ?", true)
    
  end
  
  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:event, :date, :time, :vehicle_id, :instructor_id, :customer_id, :date_init)
    end
end

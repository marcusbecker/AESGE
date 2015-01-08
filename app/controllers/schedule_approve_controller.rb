class ScheduleApproveController < ApplicationController
  before_action :set_schedule, only: [:approve, :reprove]
  # GET /schedule_approve
  # GET /schedule_approve.json
  def index
    @schedule = Schedule.new

    if params[:date_init].nil?
      @schedule.date_init = Date.today
    else
      @schedule.date_init = DateTime.parse(params[:date_init], "%d/%m/%Y").to_date
    end

    if @schedule.date_init > Date.today
      @schedule.date_init = Date.today
    end

    @schedules = Schedule.where(date: @schedule.date_init).order("date")
    #@schedules = Schedule.order("date")
  end

  def approve

    respond_to do |format|
      if @schedule.update(complete: true)
        format.json { head :no_content }#{ render :json => @schedule.to_json }
        format.html { redirect_to @schedule }
      else
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
        format.html { redirect_to @schedule }
      end
    end
  end

  def reprove
    @schedule.update(complete: false, description: params[:description])
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to action: :index, status: :moved_permanently }
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:id, :date_init, :description)
  end
end

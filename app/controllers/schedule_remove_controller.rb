class ScheduleRemoveController < ApplicationController
  def remove
    #@schedule = Schedule.where("date = ? AND time = ? AND vehicles_id = ?", params[:date], params[:time], params[:vehicles_id]).first
    @schedule = Schedule.new.findVehicleAndFilterByTime(params[:date], params[:vehicle_id], params[:time])
    if @schedule.present? 
      @schedule.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end
end

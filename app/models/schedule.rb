class ScheduleValidator < ActiveModel::Validator
  def validate(record)
    unless record.times.include? record.time.strftime("%H:%M")
      record.errors[:event] << 'Horário inválido.'
    end
  end
end

class VehicleValidator < ActiveModel::Validator
  def validate(record)
    return if record.id.present? || record.errors.any?
      
    if record.findVehicleAndFilterByTime(record.date, record.vehicle_id, record.time).present?
      record.errors[:event] << 'Já existe um veículo cadastrado para a data e hora selecionadas.'
    end
  end
end

class CustomerValidator < ActiveModel::Validator
  def validate(record)
    return if record.id.present? || record.errors.any?
    
    schedules = Schedule.where('date = ? and customer_id = ?', record.date, record.customer_id)
    
    if schedules.size >= Schedule::Max_classes_day
      record.errors[:event] << 'Limite de aulas atigindas para este aluno.'
    elsif schedules.any?{|s| s.time == record.time}
      record.errors[:event] << 'Já existe um aluno cadastrado para a data e hora selecionadas.'
    end
  end
end

class Schedule < ActiveRecord::Base
  Week_interval = 6
  Max_classes_day = 3
  
  attr_accessor :date_init, :date_end
  
  validates_presence_of :event, :date, :time, :vehicle_id, :instructor_id, :customer_id
  validates_with ScheduleValidator, VehicleValidator, CustomerValidator
  
  def times
    ['07:10', '08:00', '08:50', '09:40', '10:30', '11:20', '12:10', '13:00', '13:50', '14:40', '15:30', '16:20', '17:10', '18:00', '18:50', '19:40', '20:30', '21:20']
  end
  
  def findVehicleAndFilterByTime(date, vehicle_id, time)
    schedules = Schedule.where('date = ? and vehicle_id = ?', date, vehicle_id)
    schedules.each do |s|
      #return s if s.time.strftime("%H:%M") == time
      return s if s.time == time
    end
    return nil
  end

  #def week_interval 5 end
 
  #@schedule.date_init.strftime("%d/%m/%Y")
  belongs_to :vehicle
  belongs_to :instructor
  belongs_to :customer
end

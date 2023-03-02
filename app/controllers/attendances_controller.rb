class AttendancesController < ApplicationController
  # def new
  #   @attendance = Attendance.new
  # end

  def create
    event = Event.find(params[:event_id])
    attendance = current_user.attendances.build(attended_event: event)

    if attendance.save
      redirect_to event, notice: "You've successfully registered for this event."
    end
  end
end

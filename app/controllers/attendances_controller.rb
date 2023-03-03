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

  def destroy
    event = Event.find(params[:event_id])
    attendance = Attendance.where("attended_event_id = ? AND attendee_id = ? ",
                                  event.id,
                                  current_user.id
                                  ).first
    attendance.destroy
    redirect_to event, status: :see_other
  end
end

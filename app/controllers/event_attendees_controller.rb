class EventAttendeesController < ApplicationController
  def attend
    @event = Event.find_by_id(params[:id])
    current_user.attend_event(@event)
    redirect_to @event, notice: 'Your attendance for the event has been captured.'
  end

  def ignore
    @event = Event.find_by_id(params[:id])
    current_user.ignore_event(@event)
    redirect_to root_path, alert: 'Your attendance for the event has been removed.'
  end
end

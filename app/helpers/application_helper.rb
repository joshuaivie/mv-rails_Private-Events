module ApplicationHelper
  def show_events(events, options)
    if events.length.zero?
      render 'shared/no_event'
    else
      render 'shared/events', events: events, event_state: options['event_state'], event_type: options['event_type']
    end
  end
end

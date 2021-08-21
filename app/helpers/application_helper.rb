module ApplicationHelper
  def show_events(events, options)
    if events.length.zero?
      render 'shared/no_event'
    else
      render 'shared/events', events: events, event_state: options[:event_state],
                              display_type: options[:display_type], profile: options[:profile]
    end
  end
end

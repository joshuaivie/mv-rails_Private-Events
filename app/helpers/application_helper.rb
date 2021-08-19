module ApplicationHelper
  def show_events(events, options)
    if events.length.zero?
      render 'shared/no_event'
    else
      out = ''
      events.each do |event|
        out += '<'
        out += if options[:display_type] == 'single'
                 'div'
               else
                 'li'
               end
        out += " class='event-item"

        if options[:display_type] == 'list'
          out += ' list'
          out += ' greyscale-event' if options[:event_state].downcase == 'past_event'
        end
        out += "'>"
        out += "<div class='event-date-container'>"
        out += "<div class='event-date'>"
        out += "<div class='event-month'>"
        out += event.date.strftime('%b').to_s
        out += '</div>'
        out += "<div class='event-day'>"
        out += event.date.strftime('%-d').to_s
        out += '</div>'
        out += '</div>'
        out += '</div>'
        out += "<div class='event-content'>"
        out += "<div class='event-title mb-3"
        out += if options[:profile]
                 " smaller-text'>"
               else
                 "'>"
               end
        out += event.title.to_s
        out += '</div>'
        out += "<div class='event-details d-flex flex-wrap'>"
        out += "<div class='event-location me-3 mb-2'><i class='fas fa-location-arrow fa-fw'></i>#{event.location}</div>"
        out += "<div class='event-time me-3 mb-2'><i class='fas fa-clock fa-fw'></i>#{event.date.strftime('%A %l:%M %p')}</div>"
        out += "<div class='event-organizer me-3 mb-2'><i class='fas fa-user-circle fa-fw'></i>Oraganizer: #{event.creator.fullname}</div>"
        out += '</div>'
        out += "<div class='event-description'>"
        out += event.description.to_s
        out += '</div>'
        out += "<div class='event-buttons'>"
        if (options[:event_state].downcase == 'upcoming_event' || options[:display_type] == 'single') && user_signed_in? && current_user.id != event.creator.id
          if current_user.attending_event?(event)
            out += link_to 'Ignore', ignore_event_path(id: event.id), method: :delete,
                                                                      data: { message: 'Are you sure you want to miss this event?' }, class: 'btn btn-sm btn-danger more-info me-2'.to_s
          else
            out += link_to 'Attend', attend_event_path(id: event.id), method: :post,
                                                                      class: 'btn btn-sm btn-success more-info me-2'.to_s
          end
        end
        if user_signed_in? && current_user.id == event.creator.id && event.date > Date.today
          out += link_to 'Edit', edit_event_path(event), class: 'btn btn-sm btn-primary more-info me-2'.to_s
          out += link_to 'Cancel', event_path(event),
                         data: { message: 'Are you sure you want to cancel this event?' }, method: :delete, class: 'btn btn-sm btn-danger more-info me-2'.to_s
        end
        if options[:display_type] == 'list'
          out += link_to 'View', event, class: 'btn btn-sm btn-primary more-info me-2'.to_s
        end
        out += '</div>'
        out += '</div>'
        out += '<'
        out += if options[:display_type] == 'single'
                 '/div>'
               else
                 '/li>'
               end
      end
      out.html_safe
    end
  end
end

module EventsHelper
  def show_events(events, options)
    out = ""
    events.each do |event|
      out += "<"
      if options[:display_type] == "single"
        out += "div"
      else
        out += "li"
      end
      out += " class='event-item"

      if options[:display_type] == "list"
        out += " list"
        if options[:event_state].downcase == "past_event"
          out += " greyscale-event"
        end
      end
      out += "'>"
      out += "<div class='event-date-container'>"
      out += "<div class='event-date'>"
      out += "<div class='event-month'>"
      out += "#{event.date.strftime("%b")}"
      out += "</div>"
      out += "<div class='event-day'>"
      out += "#{event.date.strftime("%-d")}"
      out += "</div>"
      out += "</div>"
      out += "</div>"
      out += "<div class='event-content'>"
      out += "<div class='event-title mb-3'>"
      out += "#{event.title}"
      out += "</div>"
      out += "<div class='event-details d-flex'>"
      out += "<div class='event-location me-3'><i class='fas fa-location-arrow fa-fw'></i>#{event.location}</div>"
      out += "<div class='event-time me-3'><i class='fas fa-clock fa-fw'></i>#{event.date.strftime("%A %l:%M %p")}</div>"
      out += "<div class='event-organizer me-3'><i class='fas fa-user-circle fa-fw'></i>Oraganizer: #{event.creator.fullname}</div>"
      out += "</div>"
      out += "<div class='event-description'>"
      out += "#{event.description}"
      out += "</div>"
      out += "<div class='event-buttons'>"
      if options[:event_state].downcase == "upcoming_event" && user_signed_in? && current_user.id != event.creator.id
        if current_user.attending_event?(event)
          out += "#{link_to "Ignore", ignore_event_path(id: event.id), method: :delete, data: { message: "Are you sure you want to miss this event?" }, class: "btn btn-sm btn-danger more-info me-2"}"
        else
          out += "#{link_to "Attend", attend_event_path(id: event.id), method: :post, class: "btn btn-sm btn-success more-info me-2"}"
        end
      end
      if user_signed_in? && current_user.id == event.creator.id && event.date > Date.today
        out += "#{link_to "Edit", edit_event_path(event), class: "btn btn-sm btn-primary more-info me-2"}"
        out += "#{link_to "Cancel", event_path(event), data: { message: "Are you sure you want to cancel this event?" }, method: :delete, class: "btn btn-sm btn-danger more-info me-2"}"
      end
      if options[:display_type] == "list"
        out += "#{link_to "View", event, class: "btn btn-sm btn-primary more-info me-2"}"
      end
      out += "</div>"
      out += "</div>"
      out += "</@li>"
    end
    out.html_safe
  end
end

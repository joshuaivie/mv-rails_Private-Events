module EventsHelper
  def show_events(events)
    out = ""
    events.each do |event|
      out += "<li class='event-list-item'>"
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
      out += "<div class='btn btn-sm btn-primary register me-2'>Attend</div>"
      out += "<div class='btn btn-sm btn-primary cancel me-2'>Cancel Registration</div>"
      out += "#{link_to "More Information", event, class: "btn btn-sm btn-primary more-info me-2"}"
      out += "</div>"
      out += "</div>"
      out += "</li>"
    end
    out.html_safe
  end
end

module Mc::Locker::LockersHelper

  def convert_status_to_class(status)
    case status
      when 'vacant'
        'info'
      when 'occupied'
        'warning'
      when 'faulty'
        'alert'
      when 'closed'
        'secondary'
      else
        'secondary'
    end
  end

  def get_status_count(lockers, status)
    lockers.select{|locker| locker.status === status }.count
  end

end

#--
#  This file is one part of:
#  Rubygame -- Ruby code and bindings to SDL to facilitate game creation
# 
#  Copyright (C) 2008  John Croisant
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#++


module Rubygame

  # The Events module contains classes representing various
  # hardware events (e.g. keyboard presses, mouse clicks)
  # and software events (e.g. clock tick, window becomes active)
  # 
  # This event classes are meant as a full replacement for
  # the older event classes defined in the Rubygame module 
  # (e.g. KeyDownEvent, QuitEvent). The old classes are
  # deprecated and should not be used anymore.
  # 
  module Events
  end

end


# Load all the ruby files in events/
glob = File.join( File.dirname(__FILE__), "events", "*.rb" )
Dir.glob( glob ).each do |path|
  require path
end

require 'active_support/concern'

# Make flash messages available as shared data
#
module InertiaFlash
  extend ActiveSupport::Concern

  included do
    inertia_share do
      {
        has_flash: !flash.empty?,
        flash: flash.to_hash
      }
    end
  end
end
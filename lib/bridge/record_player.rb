# frozen_string_literal: true

require_relative "device"
require_relative "slider_adjustable"
class RecordPlayer < Device
  include SliderAdjustable
end

# frozen_string_literal: true

module TriMultiLevelAdjustable
  def adjust_output_low_level
    raise NotImplementedError
  end

  def adjust_output_medium_level
    raise NotImplementedError
  end

  def adjust_output_high_level
    raise NotImplementedError
  end
end

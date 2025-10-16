# frozen_string_literal: true

module SliderAdjustable
  def slider_down(by:)
    @output_level -= by
  end

  def slider_up(by:)
    @output_level += by
  end
end

# frozen_string_literal: true

require_relative "sushi_platter"
class NigiriSushiPlatter < SushiPlatter
  def initialize
    super
    @selection = %i[maguro salmon]
  end
end

# frozen_string_literal: true

require_relative "sushi_platter"
class MakiSushiPlatter < SushiPlatter
  def initialize
    super
    @selection = %i[tekka_maki kappa_maki]
  end
end

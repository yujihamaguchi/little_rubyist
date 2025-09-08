# frozen_string_literal: true

require_relative "sushi_store"
require_relative "maki_sushi_platter"
class MakiSushiStore
  include SushiStore

  def create_sushi_platter
    MakiSushiPlatter.new
  end
end

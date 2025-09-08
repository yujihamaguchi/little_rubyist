# frozen_string_literal: true

require_relative "sushi_store"
require_relative "nigiri_sushi_platter"
class NigiriSushiStore
  include SushiStore
  def create_sushi_platter
    NigiriSushiPlatter.new
  end
end

# frozen_string_literal: true

module SushiStore
  def order
    platter = create_sushi_platter
    platter.plate.pack
  end

  def create_sushi_platter
    raise NotImplementedError
  end
end

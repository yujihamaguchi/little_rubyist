# frozen_string_literal: true

module RoleBasedRequestable
  def request(role:)
    raise NotImplementedError
  end
end

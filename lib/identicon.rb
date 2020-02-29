# frozen_string_literal: true

# :nodoc:
class Identicon
  attr_reader :username, :path

  def initialize(username, path)
    @username = username
    @path = path
  end
end

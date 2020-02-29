# frozen_string_literal: true

require_relative './identicon/hash.rb'
require_relative './identicon/image.rb'

# :nodoc:
class Identicon
  include Identicon::Hash
  include Identicon::Image

  attr_reader :username, :path

  def initialize(username, path)
    @username = username
    @path = path
  end

  def generate
    generate_image(digest)
  end
end

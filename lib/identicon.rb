# frozen_string_literal: true

require_relative './identicon/hash.rb'

# :nodoc:
class Identicon
  include Identicon::Hash

  attr_reader :username, :path

  def initialize(username, path)
    @username = username
    @path = path
  end

  def generate
    digest(@username)
  end
end

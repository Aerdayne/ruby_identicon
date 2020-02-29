# frozen_string_literal: true

require 'digest'

class Identicon
  module Hash
    def digest
      @hash = Digest::MD5.hexdigest(username).scan(/.{2}/)
      map
    end

    private

    def map
      map = {}
      @hash[0..-2].each_with_index do |hex_pair, index|
        map[index / 5] ||= []
        map[index / 5][index % 5] = calculate(hex_pair)
      end
      map[3] = map[1]
      map[4] = map[0]
      digested_hash(map)
    end

    def digested_hash(map)
      {
        red: @hash[-1].to_i(16),
        green: @hash[0].to_i(16),
        blue: @hash[8].to_i(16),
        map: map
      }
    end

    def calculate(hex_pair)
      (hex_pair[0].to_i(16) ^ hex_pair[1].to_i(16)).to_s(2).bytes[-1].odd? ? 1 : 0
    end
  end
end

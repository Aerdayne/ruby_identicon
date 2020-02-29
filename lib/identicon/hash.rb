require 'digest'

class Identicon
  module Hash
    def digest
      parse_binary(Digest::MD5
                     .hexdigest(username)
                     .scan(/.{2}/)
                     .map { |h| h.unpack('b8') }
                     .flatten)
    end

    private

    def parse_binary(bytes)
      {
        byte_red: bytes[0],
        byte_green: bytes[1],
        byte_blue: bytes[2],
        byte_map: bytes[3..15]
      }
    end
  end
end

require 'digest'

class Identicon
  module Hash
    def digest
      Digest::MD5.hexdigest(username)
    end
  end
end

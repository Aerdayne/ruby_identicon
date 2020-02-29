require 'chunky_png'

class Identicon
  module Image
    PIXEL_RATIO = 21
    PIXEL_BORDER = 14
    PIXEL_OFFSET = 10

    attr_reader :icon, :image, :hash

    def generate_image(hash)
      @hash = hash
      @icon = ChunkyPNG::Image.new(128 - PIXEL_BORDER,
                                   128 - PIXEL_BORDER,
                                   ChunkyPNG::Color.rgb(255, 255, 255))
      @image = ChunkyPNG::Image.new(128,
                                    128,
                                    ChunkyPNG::Color.rgb(255, 255, 255))
      build_icon(hash)
      @image.compose!(@icon, PIXEL_OFFSET, PIXEL_OFFSET)
      @image.save(path)
    end

    private

    def build_icon(hash)
      map(hash).each_key do |col_id|
        col_values = @map[col_id]
        col_values.each_with_index do |value, line_id|
          next if value.zero?

          draw_rect(col_id, line_id)
        end
      end
    end

    def draw_rect(col_id, line_id)
      @icon.rect(
        col_id.to_i * PIXEL_RATIO,
        line_id * PIXEL_RATIO,
        (col_id.to_i + 1) * PIXEL_RATIO,
        (line_id + 1) * PIXEL_RATIO,
        ChunkyPNG::Color::TRANSPARENT,
        color(hash)
      )
    end

    def color(hash)
      @color ||= ChunkyPNG::Color.rgb(hash[:byte_red].to_i(2), 
                                      hash[:byte_green].to_i(2), 
                                      hash[:byte_blue].to_i(2))
    end

    def map(hash)
      array = hash[:bit_array].scan(/.{6}/)[0..14].map do |s|
        s.to_i(2).even? ? 1 : 0
      end
      @map = {
        '0' => array[0..4],
        '1' => array[5..9],
        '2' => array[10..14],
        '3' => array[5..9],
        '4' => array[0..4]
      }
    end
  end
end

require 'chunky_png'

class Identicon
  module Image
    PIXEL_RATIO = 21
    PIXEL_BORDER = 14
    PIXEL_OFFSET = 10

    def generate_image(data)
      @data = data
      @icon = ChunkyPNG::Image.new(128 - PIXEL_BORDER,
                                   128 - PIXEL_BORDER,
                                   ChunkyPNG::Color.rgb(255, 255, 255))
      @image = ChunkyPNG::Image.new(128,
                                    128,
                                    ChunkyPNG::Color.rgb(255, 255, 255))
      build_icon
      @image.compose!(@icon, PIXEL_OFFSET, PIXEL_OFFSET)
      @image.save(path)
    end

    private

    def build_icon
      @data[:map].each_key do |col_id|
        col_values = @data[:map][col_id]
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
        color
      )
    end

    def color
      ChunkyPNG::Color.rgb(@data[:red],
                           @data[:green],
                           @data[:blue])
    end
  end
end

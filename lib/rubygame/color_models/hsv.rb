require 'rubygame/color_models/base'
require 'rubygame/color_models/rgb'

module Rubygame
	module Color

		# Represents color in the HSV (Hue, Saturation, Value) color space.
		class ColorHSV
			include ColorBase

			attr_reader :h, :s, :v, :a

			# call-seq:
			#   new( [h,s,v,a] )  ->  ColorHSV
			#   new( [h,s,v] )  ->  ColorHSV
			#   new( color )  ->  ColorHSV
			# 
			# Create a new instance from an Array or an existing color
			# (of any type). If the alpha (opacity) component is omitted
			# from the array, full opacity will be used.
			# 
			# h, s, v, a values are expected to range from 0.0 to 1.0.
			# 
			def initialize( color )
				if color.kind_of?(Array)
					@h, @s, @v, @a = color.collect { |i| i.to_f }
					@a = 1.0 unless @a
				elsif color.respond_to?(:to_rgba_ary)
					@h, @s, @v, @a = self.class.rgba_to_hsva( *color.to_rgba_ary )
				end
			end
			
			# Return an Array with the red, green, blue, and alpha components
			# of the color (converting the color to the RGBA model first).
			def to_rgba_ary
				return self.class.hsva_to_rgba( @h, @s, @v, @a )
			end
			
			class << self
				
				def new_from_rgba( rgba )
					new( rgba_to_hsva(*rgba) )
				end
				
				# Convert the red, green, blue, and alpha to the
				# equivalent hue, saturation, value, and alpha.
				def rgba_to_hsva( r, g, b, a ) # :nodoc:
					rgb_arr = [r, g, b]
					max     = rgb_arr.max
					min     = rgb_arr.min

					# Calculate hue.
					if min == max 
						h = 0 
						# Undefined in this case, but set it to zero
					elsif max == r and g >= b
						h = (1.quo(6) * (g - b) / (max - min)) + 0
					elsif max == r and g < b
						h = (1.quo(6) * (g - b) / (max - min)) + 1.0
					elsif max == g
						h = (1.quo(6) * (b - r) / (max - min)) + 1.quo(3)
					elsif max == b
						h = (1.quo(6) * (r - g) / (max - min)) + 2.quo(3)
					else 
						raise "Should never happen"
					end

					# Calulate value.
					v = max

					# Calculate saturation.
					if max == 0.0
						s = 0.0
					else
						s = 1.0 - (min / max)
					end  
					
					return [h,s,v,a]
				end

				# Convert the hue, saturation, value, and alpha
				# to the equivalent red, green, blue, and alpha.
				def hsva_to_rgba( h, s, v, a ) # :nodoc:
					# Determine what part of the "color hexagon" the hue is in.
					hi = (h * 6).floor % 6

					# Fractional part
					f  = (h * 6) - hi

					# Helper values
					p  = v * (1.0 - s)
					q  = v * (1.0 - (f * s))
					t  = v * (1.0 - ((1.0 - f) * s))

					# Finally calculate the rgb values
					r, g, b = calculate_rgb(hi, v, p, t, q)

					return [r, g, b, a]
				end

				private
				
				def calculate_rgb(hi, v, p, t, q) # :nodoc:
					case hi
					when 0
						return v, t, p
					when 1
						return q, v, p
					when 2
						return p, v, t
					when 3
						return p, q, v
					when 4
						return t, p, v
					when 5
						return v, p, q
					end
				end
			end
		end
	end
end

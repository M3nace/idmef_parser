require 'prawn'

class IDMEFPDF
    def initialize(top, class_name, graph, pdf_name)
        Prawn::Document.generate(pdf_name, page_layout: :landscape) do
            # Header is just the class name
            stroke_horizontal_rule
            class_name = class_name.split('/')[-1]
            pad(10) { font_size(15) { text "#{top} : #{class_name}", align: :center } }
            move_down 5
            # Insert image
            image graph, position: :center, vposition: :center, width: 600
            # Footer
            bounding_box [bounds.left, bounds.bottom + 15], :width => bounds.width do
                text "www.secef.net", :size => 15
            end
        end
    end
end

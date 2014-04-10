require 'nokogiri'

class OSMFile
  def open(input_file_path)
    input_file = File.open(input_file_path)
    @input_doc = Nokogiri::XML(input_file)
    input_file.close
  end

  def sorted_nodes(tagname)
    unsorted_nodes = @input_doc.xpath("//#{tagname}")
    unsorted_nodes.sort_by do |node|
      node.attr("id").to_i
    end
  end

  def fix_and_save(output_file_path)
    output_doc = Nokogiri::XML::Document.new
    osm_element = output_doc.add_child("<osm></osm>")

    sorted_nodes("node").each do |node|
      osm_element.add_child(node)
    end

    sorted_nodes("way").each do |node|
      osm_element.add_child(node)
    end

    sorted_nodes("relation").each do |node|
      osm_element.add_child(node)
    end

    output_file = File.open(output_file_path, 'w')
    output_file.puts output_doc.to_s
    output_file.close
  end
end

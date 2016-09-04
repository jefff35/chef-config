require 'test_helper'

module ChefJson
	class AttributesTest < Minitest::Test

		def test_it_retrun_empty_hash_when_no_attributes
			attribute = Attributes.parse("# this is a comment")
			assert attribute.empty?
			assert_equal Hash, attribute.class
		end

		def test_it_return_empty_hash_when_attribute_is_commented_out
			attribute = Attributes.parse("# default['postgresql']['version'] = '9.5'")
			assert attribute.empty?
		end

		def test_it_can_parse_attributes_on_one_line
			attribute = Attributes.parse("default['postgresql']['version'] = '9.5'")
			refute attribute.empty?
			assert_equal "['postgresql']['version']", attribute[:param]
			assert_equal "'9.5'", attribute[:value]
		end

		def test_it_can_parse_attributes_on_one_line_with_comment_at_the_end
			attribute = Attributes.parse("default['postgresql']['version'] = '9.5' # this is a comment")
			assert_equal "'9.5'", attribute[:value]
		end

		def test_it_can_parse_attributes_on_one_line_with_node_param
			attribute = Attributes.parse("default['postgresql']['version'] = node['version']")
			assert_equal "node['version']", attribute[:value]
		end

	end
end

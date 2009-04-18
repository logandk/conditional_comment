require 'test/unit'
require 'conditional_comment'

class ConditionalCommentTest < Test::Unit::TestCase
  
  include ConditionalCommentHelper
  
  def test_empty
    assert_equal "<!--[if IE]>testing<![endif]-->", conditional_comment { "testing" }
  end
  
  def test_version_only
    assert_equal "<!--[if IE 6]>testing<![endif]-->", conditional_comment(:version => 6) { "testing" }
  end
  
  def test_less_than
    assert_equal "<!--[if lt IE 7]>testing<![endif]-->", conditional_comment(:version => "less than 7") { "testing" }
  end
  
  def test_greater_than
    assert_equal "<!--[if gt IE 5]>testing<![endif]-->", conditional_comment(:version => "greater than 5") { "testing" }
  end
  
  def test_less_than_or_equal_to
    assert_equal "<!--[if lte IE 7]>testing<![endif]-->", conditional_comment(:version => "less than or equal to 7") { "testing" }
  end
  
  def test_greater_than_or_equal_to
    assert_equal "<!--[if gte IE 5]>testing<![endif]-->", conditional_comment(:version => "greater than or equal to 5") { "testing" }
  end
  
  def test_greater_than_or_equal_to_no_version
    assert_equal "<!--[if IE]>testing<![endif]-->", conditional_comment(:version => "greater than or equal to") { "testing" }
  end
  
  def test_not_empty
    assert_equal "<!--[if !(IE)]>testing<![endif]-->", conditional_comment(:version => "not") { "testing" }
  end
  
  def test_not_version_only
    assert_equal "<!--[if !(IE 6)]>testing<![endif]-->", conditional_comment(:version => "not 6") { "testing" }
  end
  
  def test_not_less_than_or_equal_to
    assert_equal "<!--[if !(lte IE 7)]>testing<![endif]-->", conditional_comment(:version => "not less than or equal to 7") { "testing" }
  end
  
  def test_symbol
    assert_equal "<!--[if !(lte IE 7)]>testing<![endif]-->", conditional_comment(:version => :not_less_than_or_equal_to_7) { "testing" }
  end
  
  def test_empty_string
    assert_equal "<!--[if IE]>testing<![endif]-->", conditional_comment(:version => "") { "testing" }
  end
  
end

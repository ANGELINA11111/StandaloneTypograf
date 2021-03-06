#encoding: UTF-8

require 'test/unit'
require 'standalone_typograf'

class SignsTest < Test::Unit::TestCase
  def test_signs
    text = StandaloneTypograf::Typograf.new('(р)(Р)(r)(R)(тм)(ТМ)(с)(С)(C)(c)')
    should = '®®®®™™©©©©'
    assert_equal text.signs, should
  end

  def test_no_signs
    text = StandaloneTypograf::Typograf.new('Это чистый текст (yes)')
    should = 'Это чистый текст (yes)'
    assert_equal text.signs, should
  end

  def test_signs_option
    text = StandaloneTypograf::Typograf.new('(copy) 2013', signs: {'[(]copy[)]' => '©'})
    should = '© 2013'
    assert_equal text.signs, should
  end

  def test_signs_ru_option
    text = StandaloneTypograf::Typograf.new('(копи) 2013', signs_ru: {'[(]копи[)]' => '&COPY;'})
    should = '&COPY; 2013'
    assert_equal text.signs, should
  end

  def test_plus_minus
    text = StandaloneTypograf::Typograf.new('В шахматной нотации символ +- означает, что после соответствующего хода преимущество имеют белые. Малахов +1.')
    should = 'В шахматной нотации символ ± означает, что после соответствующего хода преимущество имеют белые. Малахов +1.'
    assert_equal text.signs, should
  end
end
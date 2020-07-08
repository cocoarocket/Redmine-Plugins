require File.expand_path('../../test_helper', __FILE__)

class ProductsControllerTest < ActionController::TestCase
  def setup
    3.times do |n|
      name = (n + 1).to_s
      price = Random.rand(10.0..500.0).truncate(2)
      number_count = Random.rand(10..500)
      Product.create!(name: "product_#{name}", price: price, number_count: number_count, production_date: Date.current, issue_id: 1)
    end
  end

  def test_index_success
    get :index
    assert_response :success

    assert_select 'tbody' do |elements|
      elements.each do |element|
        assert_select element, "tr", 3
      end
    end

  end

  def test_show_success
    get :show, :params => {
      :id => Product.last.id
    }
    assert_response :success
    assert_select 'h3', Product.last.name
  end
end

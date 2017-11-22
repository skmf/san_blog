require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
        @category = Category.create(name: "sports")
        @category2 = Category.create(name: "programming")
    end
    
    test "should show categories listing" do
        # HTTP request
        get categories_path
        
        # uses 
        assert_template 'categories/index'
        
        # want to check each link goes to each caterogies show page
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
    end
end
        
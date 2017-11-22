require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "get new category form and create category" do
        # Going to new category path
        get new_category_path
        
        # Accessing the form
        assert_template 'categories/new'
        
        # checking if a category was added or not
        assert_difference 'Category.count', 1 do
            # HTTP post request to categoeies_path, and pass category name
            # Adding post 
            post_via_redirect categories_path, category: {name: "sports"}
        end
        
        # goes to index
        assert_template 'categories/index'
        
        # check is sports is included
        assert_match "sports", response.body
    end
    
    # ------------------------------------------------------------------------------
    test "invalid category submission results in failure" do
        get new_category_path
        assert_template 'categories/new'
  
        assert_no_difference 'Category.count' do
            
        post categories_path, category: {name: " "}
         # If using Rails 5, use below line instead of above
         # post categories_path, params: { category: {name: " "} }
         
        end
            assert_template 'categories/new'
            # looking this in the error partial
            assert_select 'h2.panel-title'
            assert_select 'div.panel-body'
    end
end
        
module RedmineWarehouse
  module ProductsHooks
    class ProductsHooks < Redmine::Hook::ViewListener
      render_on :view_issues_show_details_bottom, partial: "issues/product_form"
      #render_on :view_issues_show_details_bottom, partial: "issues/producs_list"
    end
  end
end
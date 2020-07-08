module ProductsHelper
  def products_link_to_sort(order, optional_cap = nil)
    column = {
      id:              "ID",
      name:            "Name",
      price:           "Price",
      issue_id:        "Issue ID",
      number_count:    "Number",
      production_date: "Production Date",
    }[order]

    quot = "#{l("sort.by")} &quot;%s&quot"
    title = quot % l("sort.#{order}")

    caption = optional_cap || l(order)

    @sort_option = 'ASC' if @sort_option.nil?

    link_to caption, products_sort_path(order, @sort_option), title: title.html_safe

  end
end

module ProductsHelper
  def products_link_to_sort(order)
    column = {
      id:              "ID",
      name:            "Name",
      price:           "Price",
      issue_id:        "Issue ID",
      count_number:    "Number",
      production_date: "Production Date",
    }[order]

    quot = "#{l("sort.by")} &quot;%s&quot"
    title = quot % l("sort.#{order}")

    caption = l(order)
    link_to caption, products_sort_path(order), title: title.html_safe
  end
end

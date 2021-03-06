Given /^my basket contains (\d+) fruit tea\(s\), (\d+) punnet\(s\) of strawberries, and (\d+) packet\(s\) of coffee$/ do |teas_in_basket, strawberries_in_basket, coffees_in_basket|
  step "my basket contains #{teas_in_basket} fruit tea\(s\)"

  strawberries_product_code = 'SR1'
  strawberries = Product.find(:first, :conditions => [ "product_code = ?", strawberries_product_code])
  url_of_strawberries_product = '/products/' + strawberries.id.to_s

  strawberries_added = 0

  until strawberries_added == strawberries_in_basket.to_i do
    visit(url_of_strawberries_product)
    click_button('Add to Basket')
    strawberries_added += 1
  end

  coffee_product_code = 'CF1'
  coffee = Product.find(:first, :conditions => [ "product_code = ?", coffee_product_code])
  url_of_coffee_product = '/products/' + coffee.id.to_s

  coffees_added = 0

  until coffees_added == coffees_in_basket.to_i do
    visit(url_of_coffee_product)
    click_button('Add to Basket')
    coffees_added += 1
  end

end
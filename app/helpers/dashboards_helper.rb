module DashboardsHelper

  def get_totals
   {
    users: User.total_users,
    orders: Order.total_orders,
    revenue: OrderContent.total_revenue,
    products: Product.total_products
    }

  end

  def get_seven_day_totals
    {
    users: User.day_users_total(8),
    orders: Order.day_orders_total(8),
    revenue: OrderContent.day_revenue(8),
    products: Product.day_products_total(8)
    }
  end

  def get_thirty_day_totals
    {
    users: User.day_users_total(31),
    orders: Order.day_orders_total(31),
    revenue: OrderContent.day_revenue(31),
    products: Product.day_products_total(31)
    }
  end

  def get_top_states
    User.top_states.map do |state_row|
      [state_row.name, state_row.users_in_state]
    end.to_h
  end

  def get_top_cities
    User.top_cities.map do |city_row|
      [city_row.name, city_row.users_in_city]
    end.to_h
  end

  def get_best_customers
    highest_single_order = User.get_all_orders_highest_first[0]
    highest_lifetime_value = User.highest_lifetime_value[0]
    highest_avg_order = User.highest_avg_order[0]
    most_orders_placed = User.most_orders_placed[0]

    {
      "Highest Single Order Value" =>
        [highest_single_order.full_name, highest_single_order.order_total],
      "Highest Lifetime Value" =>
        [highest_lifetime_value.full_name, highest_lifetime_value.order_total],
      "Highest Average Order" =>
        [highest_avg_order.full_name, highest_avg_order.order_average],
      "Most Orders Placed" =>
        [most_orders_placed.full_name, most_orders_placed.orders]
    }
  end

  def get_seven_day_order_stats
    {
    "Number of Orders" => OrderContent.day_orders(8),
    "Total Revenue" => OrderContent.day_revenue(8),
    "Average Order Value" => OrderContent.average_order(8).round(2),
    "Largest Order Value" => OrderContent.largest_order(8)
    }
  end

  def get_thirty_day_order_stats
    {
    "Number of Orders" => OrderContent.day_orders(31),
    "Total Revenue" => OrderContent.day_revenue(31),
    "Average Order Value" => OrderContent.average_order(31).round(2),
    "Largest Order Value" => OrderContent.largest_order(31)
    }
  end


  def get_total_order_stats
    {
    "Number of Orders" => OrderContent.total_orders,
    "Total Revenue" => OrderContent.total_revenue,
    "Average Order Value" => OrderContent.average_order_total.round(2),
    "Largest Order Value" => OrderContent.largest_order_total
    }
  end

end

User.create! name:  "Admin",
             email: "admin@gmail.com",
             password:              "123123",
             password_confirmation: "123123",
             admin: true

# order = Order.create! user_id: 4,
#               receving_name: "Minh Tu",
#               receving_address: "Ha Noi",
#               status: 2

# 4.times do |n|
#   OrderDetail.create! order_id: order.id,
#                       product_id: 4,
#                       quantity: 10
# end

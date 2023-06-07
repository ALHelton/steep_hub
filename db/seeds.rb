earl_grey = Tea.create!(title: "What a Lovely Grey", description: "Earl Grey Tea", temperature: 195.0, brew_time: 5)
oolong = Tea.create!(title: "Oh My Oolong", description: "Oolong Tea", temperature: 190.0, brew_time: 4)
english = Tea.create!(title: "English Breakfast at Tiffany's", description: "English Breakfast Tea", temperature: 95.0, brew_time: 2)

andra = Customer.create!(first_name: "Andra", last_name: "Helton", email: "andra123@example.com", address: "123 some st.")
andrasub = Subscription.create!(title: "Andra's Subscription #1", price: 10.00, status: 0, frequency: 1, customer_id: andra.id)
andrasub2 = Subscription.create!(title: "Andra's Subscription #2", price: 15.00, status: 1, frequency: 0, customer_id: andra.id)
andrasub3 = Subscription.create!(title: "Andra's Subscription #3", price: 100.00, status: 1, frequency: 2, customer_id: andra.id)
atea1 = SubscriptionTea.create!(tea: oolong, subscription: andrasub)
atea2 = SubscriptionTea.create!(tea: english, subscription: andrasub)
atea3 = SubscriptionTea.create!(tea: english, subscription: andrasub2)
atea4 = SubscriptionTea.create!(tea: english, subscription: andrasub3)
atea5 = SubscriptionTea.create!(tea: earl_grey, subscription: andrasub3)

james = Customer.create!(first_name: "James", last_name: "Taylor", email: "james123@example.com", address: "321 other st.")
jamessub = Subscription.create!(title: "James's Subscription #1", price: 100.00, status: 0, frequency: 2, customer_id: james.id)
jamessub2 = Subscription.create!(title: "James's Subscription #2", price: 10.00, status: 0, frequency: 1, customer_id: james.id)
jtea1 = SubscriptionTea.create!(tea: earl_grey, subscription: jamessub)
jtea2 = SubscriptionTea.create!(tea: oolong, subscription: jamessub)
jtea3 = SubscriptionTea.create!(tea: english, subscription: jamessub)
jtea4 = SubscriptionTea.create!(tea: oolong, subscription: jamessub2)


raynes = Customer.create!(first_name: "Jon", last_name: "Raynes", email: "raynes123@example.com", address: "222 sample ct.")
raynessub = Subscription.create!(title: "Jon's Subscription #1", price: 10.00, status: 0, frequency: 1, customer_id: raynes.id)
rtea1 = SubscriptionTea.create!(tea: oolong, subscription: andrasub)

chris = Customer.create!(first_name: "Chris", last_name: "Davidoff", email: "chris@example.com", address: "111 random dr.")
chrissub = Subscription.create!(title: "Chris's Subscription #1", price: 15.00, status: 1, frequency: 0, customer_id: chris.id)


# subscription status: 0 - "Active", 1 - "Cancelled"
# frequency status: 0 - "Weekly", 1 - "Monthly", 2 - "Yearly"
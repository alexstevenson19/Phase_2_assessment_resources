
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "wordpass")


Bid.create!(amount: 5.00, bidder_id: 1, auction_id: 1)
Bid.create!(amount: 10.00, bidder_id: 2, auction_id: 2)

# YYYY-MM-DD or YYYY-MM-DD HH:MM:SS (e.g., 2015-04-01 14:30:00)
Auction.create!(name: "chair", condition: "good", starts_at: "2016-08-17 10:59:38", ends_at: "2017-08-17 10:59:38", description: "sturdy", auctioner_id: 2)

Auction.create!(name: "soccer ball", condition: "new", starts_at: "2016-08-17 11:00:38", ends_at: "2017-08-17 11:00:38",description: "fifa", auctioner_id: 1)


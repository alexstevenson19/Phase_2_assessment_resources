
User.create!(username: "bob", email: "bob@bob.bob", password: "password")
User.create!(username: "jen", email: "jen@jen.jen", password: "wordpass")

Category.create!(name: "furniture")
Category.create!(name: "sports")

Auction.create!(item: "chair", description: "sturdy", category_id: 1, auctioner_id: 2)
Auction.create!(item: "soccer ball", description: "fifa", category_id: 2, auctioner_id: 1)

Bid.create!(amount: 5.00, auction_id: 1, bidder_id: 1)
Bid.create!(amount: 10.00, auction_id: 2, bidder_id: 2)
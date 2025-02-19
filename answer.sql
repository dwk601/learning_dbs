-- 1. Find person with specific phone number
db.contacts.find(
  { "phone.areaCode": "952", "phone.number": "555-3471" },
  { _id: 0, firstName: 1, lastName: 1 }
)

-- 2. Find people with last name starting with "Camp"
db.contacts.find(
  { lastName: { $regex: "^Camp", $options: "i" } }
)

-- 3. Update Albert Jarboe's first name
db.contacts.updateOne(
  { firstName: "Albert", lastName: "Jarboe" },
  { $set: { firstName: "Ikea" } }
)

-- 4. Find Samiyah Tweedy
db.contacts.findOne(
  { firstName: "Samiyah", lastName: "Tweedy" }
)

-- 5. Find person by email
db.contacts.findOne(
  { email: "Donofrio.Jacquie-grey@gmail.com" }
)

-- 6. Update email
db.contacts.updateOne(
  { email: "Vreeland.Anuja-nm@icloud.com" },
  { $set: { email: "Vreeland.Anuja-music@icloud.com" } }
)

-- 7. Update Kate Barahona's first name
db.contacts.updateOne(
  { firstName: "Kate", lastName: "Barahona" },
  { $set: { firstName: "Kileen" } }
)

-- 8. Delete Elam Phung
db.contacts.deleteOne(
  { firstName: "Elam", lastName: "Phung" }
)

-- 9. Delete person by phone and last name
db.contacts.deleteOne({
  "phone.areaCode": "469",
  "phone.number": "555-0065",
  lastName: "Addington"
})

-- 10. Insert new contact
db.contacts.insertOne({
  firstName: "Dongwook",
  lastName: "Kim",
  email: "dkim@example.com",
  phone: {
    areaCode: "123",
    number: "456-7890"
  }
})
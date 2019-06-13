User.create!(email: "tranhongson@gmail.com",
    name: "Hong Son",
    gender: User.genders[:male],
    birthday: "4/10/1997",
    address: "76 Nguyen Luong Bang",
    role: User.roles[:admin])

User.create!(email: "nampham97@gmail.com",
    name: "Hoai Nam",
    gender: User.genders[:male],
    birthday: "3/5/1997",
    address: "6 Nguyen Trai",
    role: User.roles[:admin])

Category.create!(name: "Fantasy")
Category.create!(name: "Sci-fi")
Category.create!(name: "Thriller")
Category.create!(name: "Comedy")
Category.create!(name: "Tragedy")

Publisher.create!(name: "Shogakukan",
        address: "75 SHinjuku, Tokyo")
Publisher.create!(name: "Bunko",
        address: "65 Minagara, Osaka")
Publisher.create!(name: "Oxford",
        address: "75 Saint Patrict, London")

Author.create!(name:"Victor Hugo")
Author.create!(name:"Shakespear")
Author.create!(name:"Andersen")
Author.create!(name:"Murakami")
Author.create!(name:"Jujio.F.Fujiko")

Book.create!(category_id: 1,
   publisher_id: 1,
   name: "Romeo&Julieta",
   description: "Bla bla bla",
   number_of_pages: 200,
   publishing_year: 1959,
   number_of_books: 20)
Book.create!(category_id: 1,
   publisher_id: 2,
   name: "Little Mermaid",
   description: "Bla bla bla",
   number_of_pages: 147,
   publishing_year: 1939,
   number_of_books: 15)
Book.create!(category_id: 2,
   publisher_id: 3,
   name: "Doraemon",
   description: "Bla bla bla",
   number_of_pages: 301,
   publishing_year: 1954,
   number_of_books: 30)
Book.create!(category_id: 2,
   publisher_id: 2,
   name: "Norgerian Forest",
   description: "Bla bla bla",
   number_of_pages: 120,
   publishing_year: 1956,
   number_of_books: 10)
Book.create!(category_id: 5,
   publisher_id: 1,
   name: "Trai tim ben them",
   description: "Bla bla bla",
   number_of_pages: 163,
   publishing_year: 1973,
   number_of_books: 20)
Comment.create!(user_id: 1,
     commentable_id: 2,
     commentable_type: "Book",
     comment: "Blalalala")
Comment.create!(user_id: 1,
     commentable_id: 3,
     commentable_type: "Book",
     comment: "quafndmnfmdnf")
Comment.create!(user_id: 2,
     commentable_id: 2,
     commentable_type: "Comment",
     comment: "abcxyz")

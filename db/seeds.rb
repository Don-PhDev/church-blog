def data_deleter
  Comment.delete_all
  Post.delete_all
  User.delete_all
end

def data_creator
  AdminUser.create!(
    email: "admin@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
  User.create(
    email: "don@gmail.com",
    password: "password",
    password_confirmation: "password"
  )

  5.times do
    User.create!(
      email: [
        Faker::Internet.unique.user_name,
        Faker::Internet.email.split("@").last
      ].join("@"),
      password: "password",
      password_confirmation: "password"
    )
  end

  30.times do
    Post.create!(
      user: User.all.to_a.sample,
      title: Faker::Book.title,
      body: Faker::Lorem.paragraphs.join(" ")
    )
  end

  80.times do
    Comment.create!(
      user: User.all.to_a.sample,
      post: Post.all.to_a.sample,
      body: [
        Faker::Quote.yoda,
        [
          Faker::Quote.famous_last_words,
          Faker::Quote.jack_handey
        ].sample
      ].join(" ")
    )
  end
end

def data_count_message
  puts "Users: #{User.count}"
  puts "Posts: #{Post.count}"
  puts "Comments: #{Comment.count}"
end

data_deleter
data_creator
data_count_message

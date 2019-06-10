5.times do |n|
  name = "a-#{n}"
  email = "abcd-#{n}@example.com"
  password = "password"
  User.create!(name: name,
            email: email,
            password: password,
            password_confirmation: password)
end

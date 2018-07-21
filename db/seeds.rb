User.destroy_all

User.create!(
  email: 'admin@document.pl',
  password: 'Doc1234'
)
Bucket.create!(
  name: 'Main',
  user_id: '1'  
)
puts "Seeds have been added."
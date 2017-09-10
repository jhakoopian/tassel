member = User.create!(
  email:    'user@tassel.com',
  password: 'password'
)

admin = User.create!(
  email:    'admin@tassel.com',
  password: 'password',
  role:     'admin'
)

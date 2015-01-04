# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


group_a = Group.create(name: 'GroupA')
group_b = Group.create(name: 'GroupB')
group_c = Group.create(name: 'GroupC')

role_a = Role.create(name: 'RoleA')
role_b = Role.create(name: 'RoleB')
role_c = Role.create(name: 'RoleC')

customer_a = Customer.create(name: 'CustomerA')
customer_b = Customer.create(name: 'CustomerB')
customer_c = Customer.create(name: 'CustomerC')

User.create([
  { username: 'admin_user'   , password: 'password', password_confirmation: 'password' },
  { username: 'group_user'   , password: 'password', password_confirmation: 'password', group: group_a },
  { username: 'limited_user' , password: 'password', password_confirmation: 'password' },
  { username: 'customer_user', password: 'password', password_confirmation: 'password', customer: customer_a }
])

Article.create([
  { title: 'No Group or Customer' },
  { title: 'For GroupA', group: group_a },
  { title: 'For GroupB', group: group_b },
  { title: 'For CustomerA', customer: customer_a }
])
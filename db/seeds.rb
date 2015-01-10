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

admin_role = Role.create(name: 'Admin Role')
customer_role = Role.create(name: 'Customer Role')

customer_a = Customer.create(name: 'CustomerA')
customer_b = Customer.create(name: 'CustomerB')
customer_c = Customer.create(name: 'CustomerC')

common_user_attrs = { password: 'password', password_confirmation: 'password' }

admin_user    = User.create( common_user_attrs.merge( username: 'admin_user'   , description: 'has access to everything by virtue of their Admin Role' ) )
group_user    = User.create( common_user_attrs.merge( username: 'group_user'   , description: 'has access determined by their group membership', group: group_a ) )
limited_user  = User.create( common_user_attrs.merge( username: 'limited_user' , description: 'has direct permissions assigned (no role or group)' ) )
customer_user = User.create( common_user_attrs.merge( username: 'customer_user', description: 'has access determined by their customer relationship and Customer Role', customer: customer_a ) )

admin_user.roles << admin_role
customer_user.roles << customer_role

Article.create([
  { title: 'No Group or Customer' },
  { title: 'For GroupA', group: group_a },
  { title: 'For GroupB', group: group_b },
  { title: 'For CustomerA', customer: customer_a }
])

# TODO: Define some permissions (these get stored in the database by cancannible)

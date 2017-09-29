User.delete_all
Message.delete_all
Channel.delete_all


react = Channel.create(name: 'react')
paris = Channel.create(name: 'lewagon')
lewagon = Channel.create(name: 'paris')

puts 'Creating Users...'
foo = User.create(email: "foo@gmail.com", password: "123456")
bar = User.create(email: "bar@gmail.com", password: "123456")
baz = User.create(email: "baz@gmail.com", password: "123456")
puts 'Users created'

puts 'Creating Mess'
Message.create(content: 'This is the first content sample from Michael on React', user: foo, channel: react)
Message.create(content: 'This is the first content sample from Charles  on React', user: bar, channel: react)
Message.create(content: 'This is the first content sample from Michael Le Wagon', user: foo, channel: paris)
Message.create(content: 'This is the first content sample from Charles  Le Wagon', user: bar, channel: paris)
Message.create(content: 'This is the first content sample from Michael Paris', user: foo, channel: lewagon)
Message.create(content: 'This is the first content sample from Charles  Paris', user: bar, channel: lewagon)
puts 'Mess created'



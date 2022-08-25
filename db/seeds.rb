# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

first_user = User.new(name: 'Tom', email: 'tom@example.com',
                         photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')
second_user = User.new(name: 'Lilly', email: 'lilly@example.com',
                          photo: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')
third_user = User.new(name: 'Jerry', email: 'jerry@example.com',
                         photo: 'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')
fourth_user = User.new(name: 'John', email: 'john@example.com',
                          photo: 'https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')
fifth_user = User.new(name: 'Jane', email: 'jane@example.com',
                         photo: 'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')
admin = User.new(name: 'Admin', email: 'admin@example.com',
                        photo: 'https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales..')

first_user.password = 'daniel'
first_user.password_confirmation = 'daniel'
first_user.confirm
first_user.save!
second_user.password = 'daniel'
second_user.password_confirmation = 'daniel'
second_user.confirm
second_user.save!
third_user.password = 'daniel'
third_user.password_confirmation = 'daniel'
third_user.confirm
third_user.save!
fourth_user.password = 'daniel'
fourth_user.password_confirmation = 'daniel'
fourth_user.confirm
fourth_user.save!
fifth_user.password = 'daniel'
fifth_user.password_confirmation = 'daniel'
fifth_user.confirm
fifth_user.save!
admin.password = 'adminz'
admin.password_confirmation = 'adminz'
admin.confirm
admin.role = 'admin'
admin.save!

first_post = Post.create(author: first_user, title: 'First Post',
                         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')
second_post = Post.create(author: first_user, title: 'Second Post',
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')
third_post = Post.create(author: first_user, title: 'Third Post',
                         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')
fourth_post = Post.create(author: first_user, title: 'Fourth Post',
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')

first2_post = Post.create(author: second_user, title: 'Fifth Post',
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')
second2_post = Post.create(author: second_user, title: 'Sixth Post',
                           text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')
third2_post = Post.create(author: second_user, title: 'Seventh Post',
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')

fifth_post = Post.create(author: third_user, title: 'Eigth Post',
                         text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')

fourth2_post = Post.create(author: third_user, title: 'Nineth Post',
                           text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')

fifth2_post = Post.create(author: fourth_user, title: 'Tenth Post',
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in. Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. In dictum non consectetur a erat nam. Dui nunc mattis enim ut tellus elementum sagittis vitae et. Ut porttitor leo a diam sollicitudin. Nunc non blandit massa enim nec dui nunc mattis. At urna condimentum mattis pellentesque. Nibh venenatis cras sed felis eget velit. Cursus risus at ultrices mi tempus imperdiet. Nisl nisi scelerisque eu ultrices vitae auctor eu augue. Risus feugiat in ante metus dictum at tempor commodo. Consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis. Odio aenean sed adipiscing diam donec adipiscing tristique risus nec. Quis hendrerit dolor magna eget est lorem ipsum.')

Comment.create(post: fourth_post, author: third_user,
               text: '1 Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
Comment.create(post: fourth_post, author: fourth_user,
               text: '2 Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales')
Comment.create(post: fourth_post, author: third_user,
               text: '3 Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
Comment.create(post: fourth_post, author: fifth_user, text: '4 In dictum non consectetur a erat nam!')

Comment.create(post: first2_post, author: third_user,
               text: '5 Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales!')
Comment.create(post: first2_post, author: first_user,
               text: '6 Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
Comment.create(post: first2_post, author: second_user,
               text: '7 Ullamcorper a lacus vestibulum sed. Etiam sit amet nisl purus in.!')
Comment.create(post: first2_post, author: first_user, text: '8 In dictum non consectetur a erat nam!')
Comment.create(post: first2_post, author: second_user,
               text: '9 Arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales!')
Comment.create(post: first2_post, author: first_user, text: '10 In dictum non consectetur a erat nam!')

Like.create(author: first_user, post: first_post)
Like.create(author: third_user, post: fifth2_post)
Like.create(author: fifth_user, post: fifth2_post)
Like.create(author: first_user, post: second2_post)
Like.create(author: third_user, post: fifth_post)
Like.create(author: third_user, post: fourth_post)
Like.create(author: third_user, post: second_post)
Like.create(author: fifth_user, post: fourth_post)
Like.create(author: first_user, post: fifth_post)
Like.create(author: first_user, post: fourth_post)
Like.create(author: first_user, post: second_post)
Like.create(author: second_user, post: fifth_post)
Like.create(author: fourth_user, post: second_post)
Like.create(author: fourth_user, post: fifth2_post)

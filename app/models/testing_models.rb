require_relative 'user'
require_relative 'post'
require_relative 'like'
require_relative 'comment'

def main
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Poland.')

  first_post = Post.create(author: first_user, title: 'Hello 1', text: 'This is my first post')
  second_post = Post.create(author: first_user, title: 'Hello 2', text: 'This is my second post')
  third_post = Post.create(author: first_user, title: 'Hello 3', text: 'This is my  third post')
  fourth_post = Post.create(author: first_user, title: 'Hello 4', text: 'This is my fourth post')

  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
  Comment.create(post: second_post, author: second_user, text: 'Hi Bom!')
  Comment.create(post: third_post, author: second_user, text: 'Hi Dom!')
  Comment.create(post: fourth_post, author: second_user, text: 'Hi Mom!')
  Comment.create(post: first_post, author: first_user, text: 'Bye Tom!')
  Comment.create(post: second_post, author: second_user, text: 'Bye Mom!')

  Like.create(post: third_post, author: first_user)
  Like.create(post: third_post, author: second_user)
  Like.create(post: second_post, author: first_user)
end

main

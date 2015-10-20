include RandomData

# Create Users
 5.times do
   user = User.create!(
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

# Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_title,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

# Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_title,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 100.times do
   Question.create!(
     title: RandomData.random_question,
     body: RandomData.random_paragraph,
     resolved: false
   )
 end

 user = User.first
 user.update_attributes!(
   email: 'toc5012@gmail.com', # replace this with your personal email
   password: 'Bgg4fgme55'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"

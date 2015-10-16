include RandomData

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
     topic:  topics.sample,
     title:  RandomData.random_title,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Sponsored Posts
  30.times do
    SponsoredPost.create!(
      topic:  topics.sample,
      title:  RandomData.random_title,
      body:   RandomData.random_paragraph,
      price:  rand(1000)
    )
  end
  sponsored_posts = SponsoredPost.all

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 # 100.times do
 #   Comment.create!(
 #     sponsored_post: sponsored_posts.sample,
 #     body: RandomData.random_paragraph
 #   )
 # end

 100.times do
   Question.create!(
     title: RandomData.random_question,
     body: RandomData.random_paragraph,
     resolved: false
   )
 end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
 puts "#{SponsoredPost.count} sponsored posts created"

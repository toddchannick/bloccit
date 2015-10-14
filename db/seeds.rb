include RandomData

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
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

 50.times do
   Advertisement.create!(
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph,
     price: rand(1000)
   )
 end

 puts "#{Post.count} posts before unique post"
 Post.find_or_create_by(title: "Checkpoint 33 Title", body: "Checkpoint 33 Body")
 puts "#{Post.count} posts after unique post"

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

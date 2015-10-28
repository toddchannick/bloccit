include RandomData

 FactoryGirl.define do
   factory :label do
     name RandomData.random_name
     labelable 
     labelable_type
   end
 end

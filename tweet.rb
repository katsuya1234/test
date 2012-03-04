
require 'rubygems'
require 'twitter'
 
auth = Twitter::HTTPAuth.new('hoge', 'hoge');
base = Twitter::Base.new(auth)
 
guilty = base.friend_ids - base.follower_ids
puts "#{guilty.length} : People you follow who do not follow you"
 
printf("%-20s %-10s %-10s\n", "screen_name", "friends", "followers")
puts "-" * 50
guilty.each do |user_id|
  user = base.user(user_id)
  printf("%-20s %-10s %-10s\n", user.screen_name, user.friends_count, user.followers_count)
end
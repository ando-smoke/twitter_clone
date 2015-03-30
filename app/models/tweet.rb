class Tweet < ActiveRecord::Base
  validates :tweet_text, presence: true
end

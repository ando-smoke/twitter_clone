require 'rails_helper'
describe Tweet do
  it { should validate_presence_of :tweet_text}

end

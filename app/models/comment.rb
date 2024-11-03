class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, exclusion: { in: ["Harris", "Trump", "Election"], message: "Post cannot include content about the election" }
end

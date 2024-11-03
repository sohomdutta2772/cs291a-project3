class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, exclusion: { in: ["Harris", "Trump", "Election"], message: "Post cannot include content about the election" }
end

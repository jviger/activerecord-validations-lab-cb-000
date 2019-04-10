class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?
  
  clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  
  def clickbaity?
    if clickbait.none? { |word| title.include?(word) }
      errors.add(:title, "needs to be clickbaity")
    end
 end
  
  
end

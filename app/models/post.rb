class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate  :clickbaity?
  
  CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  
  def clickbaity?
    if CLICKBAIT.any? { |word| title.include?(word) }
      true
    else 
     false
    end
 end
  
  
end

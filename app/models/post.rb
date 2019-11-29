class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_clickbait

    def title_clickbait
        if title && (title.include?("Won't Believe") | title.include?("Secret") | title.include?("Top") | title.include?("Guess")) == false
            errors.add(:title, "has to be sufficiently clickbaity")
        end
    end

end
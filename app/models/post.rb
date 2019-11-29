class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Nonfiction"]}

    validate :non_clickbait?

    def non_clickbait?
        
        if title
            if !(title.match(/Won't Believe/i)) and !(title.match(/Secret/i)) and !(title.match(/Top[number]/i)) and !(title.match(/Guess/i))
                errors.add(:base, "Title must contains Won't Believe, Secret, Top[number], or Guess")
            end
        end
    end
    
end

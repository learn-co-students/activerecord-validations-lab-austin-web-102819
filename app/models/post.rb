class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { :maximum => 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :non_clickbait?
    
    def non_clickbait?
        # byebug
        if title
            if !(title.match(/Won't Believe/i)) and !(title.match(/Secret/i)) and !(title.match(/Top[number]/i)) and !(title.match(/Guess/i))
                errors.add(:base, "Title must contains Won't Believe, Secret, Top[number], or Guess")
                # errors.inspect
            end
        end
    end
end

class SubCategory < ApplicationRecord
    belongs_to :category
    has_many :quizzes
end
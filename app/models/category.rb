class Category < ApplicationRecord
    has_many :task_x_categories
    has_many :tasks, through: :task_x_categories
end

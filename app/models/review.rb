class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer_detail
end

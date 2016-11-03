class Edition < ApplicationRecord
  belongs_to :report
  belongs_to :officer
end

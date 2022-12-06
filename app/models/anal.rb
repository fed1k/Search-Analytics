class Anal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  before_save do
    anals = Anal.where(name: self.name)
    self.count += anals.count if anals.count >= 1
  end
end

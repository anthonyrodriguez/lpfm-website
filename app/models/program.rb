class Program < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }

  scope :scheduled, -> { where(archived: false) }
  scope :random,  -> { scheduled.sample }
end

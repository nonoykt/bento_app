class Bento < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to :shop
  scope :recent, -> { order(created_at: :desc) }

  private

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end

class Bookmark < ActiveRecord::Base
  before_save :fix_url
  belongs_to :topic
  has_many :likes, dependent: :destroy

  delegate :user, to: :topic

  private
  def fix_url
    self.url = url.include?('http://') ? url : "http://#{url}"
  end
end

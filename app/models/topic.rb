class Topic < ActiveRecord::Base
  before_save :capitalize_title
  has_many :bookmarks, dependent: :destroy

  private
  def capitalize_title
    self.title = title.split.map(&:capitalize).join(' ')
  end
end

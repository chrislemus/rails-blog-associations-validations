class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  # accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
  # accepts_nested_attributes_for :tags
  validates :name, :content, presence: true

  def tags=(tag_ids)
    tag_ids.each do |id|
      unless id.empty?
        tag = Tag.find_or_create_by(id: id)
        self.tags << tag
      end
    end
    # binding.pry
  end

end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  expiry_date :date
#  name        :string(255)
#  sku_id      :string(255)
#  price       :float(24)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  has_many :categoricals, :dependent => :destroy
  has_many :categories, :through => :categoricals
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images

  validates :expiry_date, presence: true
  validates :name, presence: true

  attr_accessor :tag_list, :categories_list, :images_list
  after_save :assign_tags, :assign_categories, :fetch_images

  def tags_seq
    tags.map(&:name).join(", ")
  end

  def categories_seq
    categories.map(&:name).join(", ")
  end

  private
  def assign_tags
    if @tag_list
      self.tags = @tag_list.split(',').map do |name|
        Tag.find_or_create_by(name: name.strip)
      end
    end
  end

  def assign_categories
    if @categories_list
      self.categories = @categories_list.split(',').map do |name|
        Category.find_or_create_by(name: name.strip)
      end
    end
  end

  def fetch_images
    if @images_list
      self.images.destroy_all #in case of update, no need to store previous images
      self.images = @images_list.map do |img|
        Image.create(img_path: img[:img_path])
      end
    end
  end
end

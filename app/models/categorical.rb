# == Schema Information
#
# Table name: categoricals
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Categorical < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
end

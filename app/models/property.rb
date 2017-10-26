class Property < ApplicationRecord
  belongs_to :category

  enum operation: {
    sale:           'sale',
    rent:           'rent',
    temporal_rent:  'temporal_rent'
  }

  scope :featured, ->() { where(featured: true) }
  scope :active,   ->() { where(active: true) }
end

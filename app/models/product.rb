# frozen_string_literal: true

require 'elasticsearch'
require 'elasticsearch/model'

class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  is_impressionable
  has_rich_text :body

  include Searchable

  acts_as_commontable dependent: :destroy

  after_initialize :set_defaults

  after_touch { __elasticsearch__.index_document }

  belongs_to :cart, optional: true
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos,
                                reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title
  validates_presence_of :brand
  validates_presence_of :category_id
  validates_presence_of :picurl

  validates_presence_of :body
  validates_presence_of :qty
  validates_presence_of :price

  validates_presence_of :msrp
  validates_presence_of :startdate
  validates_presence_of :enddate
  validates_presence_of :courier
  validates_presence_of :courierurl

  validates_length_of :title, maximum: 35

  validates_date :startdate,
                 before: :enddate,
                 before_message: 'must be at before the end date.'

  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :qty, greater_than: 0

  def commentable_title
    'Undefined Post Title'
  end

  def commentable_url
    '#'
  end

  def commentable_state
    'published'
  end

  def set_defaults
    self.msrp ||= 0.0
    self.price ||= 0.0
    self.picurl ||=
      'https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png'
    self.qty ||= 1

    self.funded ||= 'false'

    self.width ||= 0
    self.length ||= 0
    self.height ||= 0
    self.weight ||= 0
    self.courier ||= 'Canada Post'
    self.courierurl ||= 'https://www.canadapost.ca'
  end

  scope :published,
        lambda {
          where(draft: false,active: true, funded: false).where(
            '? BETWEEN startdate  AND enddate ',
            Date.today)
        }

  scope :expired,
              lambda {
                where(draft: false,active: false,funded: false).where(
                  '? > enddate ',
                  Date.today)
              }

  scope :most_recent, ->(limit) { order('startdate desc').limit(limit) }
  scope :ending_soonest, ->(limit) { order('startdate asc').limit(limit) }


  def self.search(query)
    if !query.blank?
      __elasticsearch__.search(
        {
          query: { multi_match: { query: query, fields: %w[title body.body] } },
          highlight: {
            pre_tags: ['<em class="label label-highlight">'],
            post_tags: %w[</em>],
            fields: { "title": {}, "body.body": {} }
          }
        }
      )
    else
      Product.published
    end
  end
end

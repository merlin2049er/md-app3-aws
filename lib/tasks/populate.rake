# frozen_string_literal: true

namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'populator'

    # require a model for this?
    # [Action_text_rich_texts].each(&:delete_all)
    # [Active_stroage_attachments].each(&:delete_all)
    # [Active_stroage_blobs].each(&:delete_all)

    [Product, Cart, User].each(&:delete_all)
    [Photo].each(&:delete_all)
    # [Commontator_comments].each(&:delete_all)
    # [Commontator_subscriptions].each(&:delete_all)
    # [Commontator_threads].each(&:delete_all)
    [Contact].each(&:delete_all)
    [Impression].each(&:delete_all)
    [Notification].each(&:delete_all)
    [Transaction].each(&:delete_all)

    #  Category.populate 15 do |category|
    #    category.id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    #    category.name = Populator.words(1..2).titleize
    #    category.picurl = ['photo_not_available.png']

    Product.populate 1..250 do |product|
      product.title = Populator.words(1..3).titleize
      product.brand = Populator.words(1..2).titleize
      #     product.template = Populator.sentences(2..10)
      product.price = [5.99, 19, 99, 29.99, 49.99]
      product.msrp =  [6.99, 21, 99, 39.99, 69.99]
      product.draft =  [false]
      product.active = [true]
      product.funded = [false]
      product.category_id = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      product.qty = [5, 10, 15]
      product.startdate = Date.today
      product.enddate = Date.today+30
      product.picurl = ['https://res.cloudinary.com/dlfodsgbd/image/upload/v1590070578/TippingPoint/photo_not_available.png']
    end
  end
end

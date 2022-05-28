# frozen_string_literal: true

require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host =
  'https://desolate-journey-54830.herokuapp.com/'
SitemapGenerator::Sitemap.create do
  add '/home', changefreq: 'weekly', priority: 0.9
  add '/contact_us', changefreq: 'yearly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks

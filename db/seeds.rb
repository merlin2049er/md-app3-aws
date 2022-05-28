# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed taxes (2019 rates)

tax_list = [
  ['AB', 0.05],
  ['BC', 0.07],
  ['MB', 0.08],
  ['NB', 0.15],
  ['NL', 0.15],
  ['NT', 0.05],
  ['NS', 0.15],
  ['NU', 0.05],
  ['ON', 0.13],
  ['PE', 0.15],
  ['QC', 0.09975],
  ['SK', 0.06],
  ['YT', 0.05]
]

tax_list.each { |tax| Tax.create(prov_id: tax[0], tax_rate: tax[1]) }

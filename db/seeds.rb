# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { name: '東京カフェ' },
  { name: '横浜カフェ' },
  { name: '大阪カフェ' },
  { name: '京都カフェ' },
  { name: '神戸カフェ' },
  { name: '福岡カフェ' },
  { name: '関東カフェ' },
  { name: '関西カフェ' },
  { name: '九州カフェ' },
  { name: 'パフェ' },
  { name: 'アフタヌーンティー' },
  { name: 'ラテアート' },
  { name: 'ケーキ' },
  { name: 'カヌレ' },
  { name: 'ロールケーキ' },
  { name: 'プリン' },
  { name: 'ドーナツ' },
  { name: '和風カフェ' },
  { name: '韓国風カフェ' }
])

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)
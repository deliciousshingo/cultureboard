class Genre < ActiveHash::Base
self.data = [
  { id: 1, name: '--' },
  { id: 2, name: '教育' },
  { id: 3, name: 'ビジネス' },
  { id: 4, name: 'IT' },
  { id: 5, name: 'エンタメ' },
  { id: 6, name: 'スポーツ' },
  { id: 7, name: 'グルメ' },
  { id: 8, name: 'その他' }
]
end
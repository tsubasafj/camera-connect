class Want < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'カメラマン' },
    { id: 3, name: 'モデル' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :boards
end
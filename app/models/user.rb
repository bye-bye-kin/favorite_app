class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  #nameが空の状態でデータベースに保存できないようにする。
  has_many :recipes, dependent: :destroy
  #ユーザーが削除された時、持っているレシピも全て削除される。
  has_many :favorites, dependent: :destroy

  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
  #今からいいね使用としている投稿に既にいいねを押していて、再度いいねを
  #押したらいいねが消えるようにしたい


end

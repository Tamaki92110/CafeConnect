class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         validates :name, presence: true #追記
         validates :profile, length: { maximum: 200 } #追記
         mount_uploader :image, ImageUploader
         has_many :messages, dependent: :destroy
         has_many :entries, dependent: :destroy
       


         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
        end
        has_many :comments, dependent: :destroy    
       
end

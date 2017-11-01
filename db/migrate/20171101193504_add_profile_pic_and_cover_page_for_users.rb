class AddProfilePicAndCoverPageForUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cover_pic, :string, default: 'crowdfunder_hero.jpg'
    add_column :users, :user_pic, :string, default: 'profile-pic-default.png'
  end
end

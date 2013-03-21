class CreateAdminGitUpdates < ActiveRecord::Migration
  def change
    create_table :admin_git_updates do |t|
      t.string :comment
      t.string :hashtag
      t.integer :commit
      t.string :commiter

      t.timestamps
    end
  end
end

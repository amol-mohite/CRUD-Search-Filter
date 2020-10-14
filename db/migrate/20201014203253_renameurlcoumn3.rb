class Renameurlcoumn3 < ActiveRecord::Migration[5.2]
  def change
  	rename_column :providers, :web_url, :website
  end
end

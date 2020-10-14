class Renameurlcoumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :providers, :url, :web_url
  end
end

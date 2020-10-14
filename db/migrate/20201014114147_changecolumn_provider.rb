class ChangecolumnProvider < ActiveRecord::Migration[5.2]
  def change
    rename_column :providers, :email, :isp_email
  end
end

class RenameUserProfilesToDashboards < ActiveRecord::Migration[7.0]
  def change
    rename_table :dashboard, :dashboards
  end
end

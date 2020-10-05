class RenameCodeTypeToKind < ActiveRecord::Migration[6.0]
  def change
    rename_column :codes, :type, :kind
  end
end

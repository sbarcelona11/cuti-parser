Sequel.migration do
  up do
    create_table :cuti do
      primary_key :id
      String :name, text: false
      String :email, text: true
      String :url, text: true
    end
  end

end
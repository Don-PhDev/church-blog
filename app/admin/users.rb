ActiveAdmin.register User do
  menu parent: "Posts", priority: 200

  index do
    selectable_column
    id_column
    column :email
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :created_at
      row :updated_at
      row "Posts" do |user|
        user.posts.each do |post|
          post
        end
      end
    end
  end
end

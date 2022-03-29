ActiveAdmin.register Post do
  includes :user

  menu parent: "Posts", priority: 100

  index do
    selectable_column
    id_column
    column "User" do |user|
      link_to(user.user.email, admin_user_path(user.user.id))
    end
    column :title
    actions
  end

  show do
    attributes_table do
      row :title
      row :created_at
      row :updated_at
      row :user
    end
    attributes_table title: "Post Comments" do
      post.comments.each do |com|
        ul do
          link_to(com.body, admin_user_comment_path(com))
        end
      end
    end
  end

  permit_params :title, :created_at, :updated_at, :user_id

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :user
      f.input :title
    end
    f.actions
  end
end

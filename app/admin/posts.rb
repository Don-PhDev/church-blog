ActiveAdmin.register Post do
  menu parent: "Posts", priority: 100

  permit_params :title, :body, :user_id

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

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs "Post" do
      f.input :user, as: :select, collection: User.pluck(:email, :id), include_blank: true, allow_blank: false
      f.input :title
      f.input :body, as: :quill_editor
    end
    f.actions
  end
end

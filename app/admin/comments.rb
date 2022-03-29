ActiveAdmin.register Comment, as: "User Comments" do
  menu parent: "Posts", priority: 300

  index do
    selectable_column
    id_column
    column "User" do |user|
      link_to(user.user.email, admin_user_path(user.user.id))
    end
    column :post
    column "Body" do |comment|
      truncate(comment.body, length: 50)
    end
    column :created_at
    column :updated_at
    actions
  end
end

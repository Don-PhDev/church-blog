ActiveAdmin.register Comment, as: "User Comments" do
  menu parent: "Posts", priority: 300

  permit_params :body, :post_id, :user_id

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
    column "Created / Latest Update At" do |comment|
      comment.updated_at
    end
    column :approved_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.object.approved_at = f.object.persisted? ? f.object.approved_at.to_date : Date.current
    f.inputs "Comments" do
      f.input :approved_at, as: :datepicker, input_html: { autofocus: true }

      f.input :post,
        as: :select,
        collection: Post.pluck(:title, :id).reverse,
        input_html: { disabled: f.object.persisted? }

      f.input :user,
        as: :select,
        collection: User.pluck(:email, :id),
        input_html: {
          disabled: f.object.persisted?
        }

      f.input :body, input_html: { disabled: f.object.persisted? }
    end
    f.actions
  end
end

ActiveAdmin.register User do
  menu label: "사용자 관리"

  index do
    selectable_column
    id_column
    br
    a link_to ("10 명씩 보기"), "/admin/users?order=id_desc&per_page=10", class: "button small"
    a link_to ("30 명씩 보기"), "/admin/users?order=id_desc&per_page=30", class: "button small"
    a link_to ("50 명씩 보기"), "/admin/users?order=id_desc&per_page=50", class: "button small"
    a link_to ("모두 보기"), "/admin/users?order=id_desc&per_page=#{User.count}", class: "button small"
    column :profile do |user| image_tag(user.profile_path, class: 'admin-index-image') end
    column :email
    column :dharmaName
    column :name
    column :phone
    column :ganzhi
    tag_column :access_level, interactive: true
    column :created_at  
    column :updated_at  
    actions
  end

  show do
    attributes_table do
      row :id
      row :profile do |user| image_tag(user.profile_path, class: 'admin-show-image') end
      row :email
      row :name
      row :dharmaName
      row :phone
      row :ganzhi
      row :addressProvince
      row :addressDetail
      row :remarks
    
      tag_row :gender, interactive: true
      tag_row :access_level, interactive: true
      row :birthday
      row :registerday
    end
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :access_level, as: :select, collection: User.enum_selectors(:access_level)
      f.input :gender, as: :select, collection: User.enum_selectors(:gender)
      f.input :profile
      f.input :name
      f.input :dharmaName
      f.input :phone
      f.input :ganzhi
      f.input :addressProvince
      f.input :addressDetail
      f.input :birthday
      f.input :registerday
    end
    f.actions
  end
  
end

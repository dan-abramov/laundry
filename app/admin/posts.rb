ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  menu label: 'Посты'

  permit_params :title, :body, :admin_user_id, :image

  index title: 'Все посты' do
    selectable_column
    id_column
    column 'Заголовок',   :title
    column 'Содержание',  :body
    column 'Изображение', sortable: :image_file_name do |firmware| link_to firmware.image_file_name, firmware.image.url end
    column 'Вес файла',   :image_file_size, sortable: :image_file_size do |firmware|
      if firmware.image_file_size
        "#{firmware.image_file_size / 1024} KB"
      else
        "Изображение отсутствует"
      end
    end
    column 'Создан', :created_at
    actions
  end

  filter :admin_user_id,   label: 'Создал',      as: :select, collection: -> { AdminUser.all }
  filter :title,           label: 'Заголовок',   filters: [:starts_with, :contains, :ends_with]
  filter :body,            label: 'Содержание',  filters: [:starts_with, :contains, :ends_with]

  form do |f|
    f.inputs do
      f.input :admin_user_id, input_html: { value: current_admin_user.id }, as: :hidden
      f.input :title, label: "Заголовок"
      f.input :body, as: :froala_editor, label: "Содержание"
      f.input :image, as: :file, label: "Фоновое изображение"
    end
    f.actions do
      f.action :submit, label: 'Создать'
      f.action :cancel, wrapper_html: { class: 'cancel'}, label: 'Отмена'
    end
  end

end

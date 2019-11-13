ActiveAdmin.register CustomerReview do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  menu label: 'Отзывы'
  permit_params :body, :admin_user_id, :customer_name, :image

  controller do
    def edit
      @page_title = 'Редактирование отзыва'
    end
  end

  index title: 'Все отзывы' do
    selectable_column
    id_column
    column 'Имя клиента', :customer_name
    column 'Отзыв',       :body
    column 'Фотография',   sortable: :image_file_name do |firmware| link_to firmware.image_file_name, firmware.image.url end
    column 'Вес файла',   :image_file_size, sortable: :image_file_size do |firmware|
      if firmware.image_file_size
        "#{firmware.image_file_size / 1024} KB"
      else
        "Фотография отсутствует"
      end
    end
    column 'Создан', :created_at
    actions
  end

  filter :admin_user_id,   label: 'Создал',      as: :select, collection: -> { AdminUser.all }
  filter :customer_name,   label: 'Имя клиента', filters: [:starts_with, :contains, :ends_with]
  filter :body,            label: 'Отзыв',       filters: [:starts_with, :contains, :ends_with]

  form do |f|
    f.inputs do
      f.input :admin_user_id, input_html: { value: current_admin_user.id }, as: :hidden
      f.input :customer_name,    label: "Имя клиента"
      f.input :body,             label: "Отзыв"
      f.input :image, as: :file, label: "Фотография"
    end
    f.actions do
      f.action :submit, label: 'Создать'
      f.action :cancel, wrapper_html: { class: 'cancel'}, label: 'Отмена'
    end
  end
end

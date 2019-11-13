ActiveAdmin.register AdminUser do
  menu label: 'Список администраторов'

  permit_params :email, :password, :password_confirmation

  index title: 'Список администраторов'do
    selectable_column
    id_column
    column :email
    column 'Текущий вход в систему', :current_sign_in_at
    column 'Количество раз авторизовался', :sign_in_count
    column 'Создан', :created_at
    actions
  end

  filter :email
  filter :created_at, label: 'Создан'

  form do |f|
    f.inputs do
      f.input :email
      f.input :password, label: "Пароль"
      f.input :password_confirmation, label: "Подтверждение пароля"
    end
    f.actions do
      f.action :submit, label: 'Создать'
      f.action :cancel, wrapper_html: { class: 'cancel'}, label: 'Отмена'
    end
  end

end

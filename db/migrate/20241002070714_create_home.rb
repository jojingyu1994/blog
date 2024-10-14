=begin
1. m_user_type
  - id(primary, int(5), auto increment, not null, unique, index)
  - user_type_name( 1: admin, 2: user)
  - create_date(not null, datetime)
  - modify_date(not null, datetime)
  - flg_delete(default 0, 0: not delete, 1: delete)

2. m_user
   - id(primary, int(5), auto increment, not null, unique, index)
   - m_user_type_id(foreign key, m_user_type)
   - user_name(not null, var_char(50), encoding: utf8mb4)
   - nick_name(not null, var_char(50), encoding: utf8mb4)
   - user_set_id(not null, var_char(50), unique, encoding: utf8mb4)
   - user_set_password(not null, var_char(50), encoding: utf8mb4)
   - user_set_image(null able, var_char(255), encoding: utf8mb4)
   - email(not null, var_char(255), encoding: utf8mb4)
   - phone_number(null able, var_char(20), encoding: utf8mb4)
   - user_type_id (foreign key, m_user_type)
   - create_date(not null, datetime)
   - modify_date(not null, datetime)
   - flg_delete( default 0, 0: not delete, 1: delete)
※ password, email, phone_number는 encrypt등의 암호화 실시 후 넣고싶음, 출력시는 decrypt

3. m_category
   - id(primary, int(5), auto increment, not null, unique, index)
   - category_name(not null, var_char(50), encoding: utf8mb4)
   - create_date(not null, datetime)
   - modify_date(not null, datetime)
   - flg_visible(default 1, 0: not visible, 1: visible)
   - flg_delete(default 0, 0: not delete, 1: delete)

4. m_moment
   - id(primary, int(5), auto increment, not null, unique, index)
   - category_id (foreign)
   - title(null able, var_char(255), encoding: utf8mb4)
   - comment(null able, text, encoding: utf8mb4)
   - visit_user_name(not null, default:, var_char(50), encoding: utf8mb4)
   - flg_visible(default 1, 0: not visible, 1: visible)
   - flg_delete(default 0, 0: not delete, 1: delete)

5. m_moment_image설정
   - id(primary, int(5), auto increment, not null, unique, index)
   - moment_id (foreign)
   - user_id(foreign, comment:"삭제 권한을 위한 user_id 추가")
   - path(not null, var_char(255), encoding: utf8mb4)
   - flg_delete(default 0, 0: not delete, 1: delete)

6. m_seo
   - path (primary)
   - title(not null, var_char(255), encoding: utf8mb4)
   - description(not null, text, encoding: utf8mb4)
   - keywords(not null, text, encoding: utf8mb4)
   - header_text(not null, text, encoding: utf8mb4)
   - footer_text(not null, text, encoding: utf8mb4)
=end
class CreateHome < ActiveRecord::Migration[7.2]
  def change
    create_table :m_user_types, if_not_exists: true do |t|
      t.string :user_type_name, null: false
      t.datetime :create_date, null: false
      t.datetime :modify_date, null: false
      t.integer :flg_delete, default: 0, null: false

      t.timestamps
    end

    create_table :m_users, if_not_exists: true do |t|
      t.references :m_user_type, foreign_key: true, null: false
      t.string :user_name, null: false, limit: 50
      t.string :nick_name, null: false, limit: 50
      t.string :user_set_id, null: false, limit: 50
      t.string :user_set_password, null: false, limit: 50
      t.string :user_set_image, limit: 255
      t.string :email, null: false, limit: 255
      t.string :phone_number, limit: 20
      t.datetime :create_date, null: false
      t.datetime :modify_date, null: false
      t.integer :flg_delete, default: 0, null: false

      t.timestamps
    end

    create_table :m_categories, if_not_exists: true do |t|
      t.string :category_name, null: false, limit: 50
      t.datetime :create_date, null: false
      t.datetime :modify_date, null: false
      t.integer :flg_visible, default: 1
      t.integer :flg_delete, default: 0

      t.timestamps
    end

    create_table :m_moments, if_not_exists: true do |t|
      t.references :category, foreign_key: { to_table: :m_categories }
      t.string :title, limit: 255
      t.text :comment
      t.string :visit_user_name, null: false, limit: 50, default: ''
      t.integer :flg_visible, default: 1
      t.integer :flg_delete, default: 0

      t.timestamps
    end

    create_table :m_moment_images, if_not_exists: true do |t|
      t.references :moment, foreign_key: { to_table: :m_moments }
      t.references :user, foreign_key: { to_table: :m_users }
      t.string :path, null: false, limit: 255
      t.integer :flg_delete, default: 0

      t.timestamps
    end

    create_table :m_seos, id: false, if_not_exists: true do |t|
      t.string :path, primary_key: true
      t.string :title, null: false, limit: 255
      t.text :description, null: false
      t.text :keywords, null: false
      t.text :header_text, null: false
      t.text :footer_text, null: false
      t.timestamps
    end
  end
end
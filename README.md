# テーブル設計

## users テーブル
| Column              | Type   | Options                          |
|---------------------|--------|----------------------------------|
| email               | string | null: false, unique: true        |
| encrypted_password  | string | null: false                      |
| name                | string | null: false                      |
| profile             | text   | null: false                      |
| occupation          | text   | null: false                      |
| position            | text   | null: false                      |

### Index
- `index_users_on_email` (unique)

---

## prototypes テーブル
| Column     | Type       | Options                            |
|------------|------------|------------------------------------|
| title      | string     | null: false                        |
| catch_copy | text       | null: false                        |
| concept    | text       | null: false                        |
| user       | references | null: false, foreign_key: true     |

> ※ 画像（image）は ActiveStorage で実装するため、このテーブルには含めません。

---

## comments テーブル
| Column    | Type       | Options                            |
|-----------|------------|------------------------------------|
| content   | text       | null: false                        |
| prototype | references | null: false, foreign_key: true     |
| user      | references | null: false, foreign_key: true     |

---

## アソシエーション
- User
  - has_many :prototypes
  - has_many :comments
- Prototype
  - belongs_to :user
  - has_many :comments
- Comment
  - belongs_to :user
  - belongs_to :prototype

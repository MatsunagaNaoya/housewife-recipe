# 主婦レシピ

## アプリ説明

主婦間で繋がる料理。<br>
そのレシピを共有・改良・発見していく楽しみを目的としたアプリです。

## users(devise) テーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false                |
| prefecture_id      | integer | null: false                |

### Association

- has_many :recipes
- has_many :comments

## recipes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| cooking_time_id        | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| recipe                 | references | null: false, foreign_key: true |
| text                   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :recipe

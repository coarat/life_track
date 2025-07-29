# 体調管理アプリ 基本設計書（High-Level Design Document）

## 1. アプリ概要

- **アプリ名（仮称）**：Life-Track
- **目的**：ユーザーが日々の体調（特に食事と排便）を記録・振り返りやすくする
- **開発環境**：Flutter（iOS / Android 両対応）
- **対象ユーザー**：健康を意識する一般ユーザー
- **データ保存方式**：ローカルDB（SQLite）またはFirebase Firestore

---

## 2. 画面構成

| 画面名             | 機能概要 |
|------------------|----------|
| ホーム画面         | 本日の食事／排便の記録ボタン、最新履歴の表示 |
| 食事記録画面       | 画像登録、日時選択、メニュー・店名・カロリー・メモ入力 |
| 排便記録画面       | 日時選択、状態選択、メモ入力 |
| 履歴画面（予定）   | 過去の食事／排便記録の一覧表示、フィルター機能 |
| 設定画面（任意）   | プロフィール、通知設定など（後日対応可） |

---

## 3. データベース設計

### 3.1 Users テーブル

ユーザーの基本情報

| カラム名       | 型       | 説明 |
|----------------|----------|------|
| uid          | String   | Firebase UID（主キー） |
| display_name           | String   | 表示名 |
| email          | String   | メールアドレス |
| created_at     | DateTime | 登録日時 |
| updated_at     | DateTime | 更新日時 |
| is_premium   | Bool     | 有料プラン利用フラグ（任意） |

---

### 3.2 UserDetails テーブル

ユーザーの詳細情報

| カラム名       | 型       | 説明 |
|----------------|----------|------|
| id             | int   | ID |
| uid          | String   | Firebase UID（リレーション） |
| last_name           | String   | 表示名 |
| first_name           | String   | 表示名 |
| height_cm      | Float    | 身長（cm） |
| weight_kg      | Float    | 体重（kg） |
| birthday       | Date     | 生年月日 |
| gender         | String   | 性別 |
| activity_level      | int   | 運動習慣（低／中／高）（任意）        |
| dietary_pref        | String   | 食事スタイル（任意）          |
| allergies           | String   | アレルギー（任意）            |
| sleep_avg_hrs       | Float    | 睡眠時間の目安（任意）        |
| lifestyle_notes| String   | 備考／生活習慣メモ（任意） |
| created_at     | DateTime | 登録日時 |
| updated_at     | DateTime | 更新日時 |

---

### 3.3 Meals テーブル（食事記録）

| カラム名       | 型       | 説明 |
|----------------|----------|------|
| id             | String   | ID |
| uid          | String   | Firebase UID（リレーション） |
| photo_url      | String   | 食事写真の保存先URL |
| datetime       | DateTime | 食事日時 |
| restaurant     | String   | 店舗名（任意） |
| menu_name      | String   | メニュー名（任意） |
| calories       | Int      | カロリー（kcal） |
| source         | String   | カロリーの取得方法（Web / 推定 / 手動） |
| memo           | String   | 自由記述のメモ |
| created_at     | DateTime | 登録日時 |
| updated_at     | DateTime | 更新日時 |

---

### 3.4 BowelMovements テーブル（排便記録）

| カラム名       | 型       | 説明 |
|----------------|----------|------|
| id             | String   | ID |
| uid          | String   | Firebase UID（リレーション） |
| datetime       | DateTime | 排便日時 |
| condition      | String   | 状態（例：良好／硬め／ゆるめ／出なかった） |
| memo           | String   | メモ（任意） |
| created_at     | DateTime | 登録日時 |
| updated_at     | DateTime | 更新日時 |

---

## 4. コンポーネント構成（Flutter）

### 4.1 状態管理
- `Riverpod` を想定

### 4.2 ストレージ
- 画像保存：いったん端末ローカル
- データ保存：SQLite

### 4.3 UIコンポーネント
- `ImagePicker`：食事画像の選択
- `DateTimePicker`：記録日時入力
- `DropdownButton`：排便状態など選択入力
- `TextField`：メモ／自由入力欄

---

## 5. API連携（将来的に）

- 栄養成分API（Spoonacular / FatSecret / Calorie Mama 等）
- AI画像認識API（料理名の推定）

---

## 6. セキュリティ・非機能要件

| 項目 | 内容 |
|------|------|
| ログイン管理 | Firebase Authentication |
| 通信 | HTTPSを強制、データの暗号化 |
| パフォーマンス | 軽量・シンプルな構成でオフライン利用も可能に |
| 拡張性 | 分離可能な機能モジュール化を想定 |
| 保守性 | データ構造の拡張・分析項目追加に対応しやすく設計 |

---

## 7. 今後の拡張想定（構造に含める）

- 睡眠・体重・運動など他の健康要素との統合
- カレンダー形式での記録表示
- グラフ分析機能（例：カロリー摂取の週次変化）
- リマインダー（プッシュ通知）
- データのエクスポート（CSV形式など）

---
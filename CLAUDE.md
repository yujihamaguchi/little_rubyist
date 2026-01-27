
# CLAUDE.md

このファイルは、このリポジトリでコードを作業する際にClaude Code (claude.ai/code) に対してガイダンスを提供します。

## プロジェクト概要

このプロジェクトは「little_rubyist」というRubygemで、Rubyでの関数型プログラミング演習と各種デザインパターンを実装しています。再帰的な実装を通じて関数型プログラミングの概念を示し、一般的なデザインパターンを探求しています。

## 主要アーキテクチャ

### 関数型プログラミング演習 (lib/little_rubyist.rb)
メインファイルには75以上の関数型プログラミング問題（Q001-Q088、Q201-Q203）が含まれており、以下を実装しています：
- 配列操作（zip、sum、ソートアルゴリズム、フィルタリング）
- 再帰アルゴリズム（フィボナッチ、クイックソート、マージソート）
- 高階関数（map、filter、foldr、foldl）
- バイナリ操作とエンコーディング/デコーディング
- BMGgemを使用したリレーショナル代数操作

### デザインパターン実装
各デザインパターンは `lib/` 以下の独自ディレクトリに整理されています：
- **振る舞いパターン**: chain_of_responsibility、command、mediator、memento、observer、state、strategy、template_method、visitor
- **生成パターン**: builder、factory1_simple_factory、factory2_factory_method、factory3_abstract_factory
- **構造パターン**: adapter、bridge、composite、decorator、proxy

**デザインパターン実装の方針**：このコードベースは学習用途のため、パターンの本質に集中できるよう意図的にシンプルに保っています。境界値チェック、エラーハンドリング、バリデーションなどの実務的な処理は、パターンの理解を妨げない限り省略しています。

## 共通開発コマンド

### テスト実行
- 全テスト実行: `rake test` または `bundle exec rake test`
- 特定テスト実行: `ruby -Ilib -Itest test/path/to/test_file.rb`
- 全てのテストは `*_e2e_test.rb` パターンでエンドツーエンドテスト

### コード品質チェック
- リンター実行: `rake rubocop` または `bundle exec rake rubocop`
- テスト+リンター実行: `rake` （デフォルトタスク）

### 開発
- 対話コンソール: `bin/console`
- ローカルgemインストール: `bundle exec rake install`

### 依存関係
使用している主要gem：
- `minitest` テストフレームワーク
- `rubocop` コードリンター
- `bmg` リレーショナル代数操作用（Q067-Q072）
- `multiset` と `predicate` 特定機能用

## テストパターン

- テストは `test/` ディレクトリに `lib/` 構造をミラーリングして配置
- 各パターン/機能には専用のエンドツーエンドテストが存在
- テストヘルパーにはカスタムモック機能を含む（`custom_mock.rb`）
- テストファイルでは `require_relative "test_helper"` を使用

## コーディング規約

- 全ファイルでfrozen string literalsを有効化
- メソッド名はRuby規約に従いsnake_caseを使用
- 関数型プログラミング演習では再帰実装を優先
- 各関数型プログラミング問題には問題番号を含む（Q001、Q002など）
- デザインパターンは関心の分離を明確にした標準的なOOP構造に従う
- Rubyの慣用的な命名規則に従う（例：boolean変数には`is_`プレフィックスを避け、`?`で終わるメソッド名と対応させる `@power_on` → `power_on?`）
- 「オブジェクトにメッセージを送る」というOOPの概念を明示するため、`self.`の省略やインデックス指定よりもメソッド呼び出しを優先する（例：`self.last`、`acc.take(...).push(...)`）。これはRubyの省略記法より意図の明示を重視する方針である
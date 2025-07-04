# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/report"
# ひとセットの共通プロセスを行いたいが、一部プロセスの処理にバリエーションをもたせたい。クライアントはオブジェクトの種類を選択するのみとしたい。

class ReportE2eTest < Minitest::Test
  def test_generate
    # Arrange
    report = Report.new

    # Act & Assert
    report.stub :fetch, :fetched do
      report.stub :format, lambda { |raw_data|
        assert_equal :fetched, raw_data
        :formatted
      } do
        assert_equal :formatted, report.generate
      end
    end
  end

  def test_fetch_data
    # Arrange
    report = Report.new

    # Act
    output = report.send(:fetch)

    # Assert
    assert_equal %i[foo bar baz], output
  end
end

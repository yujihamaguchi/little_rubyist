# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/csv_report"

# ひとセットの共通処理を行いたいが、処理の中身にバリエーションをもたせたい。クライアントはオブジェクトの種類を選択するのみとしたい。
class CsvReportE2eTest < Minitest::Test
  def test_generate
    # Arrange
    report = CsvReport.new

    # Act
    output = report.generate

    # Assert
    assert_match "[CSV Report]", output
    assert_match "CSV,formatted,report,data", output
  end
end

# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/template_method/report"
# ひとセットの共通プロセスを行いたいが、一部プロセスの中身にバリエーションをもたせたい。クライアントはオブジェクトの種類を選択するのみとしたい。

class ReportE2eTest < Minitest::Test
  def test_generate
    report = Report.new
    fetched_data = nil

    report.stub(:fetch, :mocked_fetched_data) do
      report.stub(:format, lambda { |raw_data|
        fetched_data = raw_data
        :mocked_formatted_data
      }) do
        result = report.generate
        assert_equal :mocked_fetched_data, fetched_data
        assert_equal :mocked_formatted_data, result
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

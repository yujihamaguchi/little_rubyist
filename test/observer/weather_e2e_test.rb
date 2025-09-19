# frozen_string_literal: true

require_relative "../../lib/observer/weather"
require_relative "../../lib/observer/forecast_display"
require_relative "../../lib/observer/statistic_analyzer"

# Subject の状態の変化と連動して Observer 群の状態も変化させたいが、Observer と Subject が互いに直接依存し密結合になることは避けたい。
# ( Subject は自分がどの具象クラスに通知しているか知らなくてもよく、Observer も Subject の内部構造に依存しないようにしたい。 )
class WeatherE2eTest < Minitest::Test
  def setup
    @weather = Weather.new
    @forecast_display = ForecastDisplay.new(subject: @weather)
    @statistic_analyzer = StatisticAnalyzer.new(subject: @weather)
  end

  TEST_CASES = [
    { temperature: 10, humidity: 40, analysis: :cold },
    { temperature: 11, humidity: 50, analysis: :warm }
  ].freeze

  def test_update
    TEST_CASES.each do |test_case|
      # Arrange
      temperature = test_case[:temperature]
      humidity = test_case[:humidity]

      # Act
      @weather.update(temperature: temperature, humidity: humidity)

      # Assert
      assert_equal "Forecast / temperature: #{temperature}, humidity: #{humidity}", @forecast_display.display
      assert_equal "Statistic / temperature: #{temperature} is #{test_case[:analysis]}!", @statistic_analyzer.analyze
    end
  end
end

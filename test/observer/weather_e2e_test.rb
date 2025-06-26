# frozen_string_literal: true

require_relative "../../lib/observer/weather"
require_relative "../../lib/observer/forecast_display"
require_relative "../../lib/observer/statistic_analyzer"

# Subject の状態の変化と連動して Observer 群の状態も変化させたいが、Observer と Subject が互いに直接依存し密結合になることは避けたい
# ( Subject は自分がどの具象クラスに通知しているか知らなくてもよく、Observer も Subject の内部構造に依存しないようにしたい )
class WeatherE2eTest < Minitest::Test
  def test_update
    # Arrange
    weather = Weather.new
    forecast_display = ForecastDisplay.new(subject: weather)
    statistic_analyzer = StatisticAnalyzer.new(subject: weather)
    temperature = 10
    humidity = 2

    # Act
    weather.update(temperature: temperature, humidity: humidity)

    # Assert
    assert_equal "Forecast / temperature: #{temperature}, humidity: #{humidity}", forecast_display.display
    assert_equal "Statistic / temperature: #{temperature} is cold!", statistic_analyzer.analyze
  end
end

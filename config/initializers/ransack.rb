#24:30開演のライブまで本日の公演に含める
Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day',
                       :arel_predicate => 'lteq',
                       :formatter => proc { |v| v.end_of_day + 1800 },
                       :compounds => false
end
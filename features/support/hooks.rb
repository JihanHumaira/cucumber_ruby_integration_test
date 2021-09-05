# frozen_string_literal: true
  
  After do |scenario|
    require 'auto_pass'
    RecordTime.record_end_time
    tnames = scenario.source_tag_names
    status = scenario.status
    AutoPass.collect_critical(tnames, status)
    name = scenario.name
    influx = ENV['INFLUX_BASE_URL']
    unless influx.nil? || influx == ''
      RecordTime.test_duration(tnames, status, name)
    end
  end
  
  Before do
    @logger = Logger.new(STDOUT)
  end
  
  AfterStep do
    unless @api
      begin
        url = URI.parse(current_url)
        puts url
      rescue StandardError
        nil
      end
    end
  end
  

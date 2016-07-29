if Rails.env == "development"
  require "rack-mini-profiler"

  # Initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
end

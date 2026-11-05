require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Turn on fragment caching in view templates.
  config.action_controller.perform_caching = true

  # Serve static assets from public folder in production
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || true
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }

  # Store uploaded files on the local file system (or active storage provider).
  config.active_storage.service = :local

  # Log to STDOUT with current request id as log tag for Railway logs.
  config.log_tags = [ :request_id ]
  config.logger   = ActiveSupport::TaggedLogging.logger(STDOUT)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Prevent health checks from clogging up the logs.
  config.silence_healthcheck_path = "/up"

  # Resend SMTP Configuration via ActionMailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: ENV.fetch("APP_HOST", "crowncleaners.co.uk") }

  config.action_mailer.smtp_settings = {
    address:              "smtp.resend.com",
    port:                 587,
    domain:               "crowncleaners.co.uk",
    user_name:            "resend",
    password:             ENV["RESEND_API_KEY"],
    authentication:       :plain,
    enable_starttls_auto: true
  }

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Allow all Railway subdomains and custom domains
  config.hosts << /.*\.railway\.app/
  config.hosts << /.*\.up\.railway\.app/
  config.hosts << "crowncleaners.co.uk"
  config.hosts << "www.crowncleaners.co.uk"
end
Rails.application.config.session_store :cookie_store, serializer: :json, key: '_uk_ts_session', expire_after: 1.hour

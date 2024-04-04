json.extract! press_release, :id, :title, :content, :publish_date, :status, :user_id, :publisher_id, :created_at, :updated_at
json.url press_release_url(press_release, format: :json)

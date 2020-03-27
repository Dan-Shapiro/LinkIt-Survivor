json.extract! info_post, :id, :title, :content, :created_at, :updated_at
json.url info_post_url(info_post, format: :json)

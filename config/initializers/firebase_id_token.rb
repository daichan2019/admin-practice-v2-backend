FirebaseIdToken.configure do |config|
  config.redis = Redis.new
  # config.project_ids = ['admin-practice-41933']
  config.project_ids = [ENV['FIREBASE_PROJECT_ID']]
end

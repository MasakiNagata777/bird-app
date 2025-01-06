Rails.application.routes.draw do
  root "birds#index"
  get "birds/health_status", to: "birds#health_status"
  post "birds/decrease_health", to: "birds#decrease_health"
  post "birds/feed", to: "birds#feed" # 新しいエンドポイント
end

Rails.application.routes.draw do
  root "birds#index"
  get "birds/health_status", to: "birds#health_status"
  post "birds/decrease_health", to: "birds#decrease_health"
  post "birds/feed", to: "birds#feed" # 新しいエンドポイント

  # 名前編集機能のルートを追加
  get "birds/edit_name", to: "birds#edit_name", as: :edit_name_birds
  patch "birds/update_name", to: "birds#update_name", as: :update_name_birds
end


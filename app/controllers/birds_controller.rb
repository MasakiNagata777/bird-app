class BirdsController < ApplicationController
    def index
      @bird = Bird.first_or_create(name: "ぴよちゃん", health: 20, growth_stage: "baby")
    end

    def feed
      @bird = Bird.first
      new_health = [@bird.health + 5, 20].min # 最大値を20に制限
      @bird.update(health: new_health)
      render json: { health: new_health }
    end

    def decrease_health
      @bird = Bird.first
      new_health = [@bird.health - 1, 0].max # 最小値を0に制限
      @bird.update(health: new_health)
      render json: { health: new_health }
    end

    # 名前編集画面を表示
    def edit_name
      @bird = Bird.first_or_create(name: "ぴよちゃん", health: 20, growth_stage: "baby")
    end

    def update_name
      @bird = Bird.first
      if @bird.update(name: params[:name]) # params[:bird][:name] を params[:name] に変更
        redirect_to root_path, notice: "名前を更新しました！"
      else
        flash[:alert] = "名前の更新に失敗しました。"
        render :edit_name
      end
    end
  end

class BirdsController < ApplicationController
  def index
    @bird = Bird.first_or_create(name: "ぴよちゃん", health: 100, growth_stage: "baby")
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
end

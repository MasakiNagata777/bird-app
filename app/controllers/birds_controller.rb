class BirdsController < ApplicationController
  def index
    @bird = Bird.first_or_create(name: "ぴよちゃん", health: 100, growth_stage: "baby")
  end

  def feed
    @bird = Bird.first
    new_health = [@bird.health + 20, 100].min # 最大値を100に制限
    @bird.update(health: new_health)
    render json: { health: new_health }
  end

  def decrease_health
    @bird = Bird.first
    new_health = [@bird.health - 1, 0].max
    @bird.update(health: new_health)
    render json: { health: new_health }
  end
end

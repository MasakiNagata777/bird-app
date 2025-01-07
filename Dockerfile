FROM ruby:3.2.2

# 必要なシステムライブラリをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Bundlerのインストール（最新バージョンに合わせる）
RUN gem install bundler -v 2.4.10

# 作業ディレクトリを指定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock ./

# 必要なGemをインストール
RUN bundle install

# プロジェクト全体をコピー
COPY . .

# デフォルトコマンドを指定
CMD ["bash"]

ENV EDITOR=vim
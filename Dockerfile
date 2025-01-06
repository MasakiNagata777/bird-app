FROM ruby:3.2.2

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Bundlerのインストール
RUN gem install bundler -v 2.1.4

# 作業ディレクトリを指定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile* ./

# 必要なGemをインストール
RUN bundle _2.1.4_ install

# プロジェクト全体をコピー
COPY . ./

CMD ["bash"]

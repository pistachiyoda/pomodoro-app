# 基本イメージとしてNode.jsの最新安定版を使用
FROM node:20

# アプリケーションディレクトリを作成
WORKDIR /usr/src/app

# npmのパッケージファイルをコピー
COPY package.json package-lock.json ./

# パッケージをインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# アプリケーションを起動するポート番号を指定
EXPOSE 8080

# 環境変数を設定（本番環境用）
ENV HOST=0.0.0.0
ENV PORT=8080

# アプリケーションをビルド
RUN npm run build

# アプリケーションを起動
CMD ["npm", "start"]
#!/bin/bash

# GenU 開発サーバー起動スクリプト
# AWS プロファイルとリージョンを設定してから開発サーバーを起動します

echo "🚀 GenU 開発サーバーを起動しています..."
echo "📍 AWS Profile: keien"
echo "🌍 AWS Region: us-east-1"

# AWS 環境変数を設定
export AWS_PROFILE=keien
export AWS_DEFAULT_REGION=us-east-1

# 開発サーバーを起動
npm run web:devw

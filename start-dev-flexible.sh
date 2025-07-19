#!/bin/bash

# GenU 開発サーバー起動スクリプト（柔軟版）
# 使用方法:
#   ./start-dev-flexible.sh                    # デフォルト設定で起動
#   ./start-dev-flexible.sh keien us-east-1    # プロファイルとリージョンを指定
#   ./start-dev-flexible.sh keien us-east-1 dev # 環境も指定

# デフォルト値
DEFAULT_PROFILE="keien"
DEFAULT_REGION="us-east-1"
DEFAULT_ENV=""

# 引数から値を取得（指定されていない場合はデフォルト値を使用）
PROFILE=${1:-$DEFAULT_PROFILE}
REGION=${2:-$DEFAULT_REGION}
ENV=${3:-$DEFAULT_ENV}

echo "🚀 GenU 開発サーバーを起動しています..."
echo "📍 AWS Profile: $PROFILE"
echo "🌍 AWS Region: $REGION"
if [ -n "$ENV" ]; then
    echo "🏷️  Environment: $ENV"
fi

# AWS 環境変数を設定
export AWS_PROFILE=$PROFILE
export AWS_DEFAULT_REGION=$REGION

# 環境が指定されている場合は引数として渡す
if [ -n "$ENV" ]; then
    echo "📝 Running: npm run web:devw --env=$ENV"
    npm run web:devw --env=$ENV
else
    echo "📝 Running: npm run web:devw"
    npm run web:devw
fi

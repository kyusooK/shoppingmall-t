#!/bin/bash

echo "🚀 GitHub Codespaces 환경 초기화를 시작합니다..."

# 시스템 패키지 업데이트 및 필수 도구 설치
sudo apt-get update
sudo apt-get install -y net-tools iputils-ping

# HTTPie 설치
pip install httpie

# AWS CLI 설치 (이미 설치되어 있을 수 있음)
if ! command -v aws &> /dev/null; then
    echo "AWS CLI 설치 중..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
    unzip /tmp/awscliv2.zip -d /tmp/
    sudo /tmp/aws/install
    rm -rf /tmp/aws /tmp/awscliv2.zip
fi

# eksctl 설치
if ! command -v eksctl &> /dev/null; then
    echo "eksctl 설치 중..."
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
fi

# NVM 및 Node.js 설정
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if ! command -v nvm &> /dev/null; then
    echo "NVM 설치 중..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

echo "Node.js 14.19.0 설치 및 설정..."
nvm install 14.19.0
nvm use 14.19.0
export NODE_OPTIONS=--openssl-legacy-provider

# 프론트엔드 의존성 설치
if [ -d "frontend" ]; then
    echo "프론트엔드 의존성 설치 중..."
    cd frontend && npm install && cd ..
fi

echo "✅ GitHub Codespaces 환경 초기화가 완료되었습니다!"
echo "🐳 Docker Compose를 수동으로 실행하려면: cd infra && docker-compose up" 
#!/bin/env bash

PROJECT_PATH=$1 # 想要添加 lint 的项目的地址，默认为当前目录
if [[ ! -d $PROJECT_PATH ]]; then
    PROJECT_PATH=$(pwd)
fi

THIS_PATH=$(cd "$(dirname $0)"; pwd) # 本仓库地址
ESLINTRC=$THIS_PATH/.eslintrc.js # eslint 配置文件地址
PRETTIERRC=$THIS_PATH/.prettierrc # prettier 配置文件地址

## 回到项目的目录下
cd $PROJECT_PATH

## 正式安装， eslint 使用 8.6.0
## 默认使用 yarn 安装依赖，如果 yarn 不存在则使用 npm
if yarn -v git >/dev/null 2>&1; then 
    yarn add -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-alloy eslint-config-prettier eslint-plugin-prettier prettier typescript eslint@8.6.0
else
    npm install -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-alloy eslint-config-prettier eslint-plugin-prettier prettier typescript eslint@8.6.0
fi

## 复制配置文件
cp $ESLINTRC $PRETTIERRC $PROJECT_PATH

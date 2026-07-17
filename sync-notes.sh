#!/bin/bash

set -e

echo "1. 원격 브랜치 정보 가져오기"
git fetch origin

echo "2. main 브랜치로 이동"
git switch main

echo "3. main 최신화"
git pull origin main

echo "4. 개인 폴더 반영"
git restore --source origin/jinseong -- jinseong
git restore --source origin/dongjun -- dongjun

echo "5. 변경사항 스테이징"
git add jinseong dongjun

if git diff --cached --quiet; then
  echo "새로 반영할 변경사항이 없습니다."
else
  echo "6. main 커밋 및 push"
  git commit -m "docs: sync study notes"
  git push origin main
fi

echo "7. jinseong 브랜치로 복귀"
git switch jinseong

echo "완료"
#!/bin/bash

NAME=$1

# Dependency, RootFeature 파일 경로
DEPENDENCY_FILE="./Tuist/ProjectDescriptionHelpers/Extension/Dependency+Feature.swift"
PARENT_MODULE="./Projects/Features/RootFeature/Project.swift"

# 이름 전달 확인
if [ -z "$NAME" ]; then
    echo "🔴 모듈명이 제대로 들어오지 않았습니다. 🔴"
    exit 1
fi

# Dependency 파일이 존재하는지 확인
if [ ! -f "$DEPENDENCY_FILE" ]; then
    echo "🔴 $DEPENDENCY_FILE 이 없습니다."
    exit 1
fi

# RootFeature 파일이 존재하는지 확인
if [ ! -f "$PARENT_MODULE" ]; then
    echo "🔴 $PARENT_MODULE 이 없습니다."
    exit 1
fi

# 소문자로 변환된 이름 (camelCase)
FIRST_CHAR=$(echo "$NAME" | cut -c1 | tr '[:upper:]' '[:lower:]')
REST_CHARS=$(echo "$NAME" | cut -c2-)
LOWER_NAME="${FIRST_CHAR}${REST_CHARS}"

# RootFeature에 추가할 Dependency
NEW_ROOT_DEPENDENCY="        .Feature.$NAME.feature,"

echo "🔧 Dependency+Feature.swift에 새로운 의존성을 추가합니다..."

# Feature Dependency 추가 (마지막 } 앞에 추가)
sed -i '' '/^public extension TargetDependency\.Feature {$/,/^}$/{
    /^}$/{
        i\

        i\
    struct '"${NAME}"' {\
        private static let name = "'"${NAME}"'Feature"\
        public static let feature = featureDependency(target: name)\
        public static let interface = featureInterfaceDependency(target: name)\
    }
    }
}' "$DEPENDENCY_FILE"

echo "🔧 RootFeature/Project.swift에 의존성을 추가합니다..."

# RootFeature에 의존성 추가
if grep -q "dependencies: \[" "$PARENT_MODULE"; then
    # dependencies 배열의 마지막 항목 뒤에 추가
    sed -i '' "/dependencies: \[/,/\]/ {
        /\]/ i\\
$NEW_ROOT_DEPENDENCY
    }" "$PARENT_MODULE"
else
    echo "🔴 dependencies 배열을 찾을 수 없습니다."
    exit 1
fi

echo "✅ ${NAME}Feature 의존성이 성공적으로 추가되었습니다!"

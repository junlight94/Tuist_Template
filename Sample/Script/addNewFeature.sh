#!/bin/bash

NAME=$1
SERVICE_NAME=$2

# Dependency, RootFeature 파일 경로
DEPENDENCY_FILE="./Tuist/ProjectDescriptionHelpers/Extension/Dependency+Feature.swift"
PARENT_MODULE="./Projects/$SERVICE_NAME/Service/Project.swift"

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

# Dependency에 추가할 Struct
NEW_DEPENDENCY_STRUCT="        public struct $NAME {}"

# Dependency에 추가할 Extension
NEW_DEPENDENCY_EXTENSION=$(cat <<EOF

public extension TargetDependency.Features.$NAME {
    static let name = "$NAME"
    
    static let feature = TargetDependency.Features.project(
        name: "\(name)Feature",
        service: .sample
    )
    
    static let interface = TargetDependency.project(
        target: "\(name)FeatureInterface",
        path: .relativeToFeature(path: "\(name)Feature", service: .sample)
    )
}
EOF
)

# Root에 추가할 Dependency
NEW_ROOT_DEPENDENCY="        .Features.$NAME.feature,"

# Feature Struct 추가
sed -i '' "/struct Features {/a\\
$NEW_DEPENDENCY_STRUCT
" "$DEPENDENCY_FILE"

# Feature Extension 추가
echo "$NEW_DEPENDENCY_EXTENSION" >> "$DEPENDENCY_FILE"

# RootFeature 위치 확인 및 추가
if grep -q "dependencies: \[" "$PARENT_MODULE"; then
    sed -i '' "/dependencies: \[/a\\
$NEW_ROOT_DEPENDENCY
" "$PARENT_MODULE"
else
    exit 1
fi

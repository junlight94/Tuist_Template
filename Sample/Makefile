.PHONY: generate

module:
	@echo "✨ 생성할 모듈 타입을 선택해주세요:"
	@echo "[1]  Feature 모듈 생성"
	@echo "[2]  Domain 모듈 생성"
	@read -p "📝 옵션 입력 (1, 2): " module_type; \
	case $$module_type in \
	1) \
		destination="Projects/Features"; \
		folderName="feature";; \
	2) \
		destination="Projects/Domains"; \
		folderName="domain";; \
	*) \
		echo "❌ 잘못된 옵션 입력입니다. 1, 2 중에서 선택하세요."; \
		exit 1;; \
	esac; \
	\
	echo "\n"; \
	echo "🌟 모듈 이름 입력 규칙:"; \
	echo "1️⃣  'Feature', 'Domain'는 자동으로 붙습니다! 입력하지 마세요."; \
	echo "-----------------------------------------------"; \
	\
	read -p "🚀 모듈 이름을 입력하세요: " name; \
	\
	if [ -z "$$name" ]; then \
		echo "❌ 모듈 이름을 입력해야 합니다!"; \
		exit 1; \
	fi; \
	if [ "$$folderName" = "domain" ]; then \
		sh ./Script/addNewDomain.sh "$$name"; \
	elif [ "$$folderName" = "feature" ]; then \
		sh ./Script/addNewFeature.sh "$$name"; \
	else \
		echo "🚨 Error: Unknown folderName '$$folderName'"; \
		exit 1; \
	fi; \
	echo "\n"; \
	echo "🔨 모듈 생성중입니다"; \
	tuist scaffold "$$folderName" --name "$$name" --path "$$destination"

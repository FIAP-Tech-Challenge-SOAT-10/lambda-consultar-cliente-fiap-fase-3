.PHONY: install deploy test clean

install:
	pip install --upgrade pip
	pip install -r requirements.txt
	npm ci
	npx serverless plugin install -n serverless-python-requirements
	echo "✅ Dependencies installed"

deploy: install
	npx serverless deploy --stage prod --verbose

test:
	PYTHONPATH=$$PYTHONPATH:. python -m pytest -p no:warnings

clean:
	rm -rf .serverless __pycache__ .pytest_cache node_modules
	echo "🧹 Cleaned project"

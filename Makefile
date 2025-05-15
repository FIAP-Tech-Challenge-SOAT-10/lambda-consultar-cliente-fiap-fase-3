.PHONY: install deploy test clean

install:
	pip install -r requirements.txt
	npm install
	npm install -g serverless@3.38.0
	echo "Done"

deploy:
	rm -rf .serverless
	rm -rf node_modules
	npm install
	npm install -g serverless@3.38.0
	serverless deploy

test:
	PYTHONPATH=$PYTHONPATH:. python -m pytest -p no:warnings

clean:
	rm -rf .serverless
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf node_modules 
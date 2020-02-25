BIN=venv/Scripts/
VENV_DIR=venv

prepare:
	if not exist "venv" $(MAKE) install

install:
	pip install virtualenv
	virtualenv venv
	$(BIN)pip install -r requirements.txt

test: prepare
	$(BIN)robot -d test_results .

test-stub: prepare
	$(BIN)robot -d test_results stubs\stub_test.robot

login/%: prepare
	$(BIN)robot -v PROJECT:$* -d test_results login\login.robot

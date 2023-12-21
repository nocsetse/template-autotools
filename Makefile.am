CLOCAL_AMFLAGS = -I config/m4 -I aclocal
ACLOCAL_AMFLAGS = -I config/m4 -I aclocal

.PHONY: src tests

clean: ## Clean up your mess
	rm -rf _build *.egg-info
	@find . -name '*.pyc' | xargs rm -rf
	@find . -name '__pycache__' | xargs rm -rf
	@find . -name 'Makefile' | xargs rm -rf
	@find . -name 'Makefile.in' | xargs rm -rf
	@for trash in _build aclocal.m4 autom4te.cache config config.log config.status configure configure~ libtool; do\
		if [ -f $$trash ] || [ -d $$trash ]; then \
				echo "Removing $$trash" ;\
				rm -rf $$trash ;\
		fi ; \
	done

python:
	@$(PY39) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install -r src/requirements.txt; \
	)

test: 
	@$(PY39) -m venv _build
	( \
		source _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
		_build/bin/python -m pip install tox; \
		_build/bin/python -m pip install -r tests/requirements-test.txt; \
		_build/bin/python -m pip install -r tests/requirements-security.txt; \
	)

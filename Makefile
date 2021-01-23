vscode:
	code-insiders --remote ssh-remote+skillbox /project

# NOTE: Run this command with sudo on linux or pip will install everything into ~/.local.
venv: .venv

.venv:
	conda create -p .venv python=3.8

requirements:
	python3 -m pip --disable-pip-version-check install wheel

	find . -name requirements.txt | \
        xargs -I'{}' python3 -m pip --disable-pip-version-check install -r '{}'

	python3 -m pip --disable-pip-version-check install \
			pylint \
			mypy \
			autopep8 \
			;

provision: venv requirements

.PHONY: vscode venv requirements provision

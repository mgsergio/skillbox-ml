vscode:
	code-insiders --remote ssh-remote+skillbox /project

# NOTE: Run this command with sudo on linux or pip will install everything into ~/.local.
provision:
	find . -name requirements.txt | \
        xargs -I'{}' python3 -m pip --disable-pip-version-check install -r '{}'

	python3 -m pip --disable-pip-version-check install \
			pylint \
			mypy \
			autopep8 \
			;

.PHONY: vscode provision

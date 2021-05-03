help:  ## Show help.
	@grep -h "##" $(MAKEFILE_LIST) | grep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/--/'

vscode:                       ## Start vscode and ssh to remote (probably obsolute).
	code-insiders --remote ssh-remote+skillbox /project

# NOTE: Run this command with sudo on linux or pip will install everything into ~/.local.
venv: .venv                   ## Create a virtual environment.

# TODO: Add a check that conda is set up properly.
.venv:
	# TODO: Use variable for .venv
	conda create --yes -p .venv python=3.8

requirements:                 ## Install all requirement.
	# TODO: Use variable for .venv
	find . -name requirements.txt | \
        xargs -I'{}' .venv/bin/pip --disable-pip-version-check install -r '{}'

	# python3 -m pip --disable-pip-version-check install \
	.venv/bin/pip --disable-pip-version-check install \
			pylint \
			mypy \
			autopep8 \
			;

provision: venv requirements  ## setup everything

clean:                        ## Remove .venv and other generated things if any.
	rm -rf .venv

.PHONY: vscode venv requirements provision clean

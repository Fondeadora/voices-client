# Python Layer Template

This is the Fondeadora Python serverless framework template.
It is intended to be used with Python v3.7 but could be updated to more recent versions.

## Contents

This template includes the following extra configurations:

- [serverless framework][1]
- [serverless-offline plugin][2]
- [serverless-plugin-git-variables][6]
- [serverless-plugin-warmup][7]
- [serverless-prune-plugin][8]
- [serverless-python-requirements][9]
- [Autopep8][3] code formatter
- [Flake8][4] for code linting
- [Pre-commit][5] framework to add extra git hooks

It will, by default set the stage to `dev` and the region to `us-east-1`.

Pre-commit is configured to run `pyformat` and `flake8` on the pre-commit hook.

## Usage

First you should have Node.js, yarn and Python v3.6 installed on your machine.

1. Install the `serverless` framework with

```shell
npm install -g serverless
```

2. Install the serverless framework plugins required.

```shell
npm install
```

3. Create a virtualenv for python

```shell
yarn venv-setup
```

4. Install python dependencies

```shell
pip install -r requirements-dev.txt
```

5. Install the pre-commit hooks.

```shell
pre-commit install
```

And that’s all.

To initialize a new repository using this template use the following command:

```shell
serverless create--template-url https://github.com/Fondeadora/python-service-template--path my-service
```

Make sure you replace `myService` with the name of your service and update the `service.name` in `serverless.yml` file.

Then start your development environment with

```
sls offline
```

## Scripts

```shell
# Deploy dev
yarn deploy

# Deploy production
yarn deploy-prod

# Test
python -m unittest discover
```

## Formatting and linting

```shell
make format
```

```shell
make lint
```

## Further notes

By default, pre-commit will not update the staging area, so make sure to review any changes that the black code formatter do to your files before restaging them.

Flake8 will fail if it encounters any errors, so you can review and fix them appropriately.

Make sure to add any new dependencies in the `requirements.txt` file.

## Suggestions

Please open an issue so we can discuss changes to this template.

[1]: https://serverless.com/
[2]: https://github.com/dherault/serverless-offline
[3]: https://black.readthedocs.io/en/stable/
[4]: http://flake8.pycqa.org/en/latest/
[5]: https://pre-commit.com/
[6]: https://github.com/jacob-meacham/serverless-plugin-git-variables
[7]: https://github.com/FidelLimited/serverless-plugin-warmup
[8]: https://github.com/claygregory/serverless-prune-plugin
[9]: https://github.com/UnitedIncome/serverless-python-requirements

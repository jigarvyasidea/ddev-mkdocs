[![tests](https://github.com/Metadrop/ddev-mkdocs/actions/workflows/tests.yml/badge.svg)](https://github.com/tadrop/ddev-mkdocs/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

## ddev-mkdocs

This is a ddev-addon for [mkdocs](https://www.mkdocs.org/), based on [Metadrop mkdocs docker image](https://github.com/Metadrop/docker-mkdocs).

MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

This addon just provides the basics to view mkdocs static site from docs/ folder on your project.

## Getting started

Install this addon with

```shell
ddev get Metadrop/ddev-mkdocs
```

After that you need to restart the ddev project:

```shell
ddev restart
```

## Using mkdocs

### Configuration

By default, mkdocs addon show docs from /docs folder inside yout project. This can be updated in docker-compose.mkdocs.yaml as needed.

Also this addon uses ports 9004 and 9005 to view documentation, this can be updated in docker-compose.mkdocs.yaml too. 

### Write your own documentation

To start building your docs you can read the [Mkdocs getting started guide](https://www.mkdocs.org/getting-started/) and for more advanced functionalities here is the [Mkdocs user guide](https://www.mkdocs.org/user-guide/)

### View the documentation

The backstop commands 'backstop remote' and 'backstop openReport' do not work in this setup.

But there is a host command that will open the latest test report in your default browser:

```shell
ddev backstop-results
```

Alternatively open the generated HTML-Report with your browser, e.g.:

```shell
open tests/backstop/backstop_data/_mytestproject_/html_report/index.html 
```

## Changes to the original docker image

The backstopjs docker image is extended with some functions using a custom docker build, see [Dockerfile](backstopBuild/Dockerfile)
and uses a custom [entrypoint](backstopBuild/entrypoint.sh).

In the Dockerfile the following is added/changed:

- add the custom entrypoint.sh to the image
- delete the default 'node' user with uid 1000 and add current ddev user
- install the [minimist](https://www.npmjs.com/package/minimist) npm package globally. This is not needed by default
  but very handy to parse command line args for more complex custom backstopjs configs.

The entrypoint is responsible for:

- add /etc/hosts entries for all hosts configured in the ddev web container automatically
- add sleep command to keep the container running

## Advanced

### How to add additional hostnames?

If you want to test hosts not configured in the web container, you need to use external_links in
[docker-compose.backstop.yaml](docker-compose.backstop.yaml).

See: [ddev FAQ: Can different projects communicate with each other?](https://ddev.readthedocs.io/en/latest/users/usage/faq/#features-requirements)

Do not forget to remove the #ddev-generated line!

### Change backstop tests directory
Per default the backstop directory containing backstop config etc. is expected in your project directory (besides the
.ddev folder) in the directory *tests/backstop*.

If you want to change that edit the file [docker-compose.backstop.yaml](docker-compose.backstop.yaml) and
change the line in volumes to the path you want to use, move the files to the new directory and restart ddev.

Make sure to remove the #ddev-generated line from the file to prevent ddev from making changes to it.

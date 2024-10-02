# DDEV MkDocs Add-on

[![tests](https://github.com/Metadrop/ddev-mkdocs/actions/workflows/tests.yml/badge.svg)](https://github.com/Metadrop/ddev-mkdocs/actions/workflows/tests.yml)  
![Project is Maintained](https://img.shields.io/maintenance/yes/2024.svg)  
![GitHub Release](https://img.shields.io/github/v/release/Metadrop/ddev-mkdocs)

## Table of Contents
* [What is DDEV MkDocs Add-on?](#what-is-ddev-mkdocs-add-on)
* [Getting Started](#getting-started)
* [Using MkDocs](#using-mkdocs)
  * [Configuration](#configuration)
  * [Write Your Own Documentation](#write-your-own-documentation)
  * [View the Documentation](#view-the-documentation)

## What is DDEV MkDocs Add-on?

This repository provides a [DDEV](https://ddev.readthedocs.io) add-on for the [MkDocs](https://www.mkdocs.org/) service, based on the [Metadrop MkDocs Docker image](https://github.com/Metadrop/docker-mkdocs). 

MkDocs is a static site generator designed for building project documentation. Source files are written in Markdown and configured using a YAML file. This add-on allows you to view MkDocs static sites from the `/docs/` folder in your DDEV project.

## Getting Started

### Install the Add-on:

```bash
ddev get Metadrop/ddev-mkdocs


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

To start building your docs you can read the [Mkdocs getting started guide](https://www.mkdocs.org/getting-started/) and for more advanced functionalities here is the [Mkdocs user guide](https://www.mkdocs.org/user-guide/).

### View the documentation

Mkdocs documentation can be accesed in https://${PROJECT_NAME}.ddev.site:9005


#This version of the README is structured for terminal-based instructions with proper Markdown formatting and link integration.


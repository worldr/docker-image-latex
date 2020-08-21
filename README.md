# docker image LaTeX

## Description

Docker image for LaTeX builds.

+ Based of `Ubuntu:latest`.
+ Contains both `texlive-full` and `texlive-latex-extra`.
+ Contains a few other thing, notably [graphviz](https://graphviz.org/).

## Push to docker hub

```bash
docker build -t worldr/latex:tagname .
docker login --username worldr --password-stdin
docker push worldr/latex:tagname
docker push new-repo:tagname
```

The Way Of Gitops tells us *this should be a GitHub action…*

## Pre-commit

This repository supports [pre-commit
hooks](https://pre-commit.com/hooks.html). To enable, just run:

```bash
python -m pip install -U pre-commit  # if needed.
pre-commit install
```

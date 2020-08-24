# docker image LaTeX

## Description

Docker image for LaTeX builds.

+ Based of `Ubuntu:latest`.
+ Contains both `texlive-full` and `texlive-latex-extra`.
+ Contains a few other thing, notably [graphviz](https://graphviz.org/).

## Release

The Way Of Gitops tells us *this should be a GitHub action…* And we are: just
create a tag with `bump2version` and GitHub action will kick in, build the
image, and push it. You need do nothing else.

## Pre-commit

This repository supports [pre-commit
hooks](https://pre-commit.com/hooks.html). To enable, just run:

```bash
python -m pip install -U pre-commit  # if needed.
pre-commit install
```

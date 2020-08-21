# Docker image for LaTeX builds.
FROM ubuntu:latest

ARG WGET=wget
ARG GIT=git
ARG SSH=openssh-client
ARG MAKE=make
ARG PANDOC=pandoc
ARG PCITEPROC=pandoc-citeproc
ARG PYGMENTS=python3-pygments
ARG FIG2DEV=fig2dev
ARG GRAPHVIZ=graphviz

RUN apt-get update && apt-get install -y \
  texlive-full \
  texlive-latex-extra \
  # Some auxiliary tools.
  "$WGET" \
  "$GIT" \
  "$SSH" \
  "$MAKE" \
  # Markup format conversion tool.
  "$PANDOC" \
  "$PCITEPROC" \
  # XFig utilities.
  "$FIG2DEV" \
  # Syntax highlighting package.
  "$PYGMENTS" \
  # Graphviz, mostly for dot.
  "$GRAPHVIZ" \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  apt-get --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff.
  apt-get clean -y

# Docker image for LaTeX builds.
FROM ubuntu:20.04

ARG WGET=wget
ARG GIT=git
ARG SSH=openssh-client
ARG MAKE=make
ARG PANDOC=pandoc
ARG PCITEPROC=pandoc-citeproc
ARG PYGMENTS=python3-pygments
ARG FIG2DEV=fig2dev
ARG GRAPHVIZ=graphviz

RUN DEBIAN_FRONTEND=noninteractive apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
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
        && \
    #   ↑ This ends the apt install command.
    # Removing documentation packages *after* installing them is a hack to
    # make the image smaller.
    apt --purge remove -y .\*-doc$ && \
    # Remove more unnecessary stuff.
    apt clean -y && \
    apt autoclean -y && \
    apt autoremove -y

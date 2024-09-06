FROM archlinux:latest

ADD . /sources/

RUN pacman -Syu --noconfirm base-devel namcap

RUN useradd -m builder

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

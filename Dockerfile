FROM archlinux:latest

RUN pacman -Syu --noconfirm base-devel namcap git

RUN useradd -m builder

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

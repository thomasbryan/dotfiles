FROM ubuntu:16.04
RUN apt-get update && apt-get install -qqmy \
    screen \
    shellinabox \
    sudo \
    supervisor \
    vim

RUN useradd -G sudo -m -p "\$6\$EFWpykT6\$GSt.AsTzZoganLEsR61bWN/lU8antZ8ddy0/YXxdXI3.qFUMrdZZTtHlHAH2tMlnq1KZt5uwDxSuU6yDyoud01" -s /bin/bash user

RUN mkdir /home/user/.dotfiles

COPY ./ /home/user/.dotfiles/

RUN chown -R user:user /home/user/

RUN su user -c "bash /home/user/.dotfiles/install.sh"

COPY supervisord.conf /etc/supervisor/supervisord.conf

COPY shellinabox.css /etc/shellinabox/shellinabox.css

VOLUME ["/nfs"]

CMD ["/usr/bin/supervisord"]

EXPOSE 4200

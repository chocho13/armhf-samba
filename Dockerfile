FROM troyfontaine/armhf-alpinelinux:3.4

RUN apk --no-cache add samba && mkdir /media/storage && chmod 0777 /media/storage \
    
COPY smb.conf /etc/samba/smb.conf

VOLUME /media/storage

EXPOSE 445

CMD ["/usr/sbin/smbd", "-s", "/etc/samba/smb.conf", "-F", "-S"]

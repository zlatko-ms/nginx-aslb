FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf.template /tmp/nginx.conf.template
COPY start.sh /start.sh
RUN touch /tmp/toto.titi.txt
RUN echo "truc" > /tmp/toto.titi.txt
RUN echo "machin" > /tmp/toto.titi.txt
RUN chmod +x /start.sh
CMD [ "/start.sh" ]

FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf.template /tmp/nginx.conf.template
COPY start.sh /start.sh
RUN echo "truc" > /tmp/truc.txt
RUN echo "machin" > /tmp/machin.txt
RUN chmod +x /start.sh
CMD [ "/start.sh" ]

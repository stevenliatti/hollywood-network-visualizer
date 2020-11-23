FROM nginx:latest
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

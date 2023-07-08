FROM nginx:alpine
# デフォルトで用意されている個別設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*
# Nginxの設定ファイルをコンテナにコピー
COPY nginx.conf /etc/nginx/nginx.conf
# Nginxをforeground起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

EXPOSE 80

FROM wordpress:5.2.3

RUN apt-get update && apt-get install telnet -y

RUN rm -rf /var/www/html/* 

#RUN ls -la /usr/src/wordpress/

RUN rm -rf /usr/src/wordpress/*

#RUN ls -la /usr/src/wordpress

ADD ./wordpress-site/ /usr/src/wordpress/

RUN chown -R www-data:www-data /usr/src/wordpress

# We need the entrypoint in order to load the static content in the right place
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]




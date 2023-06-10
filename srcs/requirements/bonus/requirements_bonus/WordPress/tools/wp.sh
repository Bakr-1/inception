cd /var/www/html/wordpress
wp core download  --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_DATABASE --dbuser=$DB_USER --dbpass=$DB_USERPASS --dbhost=$DB_HOSTNAME --dbprefix=wp_
wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN --title="$WORDPRESS_DB_TITLE" --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email=$WORDPRESS_DB_ADMIN_EMAIL
wp config set WP_CACHE true --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN --allow-root
wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $REDIS_PORT --allow-root
wp config set WP_REDIS_DATABASE $REDIS_DATABASE --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WORDPRESS_DB_USER $WORDPRESS_DB_USER_EMAIL --user_pass=$WORDPRESS_DB_USER_PASSWORD
wp theme install $WORDPRESS_THEME --activate --allow-root
wp plugin update --allow-root --all
wp option update --path="/var/www/html/wordpress" --allow-root blogdescription 'AALSERI WordPress Blog'
mkdir -p /run/php/
php-fpm7.3 -F
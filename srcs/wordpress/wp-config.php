<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '}!mR2Y[^Rkr|<#L?Q->F](UFHq%k-Iwm}.6oGTQq1?xW9NUf#v5aYMzd9~YKyOqe');
define('SECURE_AUTH_KEY',  '/[#i)(i:2&7F8;o&swE6|~-@7ndb-Er#guhCRHt||xgO)N6@[-w:l-NPKt&1FL({');
define('LOGGED_IN_KEY',    'k+(#:d/kUMOER1&LE$}02~8~[ayTePp%yU-;RiX_${J(A-{-`NTGI$a9+TL[3*{T');
define('NONCE_KEY',        'pidl6Y(+5,r2WC|Gy!Q;M^P Z^.QIprT4?B4;pPI^orJ[FZl:/47%SM1{A^,|Xx7');
define('AUTH_SALT',        'z]O+M-6W1 +n;Omb@J+qJqd1j[M_P4.9iuX~-i&6rYuu)<JO:&$ctZV||+G|E-.K');
define('SECURE_AUTH_SALT', 'n9@BtqhNht_2$,Mt%zmEbR?i?sP6K&5F(*5{*K&lfDZJqmDY8YEbD:!]eO=rA5 P');
define('LOGGED_IN_SALT',   'ii3;+:v8Bq-.j1WSV-E`yZXx6JxCb(h3Lp{a+eOqu4_f%Bw-_n`CZVU^.`T6jW=-');
define('NONCE_SALT',       '0LsP-:?<~lDJmlb>+dA/:D}pV,-Az:S{339bu1oifqBH[+2UnX@TUW)kZzkV+VO}');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
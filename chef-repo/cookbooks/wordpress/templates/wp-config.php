<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
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
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', '<your-password>' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '|,+Bu,M|[A-z%H&FdKSKg-BqErI)aXp1qFK/*xc{5De4v+t*P1f $0crUf5+wCQU');
define('SECURE_AUTH_KEY',  'Dg0/>w/#+ 34m,!j.#_NaWwk>K]5OU_m6n2R~<+B9/f]3UHIEGQXUi|h}3IW^,}6');
define('LOGGED_IN_KEY',    'Qr&IH6NfRx7n{XQU5g1f+9hn|N[J;Mj8Z(~F+wf>PDi#*ZXLAMx nzp98WZ,BE-L');
define('NONCE_KEY',        'Td|N)-)nhri7#j16(3-4lN74^;.#ptfMGf/vIm]~OVapPd`DULI9-c+m:9_!;Dho');
define('AUTH_SALT',        '@`~#XIto+oX(]y6Lm~%u17)btuln+-=-nz$)2o%67gE23dov,g]Rnzcz[/#l8|#=');
define('SECURE_AUTH_SALT', '4p%H;FrW#%|7Cw.>:^O0eNwi~-_T7z1P!Z^fLQ?Cga03$H~PDVQ|AqB0iNu]b~aa');
define('LOGGED_IN_SALT',   ',z1!{mWJe,@t:fLF2Z|zw]<xZF 3R}%`C-t#5,-{VxK?-16r>+zIU/Di*]{W/w?`');
define('NONCE_SALT',       'NOhB 5l6g)8]xC|/>%HHr4?,/[fc~pP-IC;xd%swH:-H6={XDOY9$SM@qa=Eo4sX');

/**#@-*/

/**
 * WordPress database table prefix.
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

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

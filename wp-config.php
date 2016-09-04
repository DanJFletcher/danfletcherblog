<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'i1198529_wp1');

/** MySQL database username */
define('DB_USER', 'i1198529_wp1');

/** MySQL database password */
define('DB_PASSWORD', 'Y&As@^of@U02[^8');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'HTEcYK2nRkWOG1l9zG3XjiBAG8vnallNxedO31yyP0pjEHufOSeEwZro8F0xMkaX');
define('SECURE_AUTH_KEY',  'HLdBDzXAmEEPUqLiF5YAZzu8BGq01WCblOzR6iM707NQELv2i9eqao9fAPYyrkTT');
define('LOGGED_IN_KEY',    'c8arCs0MHvia1lSE2uCZAmbfzPwtQhIviBh7eo9NS1VRnlmaxCFaJYcwj75kG4Vk');
define('NONCE_KEY',        '2TIR0btENsvcit3RjO0MeTLpCaBjkd43EYu47lV0GgxdZGsqtl74a589wc6fQWmD');
define('AUTH_SALT',        'CYytUpo9EFB0BvwH4c5NGOGloXpBm1THi1KkoUSGjp40q831f347WLLZmaxhQWSo');
define('SECURE_AUTH_SALT', 'FnGCOiNUkgTynMkngihReWfgfDNo76Hap4zAWRlXOcs4ZBms6fTA7883M3fwHfHw');
define('LOGGED_IN_SALT',   'LStERlYou8MGDmnNgah12nf0kceWo49X25uPSPYCqBLx8gt02VRyoPvU1k0I65ux');
define('NONCE_SALT',       'xRd4FYRnKJOksLdRGe9U3Ipn7fhoBRxgFH8vhvwazwGvR9N3kKlO3K7y4CqnXs8c');

/**
 * Other customizations.
 */
define('FS_METHOD','direct');define('FS_CHMOD_DIR',0755);define('FS_CHMOD_FILE',0644);
define('WP_TEMP_DIR',dirname(__FILE__).'/wp-content/uploads');

/**
 * Turn off automatic updates since these are managed upstream.
 */
define('AUTOMATIC_UPDATER_DISABLED', true);


/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

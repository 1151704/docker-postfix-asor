<?php

$config = [];

// DATABASE
# include_once("/etc/roundcube/debian-db-roundcube.php");
$config['db_dsnw'] = 'mysql://user1:passuser1@dbmysql:3306/roundcube';

// The IMAP host chosen to perform the log-in.
$config['default_host'] = 'postfixasor.com';

// SMTP server host (for sending mails).
$config['smtp_server'] = 'postfixasor.com';

// SMTP port. Use 25 for cleartext, 465 for Implicit TLS, or 587 for STARTTLS (default)
$config['smtp_port'] = 25;

$config['smtp_user'] = '';

$config['smtp_pass'] = '%p';

$config['support_url'] = '';

$config['product_name'] = 'Roundcube Webmail';

$config['des_key'] = '5VQekE1VRmSQKInO4UFPS/p0';

$config['plugins'] = [];

$config['skin'] = 'elastic';

$config['enable_spellcheck'] = false;

<?php
  $config['default_host'] = 'mail.postfixasor.local';
  $config['smtp_server'] = 'smtp.postfixasor.local';
  $config['smtp_port'] = 25;
  $config['smtp_user'] = '';
  $config['smtp_pass'] = '%p';
  $config['smtp_conn_options'] = [
    'ssl' => [
        'verify_peer_name'  => false,
    ],
  ];
<?php
require_once ('helpers.php');
require_once ('utils.php');

date_default_timezone_set('Europe/Moscow');

//$post_date = generate_random_date($index);

$page_content = include_template('main.php', ['cards' => $cards]);

$layout_content = include_template('layout.php', [
    'page_name' => 'readme: популярное',
    'content' => $page_content,
    'is_auth' => $is_auth,
    'user_name' => $user_name,

]);

print($layout_content);



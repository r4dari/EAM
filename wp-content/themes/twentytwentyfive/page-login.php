<?php
/*
Template Name: Login Page
*/

if ( is_user_logged_in() ) {
    wp_redirect( home_url('/?page_id=10') );
    exit;
}

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $creds = [
        'user_login'    => $_POST['log'] ?? '',
        'user_password' => $_POST['pwd'] ?? '',
        'remember'      => isset($_POST['rememberme']),
    ];
    $user = wp_signon($creds, false);
    if ( is_wp_error($user) ) {
        $error = $user->get_error_message();
    } else {
        wp_redirect( home_url('/?page_id=10') );
        exit;
    }
}

?>

<style>
.login-container {
    max-width: 320px;
    margin: 100px auto;
    padding: 30px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 6px;
    text-align: center;
}
.login-container input[type="text"],
.login-container input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 16px;
    border: 1px solid #bbb;
    border-radius: 4px;
    font-size: 14px;
}
.login-container input[type="submit"] {
    width: 100%;
    padding: 10px;
    background: #0073aa;
    border: none;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
    border-radius: 4px;
    transition: background 0.3s ease;
}
.login-container input[type="submit"]:hover {
    background: #005177;
}
.error-message {
    color: #b00020;
    margin-bottom: 12px;
    font-size: 13px;
}
</style>

<div class="login-container">
  <h1>Вход</h1>
  <?php if ($error): ?>
    <div class="error-message"><?php echo esc_html($error); ?></div>
  <?php endif; ?>
  <form method="post">
    <input type="text" name="log" placeholder="Имя пользователя" required autofocus>
    <input type="password" name="pwd" placeholder="Пароль" required>
    <input type="submit" value="Войти">
  </form>
</div>

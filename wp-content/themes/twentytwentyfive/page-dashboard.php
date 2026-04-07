<?php
/*
Template Name: Dashboard
*/
add_action('wp_head', function() {
    echo '<title>EAMS - Главная</title>';
});

$current_user = wp_get_current_user();
global $wpdb;
wp_head();
// =========== ХЕДЕР ===========
echo '<header>';
// ЛЕВАЯ ЧАСТЬ — название сайта (кликабельное)
echo '<div>';
echo '<a href="' . esc_url(home_url()) . '">Energy Asset Management System</a>';
echo '</div>';

// ПРАВАЯ ЧАСТЬ — пользователь + logout
if ( is_user_logged_in() ) {
    $logout_url = wp_logout_url(home_url());
    echo '<div class="user-panel">';
    echo '<span>' . esc_html($current_user->display_name) . '</span>';
    echo ' | <a href="' . esc_url($logout_url) . '">Выйти</a>';
    echo '</div>';
}
echo '</header>';

// =========== ФУНКЦИЯ ВЫВОДА ТАБЛИЦ ===========
function render_requests_table($requests) {
    if (empty($requests)) {
        echo '<p>Заявок не найдено.</p>';
        return;
    }

    echo '<table>';
    echo '<thead>
        <tr>
            <th>ID</th>
            <th>Тема</th>
            <th>Статус</th>
            <th>Создатель</th>
            <th>Комплекс</th>
            <th>Отдел</th>
            <th>Объект</th>
            <th>Адрес</th>
            <th>Исполнитель</th>
            <th>Дата создания</th>
            <th>Дата изменения</th>
        </tr>
    </thead>';
    
    echo '<tbody>';
    foreach ($requests as $request) {
        $link = site_url('/?page_id=12&request_id=' . intval($request->RequestID));
        echo '<tr>';
        echo '<td>' . esc_html($request->RequestID) . '</td>';
        echo '<td><a href="' . esc_url($link) . '">' . esc_html($request->Theme) . '</a></td>';
        echo '<td>' . esc_html($request->RequestStatus) . '</td>';
        echo '<td>' . esc_html($request->RequestCreator) . '</td>';
        echo '<td>' . esc_html($request->Department) . '</td>';
        echo '<td>' . esc_html($request->AssetGroup) . '</td>';
        echo '<td>' . esc_html($request->AssetName) . '</td>';
        echo '<td>' . esc_html($request->Address) . '</td>';
        echo '<td>' . esc_html($request->Executor) . '</td>';
        echo '<td>' . esc_html($request->DataCreation) . '</td>';
        echo '<td>' . esc_html($request->DateCompletion) . '</td>';
        echo '</tr>';
    }
    echo '</tbody>';
    echo '</table>';
}

// =========== ЛОГИКА ДЛЯ РОЛЕЙ ===========
if (in_array('manager', $current_user->roles)) {
    $requests = $wpdb->get_results("SELECT * FROM wp_requests ORDER BY DataCreation DESC");
    echo '<h2>Все заявки</h2>';
    render_requests_table($requests);

} elseif (in_array('admin_asset', $current_user->roles)) {
    $assets = $wpdb->get_results("SELECT * FROM wp_assets ORDER BY AssetName ASC");

    echo '<h2>Список активов</h2>';
    if (empty($assets)) {
        echo '<p>Активы не найдены.</p>';
    } else {
        echo '<table>';
        echo '<thead>
            <tr>
                <th>Название</th>
                <th>Тип</th>
                <th>Модель</th>
                <th>Группа</th>
                <th>Адрес</th>
                <th>Статус</th>
                <th>Текущая выработка</th>
                <th>Требуемая выработка</th>
                <th>Текущая квота</th>
                <th>Требуемая квота</th>
                <th>Последнее ТО</th>
                <th>Следующее ТО</th>
            </tr>
        </thead>';
        echo '<tbody>';
        foreach ($assets as $asset) {
            echo '<tr>';
            echo '<td>' . esc_html($asset->AssetName) . '</td>';
            echo '<td>' . esc_html($asset->AssetType) . '</td>';
            echo '<td>' . esc_html($asset->Model) . '</td>';
            echo '<td>' . esc_html($asset->AssetGroup) . '</td>';
            echo '<td>' . esc_html($asset->Address) . '</td>';
            echo '<td>' . esc_html($asset->AssetStatus) . '</td>';
            echo '<td>' . esc_html($asset->CurrentOutput) . '</td>';
            echo '<td>' . esc_html($asset->RequiredOutput) . '</td>';
            echo '<td>' . esc_html($asset->DueQuota) . '</td>';
            echo '<td>' . esc_html($asset->RequiredQuota) . '</td>';
            echo '<td>' . esc_html($asset->LastMaintenance) . '</td>';
            echo '<td>' . esc_html($asset->NextMaintenance) . '</td>';
            echo '</tr>';
        }
        echo '</tbody>';
        echo '</table>';
    }
    $requests = $wpdb->get_results("SELECT * FROM wp_requests ORDER BY DataCreation DESC");
    echo '<h2>Все заявки</h2>';
    render_requests_table($requests);
    echo '<div style="margin-top:20px;">';
    echo '<a href="' . esc_url(site_url('/?page_id=12')) . '" class="button">Добавить заявку</a>';
    echo '</div>';

} elseif (in_array('department_employee_a', $current_user->roles)) {
    $department = 'A';
    $requests = $wpdb->get_results(
        $wpdb->prepare(
            "SELECT * FROM wp_requests WHERE Department = %s ORDER BY DataCreation DESC",
            $department
        )
    );
    echo '<h2>Заявки отдела A</h2>';
    render_requests_table($requests);

} elseif (in_array('department_employee_b', $current_user->roles)) {
    $department = 'B';
    $requests = $wpdb->get_results(
        $wpdb->prepare(
            "SELECT * FROM wp_requests WHERE Department = %s ORDER BY DataCreation DESC",
            $department
        )
    );
    echo '<h2>Заявки отдела B</h2>';
    render_requests_table($requests);

} elseif (in_array('administrator', $current_user->roles)) {
    echo '<h2>Добро пожаловать, системный администратор!</h2>';
    get_footer();

} else {
    echo '<p>У вас нет прав для просмотра данной страницы.</p>';
}
?>
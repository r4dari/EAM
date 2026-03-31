<?php
/*
Template Name: Dashboard
*/

get_header();

$current_user = wp_get_current_user();
global $wpdb;

// Функция вывода таблицы заявок
function render_requests_table($requests) {
    if (empty($requests)) {
        echo '<p>Заявок не найдено.</p>';
        return;
    }

    echo '<table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width:100%;">';
    echo '<thead>
        <tr>
            <th>ID</th>
            <th>Статус</th>
            <th>Тема</th>
            <th>Исполнитель</th>
            <th>Отдел</th>
            <th>Создатель</th>
            <th>Комплекс</th>
            <th>Объект</th>
            <th>Адрес</th>
            <th>Дата создания</th>
            <th>Дата изменения</th>
        </tr>
    </thead>';
    
    echo '<tbody>';

    foreach ($requests as $request) {

        // Ссылка на страницу просмотра заявки (передаём ID)
        $link = site_url('/?page_id=12' . intval($request->RequestID));

        echo '<tr>';
        echo '<td>' . esc_html($request->RequestID) . '</td>';
        echo '<td>' . esc_html($request->RequestStatus) . '</td>';
        
        // КЛИКАБЕЛЬНАЯ ТЕМА
        echo '<td><a href="' . esc_url($link) . '">' . esc_html($request->Theme) . '</a></td>';
        
        echo '<td>' . esc_html($request->Executor) . '</td>';
        echo '<td>' . esc_html($request->Department) . '</td>';
        echo '<td>' . esc_html($request->RequestCreator) . '</td>';
        echo '<td>' . esc_html($request->AssetGroup) . '</td>';
        echo '<td>' . esc_html($request->AssetName) . '</td>';
        echo '<td>' . esc_html($request->Address) . '</td>';
        echo '<td>' . esc_html($request->DataCreation) . '</td>';
        echo '<td>' . esc_html($request->DateCompletion) . '</td>';
        echo '</tr>';
    }

    echo '</tbody>';
    echo '</table>';
}


// ================== MANAGER ==================
if (in_array('manager', $current_user->roles)) {

    $requests = $wpdb->get_results(
        "SELECT * FROM wp_requests ORDER BY DataCreation DESC"
    );

    echo '<h2>Все заявки</h2>';
    render_requests_table($requests);


// ================== ADMIN ASSET ==================
} elseif (in_array('admin_asset', $current_user->roles)) {

    // Получаем ВСЕ активы
    $assets = $wpdb->get_results(
        "SELECT * FROM wp_assets ORDER BY AssetName ASC"
    );

    echo '<h2>Список активов</h2>';

    if (empty($assets)) {
        echo '<p>Активы не найдены.</p>';
    } else {

        echo '<table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width:100%;">';
        
        echo '<thead>
            <tr>
                <th>Название</th>
                <th>Тип</th>
                <th>Модель</th>
                <th>Адрес</th>
                <th>Группа</th>
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
            echo '<td>' . esc_html($asset->Address) . '</td>';
            echo '<td>' . esc_html($asset->AssetGroup) . '</td>';
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

    // КНОПКА СОЗДАНИЯ ЗАЯВКИ
    echo '<div style="margin-top:20px;">';
    echo '<a href="' . esc_url(site_url('/?page_id=12')) . '" 
            style="display:inline-block; padding:10px 20px; background:#0073aa; color:#fff; text-decoration:none; border-radius:5px;">
            Добавить заявку
          </a>';
    echo '</div>';

// ================== DEPARTMENT A ==================
} elseif (in_array('department_employee_a', $current_user->roles)) {

    $department = 'A';

    $requests = $wpdb->get_results(
        $wpdb->prepare(
            "SELECT * FROM wp_requests 
             WHERE Department = %s 
             ORDER BY DataCreation DESC",
            $department
        )
    );

    echo '<h2>Заявки отдела A</h2>';
    render_requests_table($requests);


// ================== DEPARTMENT B ==================
} elseif (in_array('department_employee_b', $current_user->roles)) {

    $department = 'B';

    $requests = $wpdb->get_results(
        $wpdb->prepare(
            "SELECT * FROM wp_requests 
             WHERE Department = %s 
             ORDER BY DataCreation DESC",
            $department
        )
    );

    echo '<h2>Заявки отдела B</h2>';
    render_requests_table($requests);


// ================== NO ACCESS ==================
} else {
    echo '<p>У вас нет прав для просмотра данной страницы.</p>';
}
;
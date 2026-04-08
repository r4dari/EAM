<?php
/*
Template Name: Dashboard
*/

// Подключаем стили и скрипты DataTables в шапку
add_action('wp_head', function() {
    echo '<title>EAMS - Главная</title>';
    // CSS DataTables
    echo '<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">';
    // CSS для хедера и интеграции с вашим стилем
    echo '<style>
        /* ХЕДЕР: ТОЧНОЕ СООТВЕТСТВИЕ КАРТИНКЕ */
        header { 
            background-color: #006c9e; /* Синий цвет как на картинке */
            padding: 12px 30px; 
            margin-bottom: 30px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            border-top: 2px solid #a83232; /* Тонкая красная/фиолетовая линия сверху */
            border-bottom: 2px solid #a83232; /* Тонкая красная/фиолетовая линия снизу */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            font-family: sans-serif;
            color: #ffffff;
        }
        
        /* Левая часть хедера (название сайта) */
        header .site-title-container a { 
            color: #ffffff !important; 
            text-decoration: none; 
            font-weight: bold;
            font-size: 1.1em;
        }
        
        /* Правая часть хедера (пользователь и logout) */
        header .user-panel { 
            display: flex; 
            align-items: center; 
            color: #ffffff;
            font-weight: normal;
        }
        
        header .user-panel span { 
            font-weight: normal; 
        }

        header .user-panel .logout-link { 
            color: #ffffff !important; 
            text-decoration: none; 
            font-weight: bold;
            margin-left: 5px;
        }
        header .site-title-container a:hover, header .user-panel .logout-link:hover { 
            text-decoration: underline; 
        }

        /* Убираем стандартные рамки и настраиваем вид поиска */
        .dataTables_wrapper { font-family: sans-serif; margin-top: 10px; }
        
        /* СКРЫВАЕМ ПАГИНАЦИЮ И ИНФОРМАЦИЮ О ЗАПИСЯХ */
        .dataTables_paginate, .dataTables_info, .dataTables_length {
            display: none !important;
        }

        /* Стилизация таблицы под дизайн на скриншоте (заголовки) */
        table.dataTable thead th {
            background-color: #0073aa !important;
            color: white !important;
            border-bottom: 1px solid #005a87 !important;
        }
    </style>';
});

// Подключаем jQuery и JS DataTables в подвал
add_action('wp_footer', function() {
    echo '<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>';
    echo '<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>';
    ?>
    <script>
    $(document).ready(function() {
        // Инициализация всех таблиц с русским языком и ОТКЛЮЧЕННОЙ ПАГИНАЦИЕЙ
        $('table').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/ru.json"
            },
            "paging": false,      // ПОЛНОСТЬЮ ОТКЛЮЧАЕМ ПАГИНАЦИЮ (все строки будут одним списком)
            "info": false,        // Убираем надпись "Записи с 1 по X"
            "searching": true,    // Оставляем поиск
            "ordering": true,     // Оставляем сортировку
            "lengthChange": false // Убираем выбор количества записей
        });
    });
    </script>
    <?php
});

$current_user = wp_get_current_user();
global $wpdb;

wp_head();

// =========== ХЕДЕР ===========
echo '<header>';
// ЛЕВАЯ ЧАСТЬ — название сайта
echo '<div class="site-title-container">';
echo '<a href="' . esc_url(home_url()) . '">Energy Asset Management System</a>';
echo '</div>';

// ПРАВАЯ ЧАСТЬ — приветствие и logout
if ( is_user_logged_in() ) {
    $logout_url = wp_logout_url(home_url());
    echo '<div class="user-panel">';
    echo 'Привет,<span>' . esc_html($current_user->display_name) . '</span> | ';
    echo '<a href="' . esc_url($logout_url) . '" class="logout-link">Выйти</a>';
    echo '</div>';
}
echo '</header>';

// =========== ФУНКЦИЯ ВЫВОДА ТАБЛИЦ ===========
function render_requests_table($requests) {
    if (empty($requests)) {
        echo '<p>Заявок не найдено.</p>';
        return;
    }

    // Добавили class="display" для стилей и уникальный ID не нужен, если инитим через $('table')
    echo '<table class="display">'; 
    echo '<thead>
        <tr>
            <th>ID</th>
            <th>Тема</th>
            <th>Статус</th>
            <th>Создатель</th>
            <th>Отдел</th>
            <th>Комплекс</th>
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
echo '<div style="padding: 20px;">'; // Контейнер для отступов

if (in_array('manager', $current_user->roles)) {
    $requests = $wpdb->get_results("SELECT * FROM wp_requests ORDER BY DataCreation DESC");
    echo '<h2>Все заявки</h2>';
    render_requests_table($requests);

} elseif (in_array('admin_asset', $current_user->roles)) {
    $assets = $wpdb->get_results("SELECT * FROM wp_assets ORDER BY AssetName ASC");

    echo '<h2>Список активов</h2>';
    if (!empty($assets)) {
        echo '<table class="display">';
        echo '<thead>
            <tr>
                <th>Название</th>
                <th>Тип</th>
                <th>Модель</th>
                <th>Группа</th>
                <th>Адрес</th>
                <th>Статус</th>
                <th>Выработка (тек)</th>
                <th>Выработка (треб)</th>
                <th>Последнее ТО</th>
                <th>Следующее ТО</th>
            </tr>
        </thead><tbody>';
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
            echo '<td>' . esc_html($asset->LastMaintenance) . '</td>';
            echo '<td>' . esc_html($asset->NextMaintenance) . '</td>';
            echo '</tr>';
        }
        echo '</tbody></table>';
    }

    $requests = $wpdb->get_results("SELECT * FROM wp_requests ORDER BY DataCreation DESC");
    echo '<h2 style="margin-top:40px;">Все заявки</h2>';
    render_requests_table($requests);
    echo '<div style="margin-top:20px;"><a href="' . esc_url(site_url('/?page_id=12')) . '" style="padding:10px 20px; background:#0073aa; color:#fff; text-decoration:none; border-radius:3px;">Добавить заявку</a></div>';

} elseif (in_array('department_employee_a', $current_user->roles) || in_array('department_employee_b', $current_user->roles)) {
    $dept = in_array('department_employee_a', $current_user->roles) ? 'A' : 'B';
    $requests = $wpdb->get_results($wpdb->prepare("SELECT * FROM wp_requests WHERE Department = %s ORDER BY DataCreation DESC", $dept));
    echo "<h2>Заявки отдела $dept</h2>";
    render_requests_table($requests);

} elseif (in_array('administrator', $current_user->roles)) {
    echo '<h2>Добро пожаловать, системный администратор!</h2>';
} else {
    echo '<p>У вас нет прав для просмотра данной страницы.</p>';
}

echo '</div>'; // Конец контейнера
wp_footer(); // Не забываем вызвать, чтобы скрипты подключились
?>
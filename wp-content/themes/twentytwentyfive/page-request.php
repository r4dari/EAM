<?php
/*
Template Name: Request
*/
add_action('wp_head', function() {
    echo '<title>EAMS - Заявка</title>';
});

wp_head();
$current_user = wp_get_current_user();
global $wpdb;

// =========== ХЕДЕР ===========
echo '<header>';
echo '<div><a href="' . esc_url(home_url()) . '">Energy Asset Management System</a></div>';

if (is_user_logged_in()) {
    $logout_url = wp_logout_url(home_url());
    echo '<div class="user-panel">';
    echo '<span>Привет, ' . esc_html($current_user->display_name) . '</span>';
    echo ' | <a href="' . esc_url($logout_url) . '">Выйти</a>';
    echo '</div>';
}
echo '</header>';

if (!is_user_logged_in()) {
    echo '<p>Вы должны войти в систему.</p>';
    exit;
}

// ================== ПОЛУЧАЕМ ID ЗАЯВКИ ==================
$request_id = isset($_GET['request_id']) ? intval($_GET['request_id']) : 0;

if ($request_id > 0) {
    // ================== РЕДАКТИРОВАНИЕ / ПРОСМОТР ==================
    $request = $wpdb->get_row($wpdb->prepare(
        "SELECT * FROM wp_requests WHERE RequestID = %d",
        $request_id
    ));

    if (!$request) {
        echo '<p>Заявка не найдена.</p>';
        exit;
    }

    // ================== ОБРАБОТКА ФОРМЫ ==================
    if (isset($_POST['submit_edit'])) {
        $update_data = array();

        // Менеджер может менять Department, RequestStatus, Report, ReportFiles
        if (in_array('manager', $current_user->roles)) {
            $update_data['Department'] = sanitize_text_field($_POST['Department']);
            $update_data['RequestStatus'] = sanitize_text_field($_POST['RequestStatus']);
            $update_data['Report'] = sanitize_textarea_field($_POST['Report']);
        }

        // Исполнитель может менять только свой Report/ReportFiles
        if ($current_user->user_login === $request->Executor) {
            $update_data['Report'] = sanitize_textarea_field($_POST['Report']);
        }

        // Обработка файлов
        if (!empty($_FILES['ReportFiles']['name'])) {
            require_once(ABSPATH . 'wp-admin/includes/file.php');
            $uploadedfile = $_FILES['ReportFiles'];
            $upload_overrides = array('test_form' => false);
            $movefile = wp_handle_upload($uploadedfile, $upload_overrides);

            if ($movefile && !isset($movefile['error'])) {
                $update_data['ReportFiles'] = esc_url_raw($movefile['url']);
            } else {
                echo '<p style="color:red;">Ошибка загрузки файла: ' . esc_html($movefile['error']) . '</p>';
            }
        }

        if (!empty($update_data)) {
            $wpdb->update(
                'wp_requests',
                $update_data,
                array('RequestID' => $request_id),
                array_fill(0, count($update_data), '%s'),
                array('%d')
            );
            echo '<p style="color:green;">Данные заявки обновлены.</p>';
            // Обновляем объект заявки
            $request = $wpdb->get_row($wpdb->prepare(
                "SELECT * FROM wp_requests WHERE RequestID = %d",
                $request_id
            ));
        }
    }

    // ================== ПРИНЯТИЕ ЗАЯВКИ ==================
    if (isset($_POST['accept_request']) && empty($request->Executor) &&
        (in_array('department_employee_a', $current_user->roles) || in_array('department_employee_b', $current_user->roles))) {

        $wpdb->update(
            'wp_requests',
            array(
                'Executor' => $current_user->user_login,
                'RequestStatus' => 'In Progress'
            ),
            array('RequestID' => $request_id),
            array('%s','%s'),
            array('%d')
        );
        echo '<p style="color:green;">Вы приняли заявку в работу.</p>';

        $request = $wpdb->get_row($wpdb->prepare(
            "SELECT * FROM wp_requests WHERE RequestID = %d",
            $request_id
        ));
    }

    // ================== ФОРМА ОТОБРАЖЕНИЯ ==================
    ?>
    <h2>Просмотр заявки: <?php echo esc_html($request->Theme); ?></h2>

    <form method="post" enctype="multipart/form-data">
        <p><label>Комплекс:</label><br>
            <input type="text" value="<?php echo esc_html($request->AssetGroup); ?>" readonly></p>

        <p><label>Объект:</label><br>
            <input type="text" value="<?php echo esc_html($request->AssetName); ?>" readonly></p>

        <p><label>Адрес:</label><br>
            <input type="text" value="<?php echo esc_html($request->Address); ?>" readonly></p>

        <p><label>Описание:</label><br>
            <textarea readonly style="width:100%; height:100px;"><?php echo esc_html($request->Description); ?></textarea></p>

        <p><label>Исполнитель:</label><br>
            <input type="text" value="<?php echo esc_html($request->Executor); ?>" readonly></p>

        <p><label>Отдел:</label><br>
            <?php if (in_array('manager', $current_user->roles)) : ?>
                <select name="Department">
                    <option value="">Выберите отдел</option>
                    <option value="A" <?php selected($request->Department, 'A'); ?>>A</option>
                    <option value="B" <?php selected($request->Department, 'B'); ?>>B</option>
                </select>
            <?php else : ?>
                <input type="text" value="<?php echo esc_html($request->Department); ?>" readonly>
            <?php endif; ?>
        </p>

        <p><label>Статус заявки:</label><br>
            <?php if (in_array('manager', $current_user->roles)) : ?>
                <select name="RequestStatus">
                    <option value="New" <?php selected($request->RequestStatus, 'New'); ?>>New</option>
                    <option value="In Progress" <?php selected($request->RequestStatus, 'In Progress'); ?>>In Progress</option>
                    <option value="Completed" <?php selected($request->RequestStatus, 'Completed'); ?>>Completed</option>
                </select>
            <?php else : ?>
                <input type="text" value="<?php echo esc_html($request->RequestStatus); ?>" readonly>
            <?php endif; ?>
        </p>

        <p><label>Report:</label><br>
            <textarea name="Report" style="width:100%; height:100px;" <?php if(!in_array('manager', $current_user->roles) && $current_user->user_login !== $request->Executor) echo 'readonly'; ?>><?php echo esc_textarea($request->Report); ?></textarea>
        </p>

        <p><label>Report Files:</label><br>
            <?php if(!empty($request->ReportFiles)) : ?>
                <a href="<?php echo esc_url($request->ReportFiles); ?>" target="_blank">Скачать текущий файл</a><br>
            <?php endif; ?>
            <?php if(in_array('manager', $current_user->roles) || $current_user->user_login === $request->Executor) : ?>
                <input type="file" name="ReportFiles">
            <?php endif; ?>
        </p>

        <?php if(($current_user->user_login === $request->Executor && !empty($request->Executor)) || in_array('manager', $current_user->roles)) : ?>
            <p><button type="submit" name="submit_edit">Сохранить изменения</button></p>
        <?php endif; ?>

        <?php if(empty($request->Executor) && (in_array('department_employee_a', $current_user->roles) || in_array('department_employee_b', $current_user->roles))) : ?>
            <p><button type="submit" name="accept_request">Принять заявку</button></p>
        <?php endif; ?>
    </form>
    <?php

} else {
    // ================== СОЗДАНИЕ НОВОЙ ЗАЯВКИ ==================
    echo '<h2>Создание новой заявки</h2>';

    if (isset($_POST['submit_request'])) {
        $asset_group = sanitize_text_field($_POST['AssetGroup']);
        $asset_name  = sanitize_text_field($_POST['AssetName']);
        $theme       = sanitize_text_field($_POST['Theme']);
        $description = sanitize_textarea_field($_POST['Description']);

        $address = $wpdb->get_var($wpdb->prepare(
            "SELECT Address FROM wp_assets WHERE AssetName = %s LIMIT 1",
            $asset_name
        ));

        $result = $wpdb->insert(
            'wp_requests',
            array(
                'RequestCreator' => $current_user->user_login,
                'AssetGroup'     => $asset_group,
                'AssetName'      => $asset_name,
                'Address'        => $address,
                'Description'    => $description,
                'Theme'          => $theme,
                'Report'         => '',
                'ReportFiles'    => '',
                'Department'     => '',
                'Executor'       => '',
                'RequestStatus'  => 'New',
                'DataCreation'   => current_time('mysql'),
                'DateCompletion' => current_time('mysql')
            ),
            array('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')
        );

        if ($result === false) {
            echo '<p style="color:red;">Ошибка SQL: ' . esc_html($wpdb->last_error) . '</p>';
        } else {
            echo '<p style="color:green;">Заявка успешно создана! ID: ' . $wpdb->insert_id . '</p>';
        }
    }

    // ================== ФОРМА СОЗДАНИЯ ==================
    $groups = $wpdb->get_col("SELECT DISTINCT AssetGroup FROM wp_assets ORDER BY AssetGroup ASC");
    $assets = $wpdb->get_results("SELECT AssetName, AssetGroup, Address FROM wp_assets");
    ?>

    <form method="post">
        <p><label>Комплекс:</label><br>
            <select name="AssetGroup" id="asset_group" required>
                <option value="">Выберите комплекс</option>
                <?php foreach ($groups as $group): ?>
                    <option value="<?php echo esc_attr($group); ?>"><?php echo esc_html($group); ?></option>
                <?php endforeach; ?>
            </select>
        </p>

        <p><label>Объект:</label><br>
            <select name="AssetName" id="asset_name" required>
                <option value="">Сначала выберите комплекс</option>
            </select>
        </p>

        <p><label>Адрес:</label><br>
            <input type="text" id="address" readonly style="width:100%;">
        </p>

        <p><label>Тема:</label><br>
            <input type="text" name="Theme" required style="width:100%;">
        </p>

        <p><label>Описание:</label><br>
            <textarea name="Description" required style="width:100%; height:120px;"></textarea>
        </p>

        <p><button type="submit" name="submit_request">Отправить заявку</button></p>
    </form>

    <script>
        const assets = <?php echo json_encode($assets); ?>;
        const groupSelect = document.getElementById('asset_group');
        const nameSelect  = document.getElementById('asset_name');
        const addressInput = document.getElementById('address');

        groupSelect.addEventListener('change', function() {
            const selectedGroup = this.value;
            nameSelect.innerHTML = '<option value="">Выберите объект</option>';
            addressInput.value = '';

            assets.forEach(asset => {
                if (asset.AssetGroup === selectedGroup) {
                    const option = document.createElement('option');
                    option.value = asset.AssetName;
                    option.textContent = asset.AssetName;
                    option.dataset.address = asset.Address;
                    nameSelect.appendChild(option);
                }
            });
        });

        nameSelect.addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            addressInput.value = selectedOption.dataset.address || '';
        });
    </script>

    <?php
}
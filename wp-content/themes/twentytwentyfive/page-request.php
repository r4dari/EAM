<?php
/*
Template Name: Request
*/

get_header();

if (!is_user_logged_in()) {
    echo '<p>Вы должны войти в систему.</p>';
    get_footer();
    exit;
}

$current_user = wp_get_current_user();
global $wpdb;

// Только для admin_asset
if (!in_array('admin_asset', $current_user->roles)) {
    echo '<p>У вас нет прав для просмотра данной страницы.</p>';
    get_footer();
    exit;
}


// ================= ОБРАБОТКА ФОРМЫ =================
if (isset($_POST['submit_request'])) {

    $asset_group = sanitize_text_field($_POST['AssetGroup']);
    $asset_name  = sanitize_text_field($_POST['AssetName']);
    $theme       = sanitize_text_field($_POST['Theme']);
    $description = sanitize_textarea_field($_POST['Description']);

    // Получаем адрес по AssetName
    $address = $wpdb->get_var(
        $wpdb->prepare(
            "SELECT Address FROM wp_assets WHERE AssetName = %s LIMIT 1",
            $asset_name
        )
    );

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
        array(
            '%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s'
        )
    );

    if ($result === false) {
        echo '<pre style="color:red;">';
        echo 'Ошибка SQL: ' . $wpdb->last_error;
        echo '</pre>';
    } else {
        echo '<p style="color:green;">Заявка создана! ID: ' . $wpdb->insert_id . '</p>';
    }

    echo '<p style="color:green;">Заявка успешно создана!</p>';
}


// ================= ДАННЫЕ ДЛЯ SELECT =================

// Все группы
$groups = $wpdb->get_col("SELECT DISTINCT AssetGroup FROM wp_assets ORDER BY AssetGroup ASC");

// Все активы (для JS)
$assets = $wpdb->get_results("SELECT AssetName, AssetGroup, Address FROM wp_assets");

?>

<h2>Создание заявки</h2>

<form method="post">

    <!-- AssetGroup -->
    <p>
        <label>Комплекс:</label><br>
        <select name="AssetGroup" id="asset_group" required>
            <option value="">Выберите комплекс</option>
            <?php foreach ($groups as $group): ?>
                <option value="<?php echo esc_attr($group); ?>">
                    <?php echo esc_html($group); ?>
                </option>
            <?php endforeach; ?>
        </select>
    </p>

    <!-- AssetName -->
    <p>
        <label>Объект:</label><br>
        <select name="AssetName" id="asset_name" required>
            <option value="">Сначала выберите комплекс</option>
        </select>
    </p>

    <!-- Address -->
    <p>
        <label>Адрес:</label><br>
        <input type="text" id="address" readonly style="width:100%;">
    </p>

    <!-- Theme -->
    <p>
        <label>Тема:</label><br>
        <input type="text" name="Theme" required style="width:100%;">
    </p>

    <!-- Description -->
    <p>
        <label>Описание:</label><br>
        <textarea name="Description" required style="width:100%; height:120px;"></textarea>
    </p>

    <p>
        <button type="submit" name="submit_request">
            Отправить заявку
        </button>
    </p>

</form>


<script>
const assets = <?php echo json_encode($assets); ?>;

const groupSelect = document.getElementById('asset_group');
const nameSelect  = document.getElementById('asset_name');
const addressInput = document.getElementById('address');

// При выборе группы
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

// При выборе объекта
nameSelect.addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    addressInput.value = selectedOption.dataset.address || '';
});
</script>
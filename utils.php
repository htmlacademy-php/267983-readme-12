<?php

$is_auth = rand(0, 1);

$user_name = 'Константин'; // укажите здесь ваше имя

$page_name = 'readme: популярное';

$cards = [
    [
        'header' => 'Цитата',
        'type' => 'post-quote',
        'content' => 'Мы в жизни любим только раз, а после ищем лишь похожих',
        'username' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'header' => '<script>alert(1)</script>Игра престолов',
        'type' => 'post-text',
        'content' => 'Не могу дождаться начала финального сезона своего любимого сериала!',
        'username' => 'Владик',
        'avatar' => 'userpic.jpg'
    ],
    [
        'header' => 'Рыбный текст',
        'type' => 'post-text',
        'content' => 'Идейные соображения высшего порядка, а также консультация с широким активом требуют определения
        и уточнения позиций, занимаемых участниками в отношении поставленных задач. С другой стороны начало
        повседневной работы по формированию позиции способствует подготовки и реализации позиций, занимаемых участниками
         в отношении поставленных задач. Товарищи! реализация намеченных плановых заданий влечет за собой процесс
         внедрения и модернизации дальнейших направлений развития. Товарищи! начало повседневной работы по формированию
          позиции способствует подготовки и реализации направлений прогрессивного развития. Равным образом укрепление
          и развитие структуры требуют определения и уточнения существенных финансовых и административных условий.
          С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает
          широкому кругу (специалистов) участие в формировании соответствующий условий активизации. Идейные соображения
          высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности играет
          важную роль в формировании позиций, занимаемых участниками в отношении поставленных задач.
          С другой стороны рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в
          формировании системы обучения кадров, соответствует насущным потребностям.',
        'username' => 'Владик',
        'avatar' => 'userpic.jpg'
    ],
    [
        'header' => 'Наконец, обработал фотки!',
        'type' => 'post-photo',
        'content' => 'rock-medium.jpg',
        'username' => 'Виктор',
        'avatar' => 'userpic-mark.jpg'
    ],
    [
        'header' => 'Моя мечта',
        'type' => 'post-photo',
        'content' => 'coast-medium.jpg',
        'username' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'header' => 'Лучшие курсы',
        'type' => 'post-link',
        'content' => 'www.htmlacademy.ru',
        'username' => 'Владик',
        'avatar' => 'userpic.jpg'
    ]
];

function text_content_limit(string $text, int $limit = 300) : string
{
    if (mb_strlen($text) <= $limit) {
        return "<p>{$text}</p>";
    }

    $preview_content = mb_substr($text, 0, $limit);

    $stop_index = mb_strrpos($preview_content, ' ');

    $result = mb_substr($preview_content, 0, $stop_index);

    return "
        <p>
            {$result}...
            <br>
            <a class=\"post-text__more-link\" href=\"#\">Читать далее</a>
        </p>
        ";
}




function date_formatter(string $date, string $type='datetime') : string
{

    // tag  - относительный формат
    // title - в формате “дд.мм.гггг чч:мм”
    // datetime - оригинальный формат


    $post_time = strtotime($date);


    if ($type === 'datetime') {
        return $date;
    }

    elseif ($type === 'tag') {

        $current_time = time();

        $delta = $current_time - $post_time;

        $minutes = floor($delta/60);
        $hours = floor($delta/3600);
        $days = floor($delta/86400);
        $weeks = floor($delta/604800);
        $months = floor($delta/2629743);

        if ($minutes <= 60) {
            return $minutes . get_noun_plural_form($minutes, " минуту"," минуты"," минут") . " назад";
        } elseif ($hours <= 24) {
            return $hours . get_noun_plural_form($hours, " час"," часа"," часов") . " назад";
        } elseif ($days <= 7) {
            return $days . get_noun_plural_form($days, " день"," дня"," дней") . " назад";
        } elseif ($weeks <= 5) {
            return $weeks . get_noun_plural_form($weeks, " неделю"," недели"," недель") . " назад";
        }

        return $months . get_noun_plural_form($months, " месяц"," месяца"," месяцев") . " назад";
    }

    // ниже формат для аттрибута title

    return date('d.m.Y H:i', $post_time);


}





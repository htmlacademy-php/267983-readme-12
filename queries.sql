-- запросы для добавления информации в БД:

-- список типов контента для поста;

INSERT INTO `content_types` SET
                                `content_type_name` = 'Текст',
                                `icon_class_name` = 'text';

INSERT INTO `content_types` SET
                                `content_type_name` = 'Цитата',
                                `icon_class_name` = 'quote';

INSERT INTO `content_types` SET
                                `content_type_name` = 'Картинка',
                                `icon_class_name` = 'photo';

INSERT INTO `content_types` SET
                                `content_type_name` = 'Видео',
                                `icon_class_name` = 'video';

INSERT INTO `content_types` SET
                                `content_type_name` = 'Ссылка',
                                `icon_class_name` = 'link';

-- добавление пользователей;

INSERT INTO `users` SET
                        `login` = 'Лариса',
                        `password` = 'secret',
                        `email` = 'larisa@example.com',
                        `avatar` = 'userpic-larisa-small.jpg';

INSERT INTO `users` SET
                        `login` = 'Владик',
                        `password` = 'letmein',
                        `email` = 'vladik@example.com',
                        `avatar` = 'userpic.jpg';

INSERT INTO `users` SET
                        `login` = 'Виктор',
                        `password` = 'qwe123!@#',
                        `email` = 'viktor@example.com',
                        `avatar` = 'userpic-mark.jpg';


-- добавление существующего списка постов (находится в utils.php);

INSERT INTO `posts` SET
                        `post_header` = 'Цитата',
                        `post_content` = 'Мы в жизни любим только раз, а после ищем лишь похожих',
                        `post_author_id` = 1,
                        `post_content_type_id` = 2;


INSERT INTO `posts` SET
                        `post_header` = 'Игра престолов',
                        `post_content` = 'Не могу дождаться начала финального сезона своего любимого сериала!',
                        `post_author_id` = 2,
                        `post_content_type_id` = 1;


INSERT INTO `posts` SET
                        `post_header` = 'Наконец, обработал фотки!',
                        `image` = 'rock-medium.jpg',
                        `post_author_id` = 3,
                        `post_content_type_id` = 3;


INSERT INTO `posts` SET
                        `post_header` = 'Моя мечта',
                        `image` = 'coast-medium.jpg',
                        `post_author_id` = 2,
                        `post_content_type_id` = 3;


INSERT INTO `posts` SET
                        `post_header` = 'Лучшие курсы',
                        `website_link` = 'www.htmlacademy.ru',
                        `post_author_id` = 1,
                        `post_content_type_id` = 5;


-- добавление комментариев к разным постам;

INSERT INTO `comments` SET
                        `comment_content` = 'Ого!',
                        `comment_author_id` = 1,
                        `comment_post_id` = 4;

INSERT INTO `comments` SET
                           `comment_content` = 'Вау!',
                           `comment_author_id` = 2,
                           `comment_post_id` = 4;


INSERT INTO `comments` SET
                           `comment_content` = '+1',
                           `comment_author_id` = 2,
                           `comment_post_id` = 5;

INSERT INTO `comments` SET
                           `comment_content` = 'Отлично вышло',
                           `comment_author_id` = 2,
                           `comment_post_id` = 3;


-- запросы для действий:


-- получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;

SELECT p.post_header, p.post_content, ct.content_type_name, u.login FROM posts p
    JOIN users u ON p.post_author_id = u.id
    JOIN content_types ct ON post_content_type_id = ct.id

    ORDER BY p.views_quantity DESC;

-- получить список постов для конкретного пользователя;


SELECT * FROM `posts` WHERE `post_author_id` = 1;

-- или

SELECT * FROM `posts` WHERE `post_author_id` = (SELECT `id` FROM `users` WHERE `login` = 'Лариса');

-- получить список комментариев для одного поста, в комментариях должен быть логин пользователя;

SELECT c.comment_content, u.login FROM comments c JOIN users u ON u.id = c.comment_author_id WHERE c.comment_post_id = 4;


-- добавить лайк к посту;
-- пользователь Лариса (id = 1) лайкает пост "Лучшие курсы" (id = 5)

INSERT INTO `likes` SET `like_author_id` = 1, `like_post_id` = 5;


-- подписаться на пользователя.
-- пользователь Лариса (id = 1) подписывается на Владика (id = 2)


INSERT INTO `subscriptions` SET `subscription_from_id` = 1, `subscription_to_id` = 2;



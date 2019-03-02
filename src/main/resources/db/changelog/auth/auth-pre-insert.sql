
INSERT INTO oauth_client_details
    (client_id, client_secret, scope, authorized_grant_types,
    web_server_redirect_uri, authorities, access_token_validity,
    refresh_token_validity, additional_information, autoapprove)
VALUES
    ('clientId', '$2a$10$nBWw3Q9apCppaVIwoexgNuqqO0NSZLvuJ6zK3PiX/OHtR6keoHUuy', 'read,write',
    'password,authorization_code,refresh_token', null, 'ADMIN,USER', 360000, 360000, null, true);

INSERT INTO `users` (`first_name`, `last_name`, `email`, `password`) VALUES ('admin', 'admin', 'admin@test.com', '$2a$10$xNTAmjpOHBGJ6LGhHuN./etFdi/YuFUwFe.GiXluPoUuyYylnXbt.');
INSERT INTO `roles` (`name`, `code`) VALUES ('Admin', 'ADMIN'), ('User', 'USER');

SET @adminUserId = (SELECT `id` FROM `users` WHERE `email`='admin@test.com');
SET @adminRoleId = (SELECT `id` FROM `roles` WHERE `code`='ADMIN');

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES (@adminUserId, @adminRoleId);
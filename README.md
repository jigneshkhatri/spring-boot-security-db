# spring-boot-security-db
Demo project for Spring Boot Security OAuth2 With MySQL Database.

OAuth2 authentication and role based authorization for spring boot project, with user and client credentials stored in MySQL database. Tokens (access and refresh) are stored in database as well. Passwords are encrypted with BCrypt algorithm.

### Libraries used:
* Spring boot
* Spring data JPA and Hibernate
* Liquibase (for database management)
* Spring security
* Spring OAuth2

### Database description:
Below are the main tables which will be used in authentication/authorization process.
* _**users**_ table: Contains basic user details (email and password) used for user to login. Here BCrypt encrypted passwords are stored.
* _**roles**_ table: Contains allowed roles.
* _**user_role**_ table: Mapping table to user and role.
* _**oauth_client_details**_ table: Contains client related details.
* _**oauth_access_token**_ table: Contains access tokens for authenticated users.
* _**oauth_refreh_token**_ table: Contains refresh tokens for authenticated users.

### NOTE:
If you add more roles, you will also need to add those roles in _**RolesEnum**_ and update antMatchers in _**ResourceServerConfig**_ class.

### Project configurations - application.properties:
* **Database configuration**: You can modify database related configurations in _application.properties_.
* _/spring-security-demo/api_ is context path of this project. You can modify it as per you choice.

### How to run this project:
To run the project, open the command-line at the project's root directory, and run this command: **mvnw spring-boot:run**. It will automatically create the database, required tables, and insert preliminary data.

### Endpoints of interest:
* _http://localhost:8080/spring-security-demo/api/oauth/token_
  * This will provide authenticate the user and provide access and refresh tokens.
  * Method: **POST**
  * Content-Type: **application/x-www-form-urlencoded**
  * Body: 
    * username: **admin@test.com**
    * password: **123456**
    * grant_type: **password**
    * client_id: **clientId**
    * client_secret: **clientSecret**
* _http://localhost:8080/spring-security-demo/api/test_
  * This is open route, accessible to all users without authentication.
  * Method: **GET**
* _http://localhost:8080/spring-security-demo/api/s/adm/test_
  * All the APIs which start from **/s/adm/*** will be only accessible to authenticated users with **ADMIN** role. So this is test endpoint for ADMIN user.
  * Method: **GET**
* _http://localhost:8080/spring-security-demo/api/s/usr/test_
  * All the APIs which start from **/s/usr/*** will be only accessible to authenticated users with **USER** role. So this is test endpoint for NORMAL but authenticated user.
  * Method: **GET**

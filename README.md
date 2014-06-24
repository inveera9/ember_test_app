ember_test_app
==============

In this application we are using rails 4, ruby 2 , ember js, devise, rolify, cancancan to create a basic app with login/logout functionality and managing posts using authoriziation.

Steps  required to go through app:

1.  Bundle install

2. rake db:create

3. rake db:migrate

4. rails s

5. Register a new user: mention the the role as "user" or "admin" in role text box and register.

6. To check for cancancan and rolify : If user role is "user" edit button will be showing up for user else  for guest edit button will not show and if user role is "admin", admin user can only create a post can not edit.
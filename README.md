The website will have the following specification:

Directions for setting up a database

- Connect to psql
- Create the database using the psql command CREATE DATABASE bookmark_manager;
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the query we have saved in the file 01_create_bookmarks_table.sql

In order to test code you may want to look at setting up a test database to go along with this.
Follow the steps below to set this up

```
$ psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

```
As a user,
So I can see my stored bookmarks
It should show a list of bookmarks
```

</p>
<br>
<p align="center">
<img src="images/user_story_1.png" width="50%">
<br><br>
</p>

```
As a user,
So I can update my list
I want to add new bookmarks
```

```
As a user,
So I can remove old bookmarks
I want to delete bookmarks
```

```
As a user,
So I can edit existing bookmarks
I want to be able to update bookmarks
```

```
As a user,
So I details about my bookmarks
I want to be able to comment on bookmarks
```

```
As a user,
So I can organise my bookmarks
I want to be able to tag bookmarks into categories
```

```
As a user,
So I can see specified bookmarks
I want to filter bookmarks by tag
```

```
As a user,
To control access to my bookmarks
Users are restricted to manage only their own bookmarks
```

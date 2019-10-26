# S Q L through Active Record

### Introduction

The following is the first part of a tutorial meant to explore the basics of S Q L through the O R M Active Record.

S Q L is everywhere. It’s been the standard for making sophisticated and fast databases for decades and can be used for both native and web applications. Although newer No S Q L database technology is gaining an ever greater share with the advent of Node, it doesn’t really doesn’t look like S Q L is going anywhere. The internet was built with S Q L. Moreover, popular web frameworks like Rails and Django use O R Ms to establish databases. For those who lack a background in Computer Science, are looking for a quick in to the job market, or are just reading this for love of the game, I hope this tutorial helps create a decent foundation upon which to learn more.

For purposes of expedience, we’ll establish a database using Active Record and Rails. In Part Two we’ll see how we can get the very same results by writing S Q L queries. The final part will be about establishing the very same database schema that Active Record made for us using the D B M S, My S Q L.

### 1

Create a Rails API with a My S Q L database. In terminal: `rails new cmon-learn-some-sql --api --database=mysql`

Make sure your database is properly configured. In `cmon-learn-some-sql/config/database.yml`, line 17, set your password as a string to the one you chose when you installed My S Q L.

Let’s create a model-table to make sure our database is properly set up. In terminal: `rails g model test`

Set up our database: `rails db:setup`

Migrate our model: `rails db:migrate`

Cool. Now we’ll use My S Q L to take a peak at the database we just made (note the remainder of the code snips in this tutorial are meant to be entered in terminial): `mysql -u root -p`

Enter your mysql password.

Now we’ve started a My S Q L session. First we’ll look for our database: `SHOW DATABASES;`

Then choose our database: `USE cmon_learn_some_sql_development;`

We can now check if our model is there `SHOW TABLES;`

Finally, we’ll have a look at the table for model Test that we just created: `DESCRIBE tests;`

Exit My S Q L: `EXIT`;

Before we wrap up this part, let’s get rid of the Test model and its corresponding table :

`rails d model test
rails g migration drop_tests
`

In `db/migrate`, select the migration file with the timestamp followed by `_drop_tests.rb`. Between `def change` and `end`, write `drop_table: tests`.

Then, in terminal:

`rails db:migrate`

This will remove the table generated with the model.

In the following part, we’ll seed a database using Rails, then compare syntax between Active Record and S Q L.

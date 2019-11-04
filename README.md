# S Q L through Active Record

### Introduction

The following is the first part of a tutorial meant to explore the basics of S Q L through the O R M Active Record.

S Q L is everywhere. It’s been the standard for making sophisticated and fast databases for decades and can be used for both native and web applications. Although newer No S Q L database technology is gaining an ever greater share with the advent of Node, it doesn’t really doesn’t look like S Q L is going anywhere. The internet was built with S Q L. Moreover, popular web frameworks like Rails and Django use O R Ms to establish databases. For those who lack a background in Computer Science, are looking for a quick in to the job market, or are just reading this for love of the game, I hope this tutorial helps create a decent foundation upon which to learn more.

For purposes of expedience, we’ll establish a database using Active Record and Rails. In Part Two we’ll see how we can get the very same results by writing S Q L queries. The final part will be about establishing the very same database schema that Active Record made for us using the D B M S, My S Q L.

### 1

Link to blog: https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-484a3779aa2f

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

### 2

For the images referenced in this section, visit the blog where this article was originally posted: https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

For my second and best S Q L teacher, who provided both for my capability to write this series, as well as inspired the modeling of this application. See all of his tutorials here.

The previous part of this series.

We last finished with a Rails API using My S Q L as our database. Now, let’s make a schema for our database based on the following propositions:

* A company has many branches.
* A branch has many employees, but an employee only has one branch.
* Employees are not just related as peers — members of the same class, but also hierarchically.
* Each employee can have one direct superior and each superior can have multiple direct inferiors.
* Employees have many clients, associated by sales they’ve made to those clients.
* Clients know employees through the things they’ve bought from the company, through employees a*the company.

The banner at the top of this article models the domain that these propositions describe. Let’s code it out, starting in the terminal. In /cmon-learn-some-sql, we’ll use the model generator to make both classes and the tables that they’re related to.

We want the model Branch to look like this:

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

Active Record will auto-generate the I D, set it to primary, and auto-increment it, plus give us the timestamps created_at and updated_at. So in the terminal we need only:

rails g model Branch name:string

We want Employee to look like this:

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

We’ll declare the four columns, and let Active Record take care of the rest.

rails g model Employee name:string birth_date:date salary:integer manager:boolean

Client should look like:

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

We’ll just tell Active Record to make a column “name”, as before.

rails g model Client name:string

Now, we need join tables as reference for our main models. The first will have to join an employee and the branch that they work at.

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

rails g model BranchEmployee branch_id:integer employee_id:integer

I named the model that joins employees in a relationship of command “SuperiorInferior”.

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

Finally, employees and clients are related through sales. In addition to the I D’s of both these instances, we’ll also track the amount of the sale that exists between them.

https://medium.com/@josephgavinsyverson/s-q-l-through-active-record-pt-two-8a353ee14f48

Run:

rails g model Sale employee_id:integer client_id:integer amount:integer

All done. Now migrate to create the schema: rails db:migrate .

We now have a database linked up with our Rails application. In the next part, we’ll fill out our models with some associations that take advantage of the join tables that connect them.

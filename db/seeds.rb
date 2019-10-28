# BRANCHES

bran1 = Branch.create(name: 'Corporate')
bran2 = Branch.create(name: 'Scranton')
bran3 = Branch.create(name: 'Stamford')

# EMPLOYEES

emp1 = Employee.create(name: 'David Wallace', birth_date: '1661-05-11', salary: 250000, manager: true)
emp2 = Employee.create(name: 'Jan Levinson', birth_date: '1961-05-11', salary: 110000, manager: false)
emp3 = Employee.create(name: 'Angela Martin', birth_date: '1971-06-25', salary: 63000, manager: false)
emp4 = Employee.create(name: 'Kelly Kapoor', birth_date: '1980-02-05', salary: 55000, manager: false)
emp5 = Employee.create(name: 'Stanley Hudson', birth_date: '1958-02-19', salary: 69000, manager: false)
emp6 = Employee.create(name: 'Josh Porter', birth_date: '1969-09-05', salary: 78000, manager: true)
emp7 = Employee.create(name: 'Andy Bernard', birth_date: '1973-07-22', salary: 65000, manager: false)
emp8 = Employee.create(name: 'Jim Halpert', birth_date: '1978-10-01', salary: 71000, manager: false)
emp9 = Employee.create(name: 'Pam Beesly', birth_date: '1988-02-19', salary: 69000, manager: false)
emp10 = Employee.create(name: 'Oscar Martinez', birth_date: '1968-02-19', salary: 69000, manager: false)
emp11 = Employee.create(name: 'Michael Scott', birth_date: '1964-03-15', salary: 75000, manager: true)


# CLIENTS

cli1 = Client.create(name: 'Dunmore Highschool')
cli2 = Client.create(name: 'Lackawana County')
cli3 = Client.create(name: 'FedEx')
cli4 = Client.create(name: 'John Daly, Law LLC')
cli5 = Client.create(name: 'Scranton Whitepages')
cli6 = Client.create(name: 'Times Newspaper')

# BRANCH EMPLOYEES

bran1.employees << emp1
bran1.employees << emp2

bran2.employees << emp3
bran2.employees << emp4
bran2.employees << emp5
bran2.employees << emp9
bran2.employees << emp10
bran2.employees << emp11

bran3.employees << emp6
bran3.employees << emp7
bran3.employees << emp8

# COMPANY HIERARCHY

emp1.inferiors << emp2

emp2.inferiors << emp6
emp2.inferiors << emp11

emp6.inferiors << emp7
emp6.inferiors << emp8

emp11.inferiors << emp3
emp11.inferiors << emp4
emp11.inferiors << emp5
emp11.inferiors << emp9
emp11.inferiors << emp10

# SALES

Sale.create(employee_id: emp5.id, client_id: cli1.id, amount: 5000)
Sale.create(employee_id: emp5.id, client_id: cli3.id, amount: 12000)
Sale.create(employee_id: emp5.id, client_id: cli5.id, amount: 17000)

Sale.create(employee_id: emp7.id, client_id: cli4.id, amount: 11000)
Sale.create(employee_id: emp7.id, client_id: cli5.id, amount: 7500)

Sale.create(employee_id: emp8.id, client_id: cli3.id, amount: 12000)
Sale.create(employee_id: emp8.id, client_id: cli4.id, amount: 15000)

Sale.create(employee_id: emp11.id, client_id: cli2.id, amount: 175000)
Sale.create(employee_id: emp11.id, client_id: cli3.id, amount: 44000)
Sale.create(employee_id: emp11.id, client_id: cli4.id, amount: 22000)
Sale.create(employee_id: emp11.id, client_id: cli5.id, amount: 57000)
Sale.create(employee_id: emp11.id, client_id: cli6.id, amount: 86000)

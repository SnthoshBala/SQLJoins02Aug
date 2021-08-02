use pubs

--Q1 Select the author firtname and last name

Select concat(au_fname,au_lname) 'Name'as Lastname from authors

--Q2 Sort the titles by the title name in descending order and print all the details

Select title 'Titles'from titles
order by title desc

--Q3 Print the number of titlespublished by every author

Select A.au_fname 'Author Name',count(T.title_id) 'Number of Titles Pulished'from authors A,titles T ,titleauthor TA 
where TA.au_id=A.au_id and T.title_id=TA.title_id 
group by A.au_fname

--Q4 print the author name and title name

Select A.au_fname 'Author Name',T.title 'Title Name'from authors A,titles T ,titleauthor TA 
where TA.au_id=A.au_id and T.title_id=TA.title_id group by A.au_fname,T.title

--Q5 print the publisher name and the average advance for every publisher

Select P.pub_name 'Publisher',AVG(T.advance) 'Average of Advance'from publishers P,titles T 
where P.pub_id=T.pub_id 
group by P.pub_name

--Q6 6) print the publishername, author name, title name and the sale amount(qty*price)

Select p.pub_name 'Publisher name',A.au_fname 'Author name',T.title 'Title name',S.qty*T.price 'Amount' from sales S,titles T,publishers P,titleauthor TA,authors A 
where S.title_id=T.title_id and T.title_id=TA.title_id and P.pub_id=T.pub_id and TA.au_id=A.au_id

--Q7  print the price of all that titles that have name that ends with s

Select title 'Title end with s',price 'price'from titles
where title like '%s'

--Q8 print the title names that contain 'and' in it

Select title 'Title contains and'from titles
where title like '%and%'

--Q9 print the employee name and the publisher name

Select E.fname 'Employee name',P.pub_name 'Publisher name'from publishers P,employee E
where P.pub_id=E.pub_id

--Q10 print the publisher name and number of employees woking in it if the publisher has more than 2 employees

Select P.pub_name 'Publisher name ',count(E.fname) 'Number of Employees Working'from publishers P,employee E 
where P.pub_id=E.pub_id 
group by P.pub_name

--Q11 Print the author names who have published using the publisher name 'Algodata Infosystems'

Select A.au_fname 'Authors name' from publishers P,titles T,titleauthor TA,authors A
where P.pub_id=T.pub_id and T.title_id=TA.title_id and TA.au_id=A.au_id and P.pub_name='Algodata Infosystems'

--Q12 Print the employees of the publisher 'Algodata Infosystems'

Select E.fname 'Employee name'from employee E ,publishers P where E.pub_id=P.pub_id and P.pub_name='Algodata Infosystems'

--Q13 Print the average quantity sold for every title
--where the order date is before '1993-05-24 00:00:00.000'
--and the average is greater than 3
--sort by the average

Select T.title 'Titles', avg(S.qty)  'Average quantity' from sales S,titles T
where S.title_id=T.title_id and ord_date<'1993-05-24 00:00:00.000'
group by T.title
having avg(S.qty)> 3
order by avg(S.qty)

--Q14 Print the count of authors in every state and in each city who have contract(if it is 1) order them by state and then city

Select state 'State',city 'City',count(au_id) 'Author id' from authors
where contract=1
group by state,city
order by state,city

--Q15 Print the author name who have published for pulisher from USA

Select au_fname 'Author name' from authors where au_id in
(Select au_id from titleauthor where title_id in
(Select title_id from titles where pub_id in
(Select pub_id from publishers where country = 'USA')))



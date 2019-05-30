# WebEngineering Module, Graded Exercise

## Commit Proposal

Matriculation Number: 16-967-804
Email               : nicolas.zy@gmail.com

Project idea short description: 
Organise your personal book collection by 
saving the isbn and a rating for each book. 
The data is saved in a local database (with the 
user who saved it). The goodreads api will then 
provide a title as well as author and the book cover. 
Then, the aim would be to give the user a number of new
book suggestions he might like, based on books that 
have already been rated by the user. 

Features: 
-book collection containing ISBN, user and rating 
-sorted overview over favorite books, containing 
their title (based on the isbn, using goodreads api)
-possibility to log in as a user 
-possibility to save a book ISBN 
-possibility to rate the book once read 

More features (will be added if I have enough time):
-book cover, author and more information 
-suggestions on what book I could read next, 
based on information about books I liked 

## Project confirmation

Very good. I curious to see your sample data :-)

Confirmed.

D. König


## Project delivery <to be filled by student>

How to start the project: (if other than `grailsw run-app`)

How to test the project:  (if other than `grailsw test-app`)

Hand-written, static HTML 
project description:      (if other than `index.html` in project root directory)

External contributions:

Other comments: 

I'm particular proud of:


## Project grading 

index.html given and valid. It is small but meets the formal requirements.

The application works fine.

Functionality is crud operations for one domain class plus role-based security
(relation to the secured user is done indirectly over the shared user name)
plus functionality and specialised views for recommendations.
Initial data setup in bootstrap.

Engineering:
* commit log is ok
* one basic unit test for the domain, one integration test
* html has some validity issues on the overview page
* comments are fine
* naming is good
* you avoid duplication by using the framework features wisely
* nice self-made calls to remote services, thus avoiding "big UI framework" dependencies!

As a warning: in a real application, you better make the Book domain class not maintain their
own username (which btw is missing a unique constraint) but rather refer to the SecUser.
This will result in proper foreign key constraints in the database and will shield you from
accidentally deleting a user that still has books in the DB.

Since we hit the ceiling, there is no need for grading extra points.

Congratulations!
You created a fully functional, distributed, interactive, security-enabled, database-backed, web application
from scratch on your own in a rather tight time frame showing solid knowledge of WebMVC and engineering practices.

Grade: 6.0

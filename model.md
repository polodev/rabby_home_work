PUBLISHER      
===========      
PublisherID int      
Name varchar(45)      


BOOK      
=========      
ISBN varchar(20) PRIMARY KEY AUTOINCREMENT      
Title varchar(50)      
Price decimal      
PublishDate date      
PUBLISHER_PublisherID      

BOOK_has_BOOK      
=============      
BOOK_ISBN  VARCHAR(20)      
Series_ISBN VARCHAR(20)      

AUTHOR
=======
Author_Number     
Name     
DateOfBirth     

BOOK_has_AUTHOR
===============
BOOK_ISBN  link      
AUTHOR_Author_Number      
RoyaltyPct      
LeadAuthor Tinyint      
SequenceNumber       


Use Joole_Team
go

TRUNCATE TABLE tblUser

alter table tblUser
drop column UserId

ALTER TABLE tblUser
ADD UserId int IDENTITY primary key
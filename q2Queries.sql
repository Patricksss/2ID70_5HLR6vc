Select C.CourseName, coursreg.Grade from CourseRegistrations as coursreg, Courses as C, CourseOffers as CO,  (select StudentRegistrationId, StudentId, DegreeId from StudentRegistrationsToDegrees where StudentId = %1% and DegreeId = %2%) as reg where coursreg.StudentRegistrationID = reg.StudentRegistrationID and Grade > 4 and coursreg.CourseOfferId = CO.CourseOfferId and CO.CourseId = C.CourseId order by Year, Quartile, CO.CourseId;
SELECT 0;
SELECT 0;
select (femalecount/(malecount+femalecount)*100) as percentage from (SELECT count(Students.StudentId)+0.0 as femalecount FROM Degrees, StudentRegistrationsToDegrees, Students where dept='%1%' and Degrees.DegreeId=StudentRegistrationsToDegrees.DegreeId AND StudentRegistrationsToDegrees.StudentId=Students.StudentId AND Gender='F') as t1 , (SELECT count(Students.StudentId)+0.0 as malecount FROM Degrees, StudentRegistrationsToDegrees, Students where Dept='%1%' and Degrees.DegreeId=StudentRegistrationsToDegrees.DegreeId AND StudentRegistrationsToDegrees.StudentId=Students.StudentId AND Gender='M') as t2;
select CourseId, AVG((c2*100)/c1) as percentage from (select CourseOfferId, COUNT(StudentRegistrationId) as c2 from CourseRegistrations where grade>%1% GROUP BY(CourseOfferId)) as t1 INNER JOIN (select CourseOfferId, COUNT(StudentRegistrationId) as c1 from CourseRegistrations GROUP BY(CourseOfferId)) as t2 ON t1.CourseOfferId=t2.CourseOfferId, CourseOffers WHERE CourseOffers.CourseOfferId= t1.CourseOfferId GROUP BY(CourseId) ORDER BY CourseId;
select t1.StudentId, t1.count from (select StudentId, count(c2.CourseOfferId) from (select StudentRegistrationId, CourseOfferId, Grade from CourseRegistrations) AS c2 INNER JOIN (select CourseOfferId, MAX(Grade) from CourseRegistrations GROUP BY(CourseOfferId)) as c3 ON c2.Grade=c3.MAX AND c2.CourseOfferId= c3.CourseOfferId, StudentRegistrationsToDegrees, CourseOffers WHERE StudentRegistrationsToDegrees.StudentRegistrationId = c2.StudentRegistrationId AND CourseOffers.CourseOfferId = c2.CourseOfferId AND Year=2018 AND Quartile=1 GROUP BY StudentId ORDER BY StudentId) as t1 where t1.count>%1%;
SELECT 0;
SELECT 0;

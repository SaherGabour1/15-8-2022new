select distinct u.username , u.passwords
from users u
group by u.username , u.passwords


select distinct u.fname , u.lname, u.idnum , u.phone, u.usertype ,u.age,u.city ,u.username, u.passwords
from users u
group by u.fname , u.lname, u.idnum , u.phone, u.usertype ,u.age,u.city ,u.username, u.passwords


select distinct u.username , u.passwords
from users u JOIN worker w  on u.idnum = w.userid 
where u.usertype = 'worker'
group by u.username , u.passwords


select distinct u.username , u.passwords
from users u 
where u.usertype = 'patient'
group by u.username , u.passwords


select distinct u.username , u.passwords
from users u 
where u.usertype = 'volnteer'
group by u.username , u.passwords


select distinct r.recordNo ,r.recordname
from records r JOIN users u  on r.userid = u.idnum 
where u.usertype = 'patient'
group by r.recordNo ,r.recordname


select distinct u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname 
from users u JOIN hospitals h  on u.idnum = h.userid
where u.usertype = 'patient'
group by u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname 



select distinct u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname 
from users u JOIN hospitals h  on u.idnum = h.userid
		Join worker w   on w.userid = h.worker
where u.usertype = 'worker'
group by u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname 



select distinct u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname ,l.labname , l.labNo
from Labs l JOIN hospitals h  on l.worker = h.worker
		JOIN worker w   on w.userid = h.worker
		JOIN users u   on u.idnum = w.userid	
where u.usertype = 'worker'
group by u.fname , u.lname , u.idnum , h.hospitalNo , h.hospitalname ,l.labname , l.labNo


select distinct h.hospitalNo , h.hospitalname ,l.labname , l.labNo
from Labs l JOIN hospitals h  on l.hospitalid = h.hospitalNo
where l.city = h.city
group by  h.hospitalNo , h.hospitalname ,l.labname , l.labNo



select distinct  u.fname , u.lname , u.idnum , b.BloodType
from users u JOIN Blood b  on u.idnum = b.userid
group by  u.fname , u.lname , u.idnum , b.BloodType



select distinct  u.fname , u.lname , u.idnum , d.Donationbloodtype , d.DonationNo ,b.BloodNo , b.BloodType
from Donation d JOIN Blood b on d.bloodid = b.BloodNo
			JOIN users u on u.idnum = b.userid
where d.Donationbloodtype = b.BloodType
	and u.usertype = 'patient'
group by  u.fname , u.lname , u.idnum , d.Donationbloodtype , d.DonationNo ,b.BloodNo , b.BloodType


select distinct  u.fname , u.lname , u.idnum , d.Donationbloodtype , d.DonationNo ,b.BloodNo , b.BloodType
from Donation d JOIN Blood b on d.bloodid = b.BloodNo
			JOIN users u on u.idnum = b.userid
where d.Donationbloodtype = b.BloodType
	and u.usertype = 'patient'
group by  u.fname , u.lname , u.idnum , d.Donationbloodtype , d.DonationNo ,b.BloodNo , b.BloodType




select distinct u.fname , u.lname , u.idnum , t.Testname ,t.TestNo
from Test t JOIN users u on t.userid =u.idnum
where u.usertype = 'volnteer'
group by  u.fname , u.lname , u.idnum , t.Testname ,t.TestNo



select distinct u.fname , u.lname , u.idnum , t.Testname ,t.TestNo
from Test t JOIN users u on t.userid =u.idnum
where u.usertype = 'volnteer'
group by  u.fname , u.lname , u.idnum , t.Testname ,t.TestNo


select Distinct da.AreaNo, da.AreaName,da.city ,h.hospitalname ,h.hospitalNo
from DonationArea da Join hospitals h on da.hospitalid =h.hospitalNo
where da.city = h.city
group by  da.AreaNo, da.AreaName,da.city ,h.hospitalname ,h.hospitalNo



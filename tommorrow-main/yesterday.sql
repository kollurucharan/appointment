select * from lrc_specialization
select * from lrc_doctors
Select * from lrc_slot
select * from doctor_schedule;

select * from appointmentsSlotCalendar where slotdoctorid=2
select * from doctrange;
insert into doctrange values(3,10);
create table doctrange(
doctorid int primary key ,
	dayrange int
)

insert into doctrange values (1,10),(2,30),(4,14),(5,10),(6,45),(7,10),(8,20),(9,10),(10,20)


					delete from lrc_sch;
	INSERT INTO lrc_sch(doctorid, doctorslotindex, doctorschedule, doctoravailablefrom, doctoravailableto, doctoravailableslot) VALUES
    (1, 1, 'x1x3x5x', '09:00', '12:00', 15),
    (1, 2, 'xx2x4x6', '14:00', '17:00', 30),
    (2, 1, 'x1x3x5x', '10:00', '13:00', 15),
    (2, 2, 'xx2x4x6', '15:00', '18:00', 30),
	(3, 1, 'x1xx4x6', '08:00', '11:00', 15),
	(3, 2, 'x123xxx', '09:00', '12:00', 15),
	(4, 1, 'x1x3x5x', '09:00', '12:00', 14),
	(4, 2, 'xx2x4x6', '09:00', '12:00', 10),
	(5, 1, 'xx23x5x', '09:00', '12:00', 10),
	(5, 2, 'xxx34x6', '09:00', '12:00', 15),
	(6, 1, 'x12345x', '09:00', '12:00', 25),
	(7, 1, 'x1xx45x', '09:00', '12:00', 25),
	(8, 1, 'x1x3x56', '09:00', '12:00', 10),
	(9, 1, 'x12xxx6', '09:00', '12:00', 14),
	(10, 1, 'x1x3x5x', '09:00', '12:00', 10)
 ;
	
CREATE OR REPLACE FUNCTION get_nofslots(
    docid INT,sindex int,
    input_date DATE
)
RETURNS INT
LANGUAGE plpgsql
AS $$
declare
    schedule_cursor CURSOR (docid INT,sindex int, input_date DATE) FOR
        SELECT doctorschedule,doctoravailabelslot, doctorslotindex
        FROM lrc_sch
        WHERE doctorid = docid and  doctorslotindex=sindex; 
	schstring varchar(20);
	sind int;
	slotavai int;
	dayt int:=EXTRACT(dow FROM input_date);
	contains_number boolean;
begin
 IF FOUND THEN
        CLOSE schedule_cursor;
    END IF;
open schedule_cursor(docid ,sindex, input_date);
fetch schedule_cursor into schstring,slotavai,sind ;
	contains_number:=schstring like '%'|| dayt || '%';
	CLOSE schedule_cursor;
	if contains_number then 
		return slotavai;
	else 
	
		return 0;
	 
	end if;

	
END;
$$;
			
		call	 InsertAppointmentsFromDoctorsAndPatients(1) 
	
			
			
			
CREATE OR REPLACE PROCEDURE InsertAppointmentsFromDoctorsAndPatients(docid int) AS $$
DECLARE
    cur_doctors CURSOR(docid int) FOR SELECT doctorslotindex,doctorschedule,doctoravailablefrom,doctoravailableto,doctoravailabelslot FROM lrc_sch where doctorid=docid; 
    dindex int;
    docsche varchar(20);
	docfrom time;
	docto time;
	docslots int;
	docrange int;
	slotdate Date:=current_date+1;
	nofoslot int;
	counter int;
	counter2 int;
	occured int;
	tot int;
BEGIN
	    SELECT dayrange INTO docrange FROM doctrange WHERE doctorid = docid;
	for counter in 1..docrange loop
   OPEN cur_doctors(docid);
		raise notice '%',counter;
    LOOP
        FETCH cur_doctors INTO dindex,docsche,docfrom,docto,docslots;
		EXIT WHEN NOT FOUND;
		nofoslot:=get_nofslots(docid, dindex, slotdate);
		
		tot:=tot+nofoslot;
		select occured(docid,slotdate) into occured;
		if nofoslot>0 then 
			for counter2 in 1..nofoslot-occured loop
			insert into lrc_slot (slotdoctorid,slotdate,slotfrom,slotto,slotstatus)values(docid,slotdate,docfrom,docto,'Available');
			end loop;
			end if;
    END LOOP;
    CLOSE cur_doctors;
	if tot=0 then counter:=counter-1; end if;
	slotdate:=slotdate+1;
	raise notice 'slot date:%',slotdate;
end loop;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE PROCEDURE AllDoctors() AS $$
DECLARE
	n int;
    cur_AllDoctors CURSOR FOR SELECT doctorid  FROM lrc_doctor ; 
    
BEGIN
	    
   OPEN cur_AllDoctors;
	
    LOOP
	
        FETCH cur_AllDoctors INTO n;
		EXIT WHEN NOT FOUND;
	
		call InsertAppointmentsFromDoctorsAndPatients(n);
		
		
end loop;
close cur_AllDoctors;
END;
$$ LANGUAGE plpgsql;

	call AllDoctors();
	
	
	
CREATE OR REPLACE FUNCTION occured(
    docid INT,
    input_date DATE
)
RETURNS INT
LANGUAGE plpgsql
AS $$
declare
occured int;
begin
select count(*) from lrc_slot where slotdoctorid=docid AND slotdate=input_date into occured;
return occured;
END;
$$;
		
	
	


create table lrc_slot(slotid serial primary key,slotdoctorid int,
					   slotdate date,slotfrom time,slotto time
					   ,slotstatus varchar(25));
select * from lrc_slot
delete from lrc_slot

SELECT slotdate, COUNT(*) AS available_slots_count
FROM lrc_slot
WHERE slotstatus = 'Available'
GROUP BY slotdate;
select distinct slotdate from lrc_slot;

select * from lrc_specialization


select * from lrc_sch;

select * from doctrange;

select * from lrc_patients;

select * from lrc_slot;


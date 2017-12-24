INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(1, 'Nick Smith', 'Main street 10', 'smith@gmail.com', 'police','detective', 'hotel loop', 'member');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(2, 'Mike Anderson', 'Jiling street 21', 'mAnderson@gmail.com', 'departmentstore','manager', 'hotel bringem', 'member');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(3, 'Lili Adams', 'Polis street 13', 'Adams10@gmail.com', 'hotel','director', 'hotel bringem', 'lector');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(4, 'Mike Goldvin', 'Trafak street 30', 'Mikejil@gmail.com', 'museum','guide', 'hotel loop', 'member');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(5, 'Jane McDonnel', 'Park Green street 56', 'killjoy@gmail.com', 'school','teacher', 'hotel klopus', 'member');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(6, 'Ann Prices', 'Holliw street 21', 'funny65@gmail.com', 'hospital','nurse', 'hotel eartin', 'lector');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(7, 'Robert Lorens', 'Main street 20', 'anonimus8@gmail.com', 'police','detective', 'hotel milkop', 'member');
INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(8, 'Sam Stark', 'Hist street 24', 'starh@gmail.com', 'post office','manager', 'hotel milkop', 'headmaster');

INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(1,'History of Rome','The story of Rome', 1, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(1,'History of Rome','The story of Rome', 3, 1, 2);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(2,'History of Minsk','The story of Minsk', 1, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(3,'Math in pictures','Math like lifestyle', 1, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(4,'Computer Sience','Computers in our life', 1, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(5,'Language','Language is it', 2, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(6,'Rock','Geology is our past', 3, 1, 2);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(6,'Rock','Geology is our past', 1, 1, 1);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(7,'Story','Story of life', 4, 1, 3);
INSERT INTO report(report_id ,name ,summery ,meeting_meeting_id ,meeting_id ,meeting_section_id)
VALUES(8,'Story','Story of life', 4, 1, 3);

SELECT * FROM report;

INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(1, 'Nick','Hopkins');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(2, 'Sam','Smith');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(3, 'Luck','Synker');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(4, 'Aron','Croft');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(5, 'Merlin','Turis');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(6, 'Merlin','Tryh');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(7, 'Merlin','Chil');
INSERT INTO headmaster(headmaster_id ,name	,last_name)
VALUES(8, 'Merlin','Chil');

SELECT* FROM headmaster

INSERT INTO meeting(meeting_id ,section_сonference_id ,section_section_id)
VALUES(1, 1, 1);
INSERT INTO meeting(meeting_id ,section_сonference_id ,section_section_id)
VALUES(2, 1, 1);
INSERT INTO meeting(meeting_id ,section_сonference_id ,section_section_id)
VALUES(3, 1, 2);
INSERT INTO meeting(meeting_id ,section_сonference_id ,section_section_id)
VALUES(4, 1, 3);

INSERT INTO section(сonference_id ,section_id )
VALUES(1, 1);
INSERT INTO section(сonference_id ,section_id )
VALUES(1, 2);
INSERT INTO section(сonference_id ,section_id )
VALUES(1, 3);

INSERT INTO сonference(id)
VALUES(1);
INSERT INTO сonference(id)
VALUES(5);

--2 простого оператора CASE ()
SELECT ns, address, mail,
CASE 
  WHEN role LIKE 'lecturer' THEN 'Member is lecturer'
  WHEN role LIKE 'memeber' THEN 'Member is member'
  ELSE ' Member is headmaster'
END "DESCRIPTION"
FROM member;

--3 поискового оператора CASE()
SELECT report_id ,name ,summery,
CASE 
  WHEN meeting_section_id < 2 THEN 'Report in section 1'
  WHEN meeting_section_id BETWEEN 1 AND 3  THEN 'Report in section 2'
  ELSE 'Report in section 3'
END "DESCRIPTION"
FROM report;

--4 оператора WITH() Показать какой участник присутствует на каком отчёте
WITH member_info AS (SELECT ns, role, member_id FROM member)
SELECT member_info.ns || ' ' || member_info.role || ' on the ' || report.name || ' report ' "INFO"
FROM member_info
INNER JOIN report ON member_info.member_id = report.meeting_meeting_id;

--5 встроенного представления()
SELECT headmaster_name, report_name, summery
FROM
    (SELECT headmaster.name "HEADMASTER_NAME", report.name "REPORT_NAME", summery "SUMMERY"
    FROM headmaster
    INNER JOIN report ON headmaster.headmaster_id = report.report_id)
WHERE report_name LIKE 'History%';

--6 некоррелированного запроса
SELECT section_id || ' Section on conference ' || сonference_id || ' where only one report' "Section"
FROM section
WHERE 1 = (SELECT count(meeting_section_id) FROM report WHERE report.meeting_section_id = section.section_id);

--7 коррелированного запроса
SELECT meeting.meeting_id
FROM meeting
WHERE meeting.meeting_id = (
     SELECT MEETING_ID
              FROM
    (SELECT meeting.meeting_id "MEETING_ID", count(*) "COUNT_REPORTS"
                  FROM meeting
                  INNER JOIN report ON meeting.meeting_id = report.meeting_meeting_id
                  GROUP BY meeting.meeting_id)
              WHERE count_reports = (SELECT MAX(count_reports)
                                      FROM (SELECT meeting.meeting_id "MEETING_ID", count(*) "COUNT_REPORTS"
                                       FROM meeting
                                        INNER JOIN report ON meeting.meeting_id = report.meeting_meeting_id
                                        GROUP BY meeting.meeting_id)));

--8 функции NULLIF
SELECT ns, address, mail, NULLIF(current_address, 'hotel loop')
FROM member;

--9 функции NVL2
SELECT headmaster_id , NVL2(name, 'Present', 'n/a') AS "NAME", last_name
FROM headmaster;

--10 TOP-N анализа()
SELECT *
    FROM (SELECT *
        FROM member
        ORDER BY address)
    WHERE ROWNUM <= 3;

--11 функции ROLLUP()
SELECT report_id, COUNT(meeting_section_id)
    FROM report
    GROUP BY ROLLUP(report_id, meeting_section_id);

SELECT section_id, section_section_id
FROM section
(SELECT

--12 Составьте запрос на использование оператора MERGE языка манипулирования данными.
CREATE TABLE member_clone AS SELECT * FROM member;

SELECT * FROM member_clone;

MERGE INTO member_clone tgt
         USING member src
      ON (tgt.member_id = src.member_id)
     WHEN MATCHED THEN
         UPDATE SET tgt.ns = src.ns, tgt.address = src.address, tgt.mail = src.mail, tgt.place_of_work = src.place_of_work, tgt.post = src.post, tgt.current_address = src.current_address, tgt.role = src.role
     WHEN NOT MATCHED THEN
         INSERT VALUES (src.member_id, src.ns, src.address, src.mail, src.place_of_work, src.post,src.current_address, src.role);

INSERT INTO member(member_id, ns, address, mail, place_of_work, post, current_address, role )
VALUES(11, 'Rey Smith', 'Main street 56', 'smriteh@gmail.com', 'police','detective', 'hotel tr', 'lecter');

select
	s.student_number "STUDENT_ID",
	case
		when s.grade_level < 0 then 'PK'
		when s.grade_level = 0 then '0K'
		when s.grade_level < 10 then '0' || to_char (s.grade_level)
		else to_char (s.grade_level)
		end "GRADE",
	to_char (s.exitdate, 'mm/dd/yyyy') "SCHOOL_EXIT_DATE",
	'' "SCHOOL_EXIT_REASON",
	'' "TEACHER_ID",
	'' "CASE_MANAGER",
	case s.SCHOOLID
		when 370151 then 370150
		else s.schoolid
		end "SERVICE_SCHOOL",
	case s.SCHOOLID
		when 370151 then 370150
		else s.schoolid
		end "RESIDENCE_SCHOOL",
	'' "ESY_PARTICIPANT",
	to_char (s.ENTRYDATE, 'mm/dd/yyyy') "SCHOOL_ENTRY_DATE",
	s.entrycode "SCHOOL_ENTRY_TYPE"


from students s
join S_AK_STU_X ak on ak.studentsdcid = s.dcid

where s.enroll_status = 0
and s.grade_level < 13
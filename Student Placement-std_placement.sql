select
	s.student_number "STUDENT_ID",
	case s.grade_level
		when -2 then 'PK'
		when -1 then 'PK'
		when 0 then '0K'
		else to_char (s.grade_level)
		end "Grade",
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
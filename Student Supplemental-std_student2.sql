select
	s.student_number "STUDENT_ID",
	'' "DRIVERS_LICENSE_NUMBER",
	'' "DRIVERS_LICENSE_STATE",
	ak.ECON "TITLE1_PARTICIPANT",
	case ak.Section504
		when '1' then 'Y'
		else 'N'
		end "SECTION504_PARTICIPANT",
	'' "ESL_PARTICIPANT",
	'' "CORRECTIONAL_PARTICIPANT",
	'' "GIFTED_PARTICIPANT",
	'' "LIT_PARTICIPANT",
	ak.migrant "MIGRANT_ELIGIBLE",
	ak.migrant "MIGRANT_PARTICIPATION",
	'' "MIGRANT_ID",
	'' "MEDICAID_ELIGIBLE",
	'' "MEDICAID_ENROLLED",
	'' "MEDICAID_ID",
	'' "FREE_LUNCH",
	'' "DWELLING_ARRANGEMENT",
	case ak.LEP
		when 'LP' then '3'
		else ''
		end "LIMITED_ENGLISH_PROFICIENCY",
	'' "PREFERRED_LANGUAGE",
	'' "NATIVE_LANGUAGE",
	'' "PARENT_LANGUAGE",
	'' "INTERPRETER_REQUIRED",
	'' "ENGLISH_PROFICIENCY",
	'' "LEP_EXITDATE",
	ak.fte "FTE_ENROLLMENT_LEVEL"


from students s
join S_AK_STU_X ak on ak.studentsdcid = s.dcid

where s.enroll_status = 0
and s.grade_level < 13
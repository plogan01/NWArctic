select
	s.student_number "STUDENT_ID",
	s.student_number "STATE_STUDENT_ID",
	'' "OTHER_STUDENT_ID",
	'' "SSN",
	'' "NAME_TITLE",
	s.first_name "NAME_FIRST",
	s.MIDDLE_NAME "NAME_MIDDLE",
	s.LAST_NAME "NAME_LAST",
	ak.SUFFIX "NAME_SUFFIX",
	'' "NAME_PREFERRED",
	to_char (s.dob, 'mm/dd/yyyy') "BIRTH_DATE",
	'' "BIRTH_CITY",
	'' "BIRTH_STATE",
	'' "BIRTH_COUNTRY",
	s.gender "GENDER",
	'' "CITIZENSHIP_STATUS",
	'' "CITIZENSHIP_ONE",
	'' "CITIZENSHIP_TWO",
	'' "ENTRY_YEAR",
	'' "RESIDENT_ALIEN_ID",
	case stu.sped_member
		when 1 then 'N'
		else 'Y'
		end "GEN_ED_ONLY",
	case s.FedEthnicity
		when 1 then 'Y'
		else 'N'
		end "RACE"
	

from students s
join S_AK_STU_X ak on ak.studentsdcid = s.dcid
join U_STUDENTS stu on stu.studentsdcid = s.dcid

where s.enroll_status = 0
and s.grade_level < 13
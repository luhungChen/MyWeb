package com.web.MyWeb;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.web.Bean.LearningExper;

public class MyRowMapper implements RowMapper<LearningExper>{

	@Override
	public LearningExper mapRow(ResultSet arg0, int arg1) throws SQLException {
		 String junior_high_school = arg0.getString("junior_high_school");
		 String senior_high_school = arg0.getString("senior_high_school");
		 String university = arg0.getString("university");
		 String graduate_school = arg0.getString("graduate_school");
		 String graduate_school_thesis_advisor = arg0.getString("graduate_school_thesis_advisor");
		 LearningExper vo = new LearningExper();
		 vo.setJunior_high_school(junior_high_school);
		 vo.setSenior_high_school(senior_high_school);
		 vo.setUniversity(university);
		 vo.setGraduate_school(graduate_school);
		 vo.setGraduate_school_thesis_advisor(graduate_school_thesis_advisor);
		 return vo;
	}
}

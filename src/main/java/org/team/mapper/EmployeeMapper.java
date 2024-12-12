package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.team.dto.EmployeeDTO;

@Mapper
public interface EmployeeMapper {
	List<EmployeeDTO> selectAll();
	List<EmployeeDTO> selectEmployeeByEname(String ename);
	
}

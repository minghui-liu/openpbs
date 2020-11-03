if(EXISTS /etc/os-release)
	file(STRINGS /etc/os-release vars)
	foreach(var ${vars})
		if(var MATCHES "^ID=(.*)")
			set(CMAKE_OS_ID "${CMAKE_MATCH_1}")
			if(CMAKE_OS_ID MATCHES "^['\"](.*)['\"]\$")
				set(CMAKE_OS_ID ${CMAKE_MATCH_1})
			endif()
		elseif(var MATCHES "^VERSION_ID=(.*)")
			set(CMAKE_OS_VERSION_ID "${CMAKE_MATCH_1}")
			if(CMAKE_OS_VERSION_ID MATCHES "^['\"](.*)['\"]\$")
				set(CMAKE_OS_VERSION_ID ${CMAKE_MATCH_1})
			endif()
		endif()
	endforeach()
else()
	set(CMAKE_OS_ID "unknown")
	set(CMAKE_OS_VERSION_ID "unknown")
endif()
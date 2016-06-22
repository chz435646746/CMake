
function(cm_check_cxx_feature name)
  string(TOUPPER ${name} FEATURE)
  if(NOT DEFINED CMake_HAVE_CXX_${FEATURE})
    message(STATUS "Checking if compiler supports C++ ${name}")
    try_compile(CMake_HAVE_CXX_${FEATURE}
      ${CMAKE_CURRENT_BINARY_DIR}
      ${CMAKE_CURRENT_LIST_DIR}/cm_cxx_${name}.cxx
      CMAKE_FLAGS -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
      OUTPUT_VARIABLE OUTPUT
      )
    if(CMake_HAVE_CXX_${FEATURE})
      message(STATUS "Checking if compiler supports C++ ${name} - yes")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
        "Determining if compiler supports C++ ${name} passed with the following output:\n"
        "${OUTPUT}\n"
        "\n"
        )
    else()
      message(STATUS "Checking if compiler supports C++ ${name} - no")
      file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
        "Determining if compiler supports C++ ${name} failed with the following output:\n"
        "${OUTPUT}\n"
        "\n"
        )
    endif()
  endif()
endfunction()

if(CMAKE_CXX_STANDARD)
  cm_check_cxx_feature(unordered_map)
endif()

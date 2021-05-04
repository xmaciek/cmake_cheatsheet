# cmake_cheatsheet
## various cmake samples

---

### Quick setup
```cmake
cmake_minimum_required( VERSION 3.20 )
project( projectname )
```

---

### Packages
##### prepending module paths to add custom `FindLib.cmake` modules
```cmake
list( PREPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )
find_package( Threads REQUIRED )
```

---

### Executables
##### `WIN32` will be ignored on linux, will have to use `int __clrcall WinMain( HINSTANCE, HINSTANCE, LPSTR, int )` on windows to hide console window
##### otherwise plain `int main( int, char** )` will suffice
```cmake
add_executable( name WIN32 )
target_sources( name
    PRIVATE
    main.cpp
    file1.cpp
    file2.cpp
    header1.hpp
)

target_link_libraries( name
    Threads::Threads
    custom_library_name_within_this_project
)

set_target_properties( name
    PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
)

target_compile_definitions( name
    PRIVATE
    DEFINE_NAME=1
)
```

---

### Libraries
##### assuming library has public headers in subdirectory `./public/libname/`, so it can be included as `#include <libname/header.hpp>`
```cmake
add_library( name STATIC )
target_sources( name
    PRIVATE
    file1.cpp
    file2.cpp
    some_header.hpp

    PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/public/libname/header.hpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/public/libname/header2.hpp"
)
set_target_properties( name
    PROPERTIES
    INTERFACE_INCLUDE_DIRECTORY public
)
```

---

### Config options
##### build file template `build.hpp.in`
```cpp
#pragma once
struct Build {
    static constexpr bool ON = true;
    static constexpr bool OFF = false;
    static constexpr bool option_x = ${OPTION_X};
};
```
##### cmake
```cmake
option( OPTION_X "description" ON )
configure_file( build.hpp.in "${CMAKE_CURRENT_SOURCE_DIR}/build.hpp" )
```

---

### Custom target
```cmake
function( compile_shader tgt_name src_file )
    add_custom_target( "${tgt_name}" DEPENDS "${src_file}.spv" )
    add_custom_command(
        OUTPUT "${src_file}.spv"
        DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/${src_file}"
        COMMAND glslc "${CMAKE_CURRENT_SOURCE_DIR}/${src_file}" -o "${src_file}.spv"
    )
endfunction()

compile_shader( shader_default_vert default.vert )
compile_shader( shader_default_frag default.frag )
```
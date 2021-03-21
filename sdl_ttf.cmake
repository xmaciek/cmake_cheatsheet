if ( TARGET SDL2::TTF )
    return()
endif()

if ( WIN32 )
    set( SDL2_TTF_DIR "${CMAKE_SOURCE_DIR}/sdk/SDL2_ttf-2.0.15" )
    set( SDL2_TTF_INCLUDE_DIRS "${SDL2_TTF_DIR}/include" )
    set( SDL2_TTF_LIBRARIES "${SDL2_TTF_DIR}/lib/x64/SDL2_ttf.lib" )
else()
    set( SDL2_TTF_INCLUDE_DIRS "/usr/include/SDL2" )
    set( SDL2_TTF_LIBRARIES "/lib/libSDL2_ttf.so" )
endif()

add_library( SDL2::TTF UNKNOWN IMPORTED )
set_target_properties( SDL2::TTF PROPERTIES
    IMPORTED_LOCATION "${SDL2_TTF_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_TTF_INCLUDE_DIRS}"
)

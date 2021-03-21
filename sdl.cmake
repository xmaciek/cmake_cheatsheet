if ( TARGET SDL2::SDL2 )
    return()
endif()

if ( WIN32 )
    set( SDL2_DIR "${CMAKE_SOURCE_DIR}/sdk/SDL2-2.0.14" )
    set( SDL2_INCLUDE_DIRS "${SDL_SDL2_DIR}/include" )
    set( SDL2_LIBRARIES "${SDL_SDL2_DIR}/lib/x64/SDL2.lib" )
else()
    set( SDL2_INCLUDE_DIRS "/usr/include/SDL2" )
    set( SDL2_LIBRARIES "/lib/libSDL2.so" )
endif()

add_library( SDL2::SDL2 UNKNOWN IMPORTED )
set_target_properties( SDL2::SDL2 PROPERTIES
    IMPORTED_LOCATION "${SDL2_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_INCLUDE_DIRS}"
)

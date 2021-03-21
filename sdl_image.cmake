if ( TARGET SDL2::IMAGE )
    return()
endif()

if ( WIN32 )
    set( SDL2_IMAGE_DIR "${CMAKE_SOURCE_DIR}/sdk/SDL2_image-2.0.5" )
    set( SDL2_IMAGE_INCLUDE_DIRS "${SDL2_IMAGE_DIR}/include" )
    set( SDL2_IMAGE_LIBRARIES "${SDL2_IMAGE_DIR}/lib/x64/SDL2_image.lib" )
else()
    set( SDL2_IMAGE_INCLUDE_DIRS "/usr/include/SDL2" )
    set( SDL2_IMAGE_LIBRARIES "/lib/libSDL2_image.so" )
endif()

add_library( SDL2::IMAGE UNKNOWN IMPORTED )
set_target_properties( SDL2::IMAGE PROPERTIES
    IMPORTED_LOCATION "${SDL2_IMAGE_LIBRARIES}"
    INTERFACE_INCLUDE_DIRECTORIES "${SDL2_IMAGE_INCLUDE_DIRS}"
)

cmake_minimum_required( VERSION 3.0.0 )
project( game )

find_package( Threads REQUIRED )
include( "${CMAKE_SOURCE_DIR}/sdl.cmake" )
include( "${CMAKE_SOURCE_DIR}/sdl_ttf.cmake" )
include( "${CMAKE_SOURCE_DIR}/sdl_image.cmake" )

add_executable( game )

target_sources( game
    PRIVATE
    src/main.cpp
)

target_compile_definitions( game
    PRIVATE
    SDL_MAIN_HANDLED=1
)

set_target_properties( game PROPERTIES
    CXX_STANDARD 17
)

target_link_libraries( game
    SDL2::SDL2
    SDL2::TTF
    SDL2::IMAGE
    Threads::Threads
)

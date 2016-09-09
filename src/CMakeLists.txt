if (WIN32)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()

SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/out)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/out)

# lua static library
add_library(lualib STATIC 
            lapi.c
            lauxlib.c
            lbaselib.c
            lcode.c
            ldblib.c
            ldebug.c
            ldo.c
            ldump.c
            lfunc.c
            lgc.c
            linit.c
            liolib.c
            llex.c
            lmathlib.c
            lmem.c
            loadlib.c
            lobject.c
            lopcodes.c
            loslib.c
            lparser.c
            lstate.c
            lstring.c
            lstrlib.c
            ltable.c
            ltablib.c
            ltm.c
            lundump.c
            lvm.c
            lzio.c
            print.c)
set_target_properties(lualib PROPERTIES OUTPUT_NAME "lua")

# lua interpreter
link_directories(${LUA_BINARY_DIR})
add_executable(lua lua.c)
target_link_libraries(lua lualib)
if(UNIX)
    # what's the mean?
    target_link_libraries(lua m)
endif()

# lua compiler
link_directories(${LUA_BINARY_DIR})
add_executable(luac luac.c)
target_link_libraries(luac lualib)
if(UNIX)
    # what??
    target_link_libraries(luac m)
endif()

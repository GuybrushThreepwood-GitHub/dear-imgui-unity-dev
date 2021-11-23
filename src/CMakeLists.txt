cmake_minimum_required(VERSION 3.8)
project(dear-imgui-unity)

# Don't remove the prefix on android as if the libs do not have libxxx.so it cannot find them.
add_subdirectory(cimgui-unity)
if(NOT ANDROID)
	set_target_properties(cimgui-unity PROPERTIES PREFIX "")
endif()

add_subdirectory(cimgui-freetype)
if(NOT ANDROID)
	set_target_properties(cimgui-freetype PROPERTIES PREFIX "")
endif()
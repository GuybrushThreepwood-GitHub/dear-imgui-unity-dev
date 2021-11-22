cmake_minimum_required(VERSION 3.8)
project(dear-imgui-unity)

add_subdirectory(cimgui-unity)
set_target_properties(cimgui-unity PROPERTIES PREFIX "")

add_subdirectory(cimgui-freetype)
set_target_properties(cimgui-freetype PROPERTIES PREFIX "")

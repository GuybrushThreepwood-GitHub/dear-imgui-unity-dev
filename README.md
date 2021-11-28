# dear-imgui-unity-dev
Dear ImGui integration into Unity (package: https://github.com/GuybrushThreepwood-GitHub/dear-imgui-unity)

Dump of the complete process, so even I can remember.

* Update the imgui submodule inside the cimgui submodule with the version you want to support/update.
* Build the libraries for the platform - use the build-*** scripts and copy to D:\GitHub\dear-imgui-unity-dev\dear-imgui-project\Packages\dear-imgui-unity\Plugins
* Use LuaJIT to generate the lua/json files detailing the functions and structs (src\cimgui\generator\output).
* Copy the json files into the C# generator in the ImGui.NET project (src\ImGui.NET\src\CodeGenerator\definitions\cimgui).
* Run the CodeGenerator project (specifying the output directory to be 'dear-imgui-project\Packages\dear-imgui-unity\ImGuiNET\Wrapper\Generated' or copy the output ****.gen.cs files to this path.
* Update the various imgui structures inside 'dear-imgui-project\Packages\dear-imgui-unity\ImGuiNET.Unity' for new or removed values (e.g. Styles/ IO / Fonts).
* 

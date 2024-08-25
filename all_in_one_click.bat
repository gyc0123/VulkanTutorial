:: Check if the current directory is a Git repository
git rev-parse --is-inside-work-tree >nul 2>&1
IF ERRORLEVEL 1 (
    :: Initialize a new Git repository if it doesn't exist
    git init
)

:: Check and add submodules if they do not already exist
IF NOT EXIST "external/glfw" (
    git submodule add https://github.com/glfw/glfw.git external/glfw
)
IF NOT EXIST "external/glm" (
    git submodule add https://github.com/g-truc/glm.git external/glm
)
IF NOT EXIST "external/tinyobjloader" (
    git submodule add https://github.com/tinyobjloader/tinyobjloader.git external/tinyobjloader
)
IF NOT EXIST "external/stb_image" (
    git submodule add https://github.com/nothings/stb.git external/stb_image
)

IF NOT DEFINED VULKAN_SDK (
    IF NOT EXIST "VulkanSDK-1.3.290.0-Installer.exe" (
        echo Downloading Vulkan SDK Installer...
        curl -O https://sdk.lunarg.com/sdk/download/1.3.290.0/windows/VulkanSDK-1.3.290.0-Installer.exe
    )
    VulkanSDK-1.3.290.0-Installer.exe --accept-licenses --default-answer --confirm-command install
) ELSE (
    echo VULKAN_SDK is set to %VULKAN_SDK%
)


mkdir build
cmake -S ./code -B build
cmake --build build
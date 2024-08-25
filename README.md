# Vulkan Tutorial Fork

This fork simplifies running the original Vulkan tutorial. You can execute everything with just a few commands or by using the `all_in_one_click.bat` file.

## Getting Started

Follow the steps below to set up and run the project:

### Requirements

- **Git**: [Download Git for Windows](https://git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe)
- **CMake**: [Download CMake](https://github.com/Kitware/CMake/releases/download/v3.30.2/cmake-3.30.2-windows-x86_64.msi)
- **Visual Studio**: Ensure it's installed for building the project.

### Step 1: Install Vulkan SDK

Download and install the Vulkan SDK with the following commands:

```bat
curl -O https://sdk.lunarg.com/sdk/download/1.3.290.0/windows/VulkanSDK-1.3.290.0-Installer.exe
VulkanSDK-1.3.290.0-Installer.exe --accept-licenses --default-answer --confirm-command install
```

### Step 2: Clone Third-Party Packages as Git Submodules

Add the necessary third-party packages as submodules by running:

```bat
git submodule add https://github.com/glfw/glfw.git external/glfw
git submodule add https://github.com/g-truc/glm.git external/glm
git submodule add https://github.com/tinyobjloader/tinyobjloader.git external/tinyobjloader
git submodule add https://github.com/nothings/stb.git external/stb_image
```

### Step 3: Configure CMake and Build the Project

To configure and build the project, follow these steps:

```bat
mkdir build
cmake -S ./code -B build
cmake --build build
```

### Step 4: Run the Program

To run the program, execute the following:

```bat
python test.py
```

> **Note:** If you're using all_in_one_click.bat, you might need to run it multiple times. After installing the Vulkan SDK, the terminal needs to restart for CMake to recognize the Vulkan environment variables.
```

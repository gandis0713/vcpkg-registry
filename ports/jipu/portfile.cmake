vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 328f32e36e1152fa7a97e38281111115e7ea468383e80c40c13d74bef18d56f2887bbd426df02a8c05ed3c84d0cee9b0024226bfae100f3917d9a6dc6b663699
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    GENERATOR 
        Ninja
    OPTIONS
        -DJIPU_SAMPLE=OFF
        -DJIPU_TEST=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "share/jipu")

file(READ "${CURRENT_PACKAGES_DIR}/share/jipu/jipu-config.cmake" PRE_JIPU_CONFIG_CMAKE)
file(WRITE "${CURRENT_PACKAGES_DIR}/share/jipu/jipu-config.cmake"
"include(CMakeFindDependencyMacro)
find_dependency(spdlog)
find_dependency(VulkanMemoryAllocator)
${PRE_JIPU_CONFIG_CMAKE}"
)

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
)
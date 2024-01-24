vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 193a26da972afffa82e9d49cf78943a488e1c79fe630f31d8038fc0befcfa110ea49c33d1fbb33c176e6c599158661332ebe309f7aa0cf2b8255c70676e7d9a6
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
find_dependency(VulkanHeaders)
find_dependency(VulkanMemoryAllocator)
${PRE_JIPU_CONFIG_CMAKE}"
)

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
)
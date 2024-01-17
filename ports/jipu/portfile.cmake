vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 58e6d5d29a271594161c9f10f7fe8c530ade2daadc15321a1cbb962c6b89a90758a803882d9c0075b2b601e6428ee94fdeae93164ce2017c7f49c53311098841
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
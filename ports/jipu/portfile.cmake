vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF 20b62b1b6e9fee98a4b5c30f7176cd1a0f10518d # develop
    SHA512 7ed4d48b1adb4f6ea733e21eee7f448e5b9e91d351d4ff2d8c8c2fdfcfe96ec96826ef2e927a0e6187b1e2e8a74208d7211352d6379512d73c6e9cd8c68e548c
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
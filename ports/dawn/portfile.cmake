vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/dawn
    REF a56fede2b5d780a6b1d0930dc9d467b4c0009f21 # main 2024-10-31
    SHA512 9ce31583151be88a40e2a024a906b0f10431d2fc1564977b9b2ebd2d045d7afeaefb6251e438c886f1326308bc9cd3da781c1668c6879359d7626919c3da2144
    HEAD_REF main
    PATCHES
    tint_dependency.patch
    tint_include.patch
    thrid_party.patch
)

set(DAWN_OPTIONS
    -DDAWN_FETCH_DEPENDENCIES=ON
    -DDAWN_ENABLE_INSTALL=ON
    -DTINT_ENABLE_INSTALL=ON
    -DENABLE_VULKAN=ON
)

set(DAWN_OPTIONS_DEBUG
    -DENABLE_SPIRV_VALIDATION=ON
)

# For force enable Vulkan on macOS
if(VCPKG_TARGET_IS_OSX)
list(APPEND DAWN_OPTIONS
    -DDAWN_ENABLE_VULKAN=ON
)
endif()


vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    GENERATOR "Ninja"
    OPTIONS ${DAWN_OPTIONS}
    OPTIONS_DEBUG ${DAWN_OPTIONS_DEBUG}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/Dawn")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/Dawn"
)
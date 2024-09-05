vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/dawn
    REF d3084cce402664d6275aa0a94c1fe75cb0b86cfa # main 2024-09-05
    SHA512 21aa10d7abf63b0dd34e516bbbf0c3466c450791a1ed87abf3e69567032cdb557a535d6df579b1a9fe04bf02c7af53824c3fd04a7e2151c2fefbf23988305a49
    HEAD_REF main
    PATCHES
    tint_install.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    GENERATOR
    "Ninja"
    OPTIONS
    -DDAWN_FETCH_DEPENDENCIES=ON
    -DDAWN_ENABLE_INSTALL=ON
    -DTINT_ENABLE_INSTALL=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/Dawn")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/Dawn"
)
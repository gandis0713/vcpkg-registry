vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ARM-software/HWCPipe
    REF 2.3.0
    SHA512 3f203fb58f3329344de591bd449faae5aab0d3832e319691aa9207b4c3ba6ec7a1d1d38b56ddb86e2d41a849f0dc65f0f0365a5df8d37ab98a55ea2cc03c0654
    PATCHES
    install.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    GENERATOR
    "Unix Makefiles"
    OPTIONS
    -DHWCPIPE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "share/hwcpipe")

file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)
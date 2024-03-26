vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ARM-software/HWCPipe
    REF 0116b700a8d73189ece070279b62ca1b744cc965 # main
    SHA512 747ef91097669e0c0818fab38ef43e44047dba7cb4f4838144e53f689c777a43d4dc0bcf7d6f3b14fe3e27d071180dd0ce96983ae5a42904b1e37f20a43611c9
    HEAD_REF main
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
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 d2c1fb2a13d3e2273d5f8f9e19462dd5bd7681d411c3ed480eb26d99500be9622478a566c6aeff5d59541500989e85db39eed45c47d7f4b33155b685f28ded0f
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
vcpkg_fixup_pkgconfig()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
)
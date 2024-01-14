vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 b4cab5e8ec84482cea9388f6c1816df9810f15b6c39216c59d033e03ae1e22766fc819f0097f3ed5a6d6003ce921c7b5050920dac084b701fecb4df2e835e808
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
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
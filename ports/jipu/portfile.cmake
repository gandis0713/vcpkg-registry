vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gandis0713/jipu
    REF develop
    SHA512 0bfaa4fc10bd24e0706d26e313f79e04d6e422862fda483d1a9610094060f176eec02180598583c4099a5325d9020b7f46deb588c83d48d9f0abdff105589c93
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
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO webgpu-native/webgpu-headers
    REF ba74360436a30ba363141d44ade4e1dec3df2a7c # committed on 2024-09-02
    SHA512 08a5a272389caa3d2d870f053d751d5c9ac82182fb4db36236ed1f68c5df07972a1e4a4db2432422c170834a6ca386bd9544a36625c8d84dfef2a691f7bc0d8e
    HEAD_REF main
)

file(GLOB HEADER_FILES "${SOURCE_PATH}/*.h")
file(COPY ${HEADER_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

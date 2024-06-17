vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO webgpu-native/webgpu-headers
    REF 043af6c77e566f707db36759d9c9f161ebb616fd # committed on 2024-06-13
    SHA512 2fae63b8839408b9791bc84f5de2c21cb61d10f9addbece8948634a2b01cbeed6bd7444f4921652f16ecade7e8e891a1b7ee82d260a3323a2be8a9d22d6e33cb
    HEAD_REF main
)

file(GLOB HEADER_FILES "${SOURCE_PATH}/*.h")
file(COPY ${HEADER_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

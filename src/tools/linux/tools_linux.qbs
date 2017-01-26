import qbs

Project {
    name: "tools_linux"
    condition: qbs.targetOS.contains("linux")

    CppApplication {
        name: "core2md"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "breakpad_client" }

        files: "core2md/core2md.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "dump_syms"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "common" }

        files: "dump_syms/dump_syms.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "dump_syms_mac"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "common" }

        cpp.includePaths: ["../../third_party/mac_headers"]

        files: [
            "../mac/dump_syms/dump_syms_tool.cc",
            "../../common/mac/arch_utilities.cc",
            "../../common/mac/dump_syms.cc",
            "../../common/mac/file_id.cc",
            "../../common/mac/macho_id.cc",
            "../../common/mac/macho_reader.cc",
            "../../common/mac/macho_utilities.cc",
            "../../common/mac/macho_walker.cc",
        ]

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "minidump-2-core"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "common" }

        files: "md2core/minidump-2-core.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "minidump_upload"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "breakpad_client" }

        cpp.dynamicLibraries: 'dl'

        files: "symupload/minidump_upload.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "sym_upload"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "breakpad_client" }

        cpp.dynamicLibraries: 'dl'

        files: "symupload/sym_upload.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }
}

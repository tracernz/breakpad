import qbs

Project {
    name: "tools_mac"
    condition: qbs.targetOS.contains("macos")

    CppApplication {
        name: "crash_report"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "breakpad_client" }

        files: [
            "crash_report/crash_report.mm",
            "crash_report/on_demand_symbol_supplier.mm",
        ]

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

        files: "dump_syms/dump_syms_tool.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    CppApplication {
        name: "macho_dump"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "common" }

        files: "dump_syms/macho_dump.cc"

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

        files: "symupload/minidump_upload.m"

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

        files: "symupload/symupload.m"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }
}

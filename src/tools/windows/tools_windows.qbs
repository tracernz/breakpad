import qbs

Project {
    name: "tools_windows"
    condition: qbs.targetOS.contains("windows")

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
        name: "sym_upload"

        Depends { name: "default_cpp_app_config" }
        Depends { name: "breakpad_client" }

        files: "symupload/symupload.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "bin"
        }
    }

    StaticLibrary {
        name: "ms_symbol_server_converter"

        Depends { name: "default_cpp_config" }
        Depends { name: "common" }

        files: "converter/ms_symbol_server_converter.cc"

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installDir: "lib"
        }
    }
}

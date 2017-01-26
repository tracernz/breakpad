import qbs

Project {
    name: "breakpad"
    property string version: "0.1"
    minimumQbsVersion: "1.6"

    references: [
        "src/client/client.qbs",
        "src/common/common.qbs",
        "src/processor/processor.qbs",
        "src/third_party/libdisasm/libdisasm.qbs",
        "src/tools/tools.qbs",
    ]

    Product {
        name: "docs"

        Group {
            name: "docs"
            files: [
                "AUTHORS",
                "ChangeLog",
                "INSTALL",
                "LICENSE",
                "NEWS",
                "README.md",
            ]
            qbs.install: true
            qbs.installDir: "share/doc/"+project.name+"-"+project.version
        }
    }

    Product {
        name: "breakpad_headers"

        Group {
            name: "breakpad_headers_common"
            files: [
                "src/google_breakpad/common/*.h",
            ]
            qbs.install: true
            qbs.installDir: "include/breakpad/google_breakpad/common"
        }
    }

    Product {
        name: "default_cpp_config"
        Export {
            Depends { name: "cpp" }
            cpp.includePaths: product.sourceDirectory + "/src"
            cpp.cxxLanguageVersion: "c++11"

            Properties {
                condition: qbs.targetOS.contains("linux")
                cpp.defines: ["HAVE_A_OUT_H", "HAVE_MACH_O_NLIST_H"]
            }
            Properties {
                condition: qbs.targetOS.contains("macos")
                cpp.defines: ["HAVE_MACH_O_NLIST_H"]
            }
        }
    }

    Product {
        name: "default_cpp_app_config"
        Export {
            Depends { name: "default_cpp_config" }
            property bool consoleApplication: true
        }
    }
}

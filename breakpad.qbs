import qbs
import qbs.FileInfo

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
            cpp.cxxLanguageVersion: "c++11"

            property stringList commonIncludePaths: [product.sourceDirectory + "/src"]
            property stringList commonDefines: []

            Properties {
                condition: qbs.targetOS.contains("linux")
                cpp.includePaths: commonIncludePaths.concat([product.sourceDirectory + "/src/third_party/mac_headers"])
                cpp.defines: commonDefines.concat(["HAVE_A_OUT_H", "HAVE_MACH_O_NLIST_H"])
            }
            Properties {
                condition: qbs.targetOS.contains("macos")
                cpp.includePaths: commonIncludePaths.concat([product.sourceDirectory + "/src/common/mac"])
                cpp.defines: commonDefines.concat(["HAVE_MACH_O_NLIST_H"])
            }
            Properties {
                property string diaSdk: FileInfo.path(cpp.compilerPath) + "/../../DIA SDK"
                condition: qbs.targetOS.contains("windows") && qbs.toolchain.contains("msvc")
                cpp.includePaths: commonIncludePaths.concat([diaSdk + "/include"])
                cpp.libraryPaths: [diaSdk + "/lib"]
                // TODO: move this to where it's needed only
                cpp.staticLibraries: ["diaguids.lib", "imagehlp.lib", "mincore.lib", "wininet.lib"]
            }
            cpp.includePaths: commonIncludePaths
            cpp.defines: commonDefines
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

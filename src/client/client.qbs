import qbs 1.0

StaticLibrary {
    name: "breakpad_client"

    Depends { name: "default_cpp_config" }
    Depends { name: "common" }

    cpp.debugInformation: true

    files: [
        "minidump_file_writer.cc",
    ]

    Group {
        fileTagsFilter: product.type
        qbs.install: true
        qbs.installDir: "lib"
    }

    Group {
        name: "client_headers_linux_handler"
        files: "linux/handler/*.h"
        condition: qbs.targetOS.contains("linux")
        qbs.install: true
        qbs.installDir: "include/breakpad/client/linux/handler"
    }
    Group {
        name: "client_headers_mac_handler"
        files: "mac/handler/*.h"
        condition: qbs.targetOS.contains("macos")
        qbs.install: true
        qbs.installDir: "include/breakpad/client/mac/handler"
    }
    Group {
        name: "client_headers_win_handler"
        files: "mac/handler/*.h"
        condition: qbs.targetOS.contains("windows")
        qbs.install: true
        qbs.installDir: "include/breakpad/client/win/handler"
    }

    Group {
        name: "client_headers_linux_crash_generation"
        files: "linux/crash_generation/*.h"
        condition: qbs.targetOS.contains("linux")
        qbs.install: true
        qbs.installDir: "include/breakpad/client/linux/crash_generation"
    }

    Group {
        condition: qbs.targetOS.contains("linux")
        files: [
            "linux/crash_generation/crash_generation_client.cc",
            "linux/crash_generation/crash_generation_server.cc",
            "linux/dump_writer_common/thread_info.cc",
            "linux/dump_writer_common/ucontext_reader.cc",
            "linux/handler/exception_handler.cc",
            "linux/handler/minidump_descriptor.cc",
            "linux/log/log.cc",
            "linux/microdump_writer/microdump_writer.cc",
            "linux/minidump_writer/linux_core_dumper.cc",
            "linux/minidump_writer/linux_dumper.cc",
            "linux/minidump_writer/linux_ptrace_dumper.cc",
            "linux/minidump_writer/minidump_writer.cc",
        ]
    }
}

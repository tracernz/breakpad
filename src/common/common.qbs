import qbs 1.0

StaticLibrary {
    name: "common"

    Depends { name: "default_cpp_config" }

    files: [
        "convert_UTF.c",
        "dwarf_cfi_to_module.cc",
        "dwarf_cu_to_module.cc",
        "dwarf_line_to_module.cc",
        "language.cc",
        "md5.cc",
        "module.cc",
        "simple_string_dictionary.cc",
        "stabs_reader.cc",
        "stabs_to_module.cc",
        "string_conversion.cc",
        "test_assembler.cc",
        "dwarf/bytereader.cc",
        "dwarf/elf_reader.cc",
        "dwarf/dwarf2reader.cc",
        "dwarf/cfi_assembler.cc",
        "dwarf/dwarf2diehandler.cc",
        "dwarf/functioninfo.cc",
    ]

    Group {
        name: "Common Headers"
        files: "*.h"
        qbs.install: true
        qbs.installDir: "include/breakpad/common"
    }

    Group {
        name: "Linux Headers"
        files: "linux/*.h"
        condition: qbs.targetOS.contains("linux")
        qbs.install: true
        qbs.installDir: "include/breakpad/common/linux"
    }
    Group {
        name: "Mac Headers"
        files: "mac/*.h"
        condition: qbs.targetOS.contains("macos")
        qbs.install: true
        qbs.installDir: "include/breakpad/common/mac"
    }
    Group {
        name: "Windows Headers"
        files: "windows/*.h"
        condition: qbs.targetOS.contains("windows")
        qbs.install: true
        qbs.installDir: "include/breakpad/common/windows"
    }

    Group {
        condition: qbs.targetOS.contains("linux")
        files: [
            "linux/crc32.cc",
            "linux/dump_symbols.cc",
            "linux/elf_core_dump.cc",
            "linux/elf_symbols_to_module.cc",
            "linux/elfutils.cc",
            "linux/file_id.cc",
            "linux/google_crashdump_uploader.cc",
            "linux/guid_creator.cc",
            "linux/http_upload.cc",
            "linux/libcurl_wrapper.cc",
            "linux/linux_libc_support.cc",
            "linux/memory_mapped_file.cc",
            "linux/safe_readlink.cc",
            "linux/symbol_upload.cc",
            "linux/synth_elf.cc",
        ]
    }

    Group {
    	condition: qbs.targetOS.contains("macos")
    	files: [
    		"mac/arch_utilities.cc",
    		"mac/dump_syms.cc",
    		"mac/file_id.cc",
    		"mac/macho_id.cc",
    		"mac/macho_reader.cc",
    		"mac/macho_utilities.cc",
    		"mac/macho_walker.cc",
    	]
    }
}

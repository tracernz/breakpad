
src = files([
  'convert_UTF.c',
  'md5.cc',
  'module.cc',
  'simple_string_dictionary.cc',
  'string_conversion.cc',
  'test_assembler.cc',
])

if host_machine.system() == 'windows'
  src += files([
    'windows/dia_util.cc',
    'windows/guid_string.cc',
    'windows/http_upload.cc',
    'windows/omap.cc',
    'windows/pdb_source_line_writer.cc',
    'windows/string_utils.cc',
  ])
else
  src += files([
    'dwarf_cfi_to_module.cc',
    'dwarf_cu_to_module.cc',
    'dwarf_line_to_module.cc',
    'language.cc',
    'stabs_reader.cc',
    'stabs_to_module.cc',
    'dwarf/bytereader.cc',
    'dwarf/elf_reader.cc',
    'dwarf/dwarf2reader.cc',
    'dwarf/cfi_assembler.cc',
    'dwarf/dwarf2diehandler.cc',
    'dwarf/functioninfo.cc',
  ])
endif

if host_machine.system() == 'darwin'
  src += files([
    'mac/MachIPC.mm',
    'mac/arch_utilities.cc',
    'mac/bootstrap_compat.cc',
    'mac/dump_syms.cc',
    'mac/file_id.cc',
    'mac/macho_id.cc',
    'mac/macho_reader.cc',
    'mac/macho_utilities.cc',
    'mac/macho_walker.cc',
    'mac/string_utilities.cc',
  ])
  deps += dependency('CoreFoundation')
elif host_machine.system() == 'linux'
  src += files([
    'linux/crc32.cc',
    'linux/dump_symbols.cc',
    'linux/elf_core_dump.cc',
    'linux/elf_symbols_to_module.cc',
    'linux/elfutils.cc',
    'linux/file_id.cc',
    'linux/google_crashdump_uploader.cc',
    'linux/guid_creator.cc',
    'linux/http_upload.cc',
    'linux/libcurl_wrapper.cc',
    'linux/linux_libc_support.cc',
    'linux/memory_mapped_file.cc',
    'linux/safe_readlink.cc',
    'linux/symbol_upload.cc',
    'linux/synth_elf.cc',
  ])
endif

includes = []
compiler = meson.get_compiler('cpp')
if compiler.has_header('mach-o/nlist.h')
  add_global_arguments('-DHAVE_MACH_O_NLIST_H', language: 'cpp')
elif host_machine.system() == 'linux'
  add_global_arguments('-DHAVE_MACH_O_NLIST_H', language: 'cpp')
  includes += '../third_party/mac_headers'
endif
includes = include_directories(includes)

common = static_library('common', src, version : '1.0.0', soversion : '0',
  pic: true, include_directories: [main_includes, includes])

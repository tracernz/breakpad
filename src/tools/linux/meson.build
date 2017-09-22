core2md_src = files('core2md/core2md.cc')
executable('core2md', core2md_src, include_directories: main_includes, link_with: client_a)

dump_syms_src = files('dump_syms/dump_syms.cc')
executable('dump_syms', dump_syms_src, include_directories: main_includes, link_with: common)

md2core_src = files('md2core/minidump-2-core.cc')
executable('md2core', md2core_src, include_directories: main_includes, link_with: common)

md_upload_src = files('symupload/minidump_upload.cc')
executable('minidump_upload', md_upload_src, include_directories: main_includes, link_with: client_a)

sym_upload_src = files('symupload/sym_upload.cc')
executable('sym_upload', sym_upload_src, include_directories: main_includes, link_with: client_a)

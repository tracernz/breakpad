
deps = [
  dependency('threads'),
  meson.get_compiler('cpp').find_library('dl', required : false),
]

if host_machine.system() == 'windows'
  src = files([
    'windows/crash_generation/client_info.cc',
    'windows/crash_generation/crash_generation_client.cc',
    'windows/crash_generation/crash_generation_server.cc',
    'windows/crash_generation/minidump_generator.cc',
    'windows/handler/exception_handler.cc',
    'windows/sender/crash_report_sender.cc',
  ])
elif host_machine.system() == 'darwin'
  src = files([
    'minidump_file_writer.cc',
    'mac/crash_generation/crash_generation_client.cc',
    'mac/crash_generation/crash_generation_server.cc',
    'mac/handler/breakpad_nlist_64.cc',
    'mac/handler/dynamic_images.cc',
    'mac/handler/exception_handler.cc',
    'mac/handler/minidump_generator.cc',
    'mac/handler/protected_memory_allocator.cc',
  ])
  deps += dependency('CoreFoundation')
else
  src = files([
    'minidump_file_writer.cc',
    'linux/crash_generation/crash_generation_client.cc',
    'linux/crash_generation/crash_generation_server.cc',
    'linux/dump_writer_common/thread_info.cc',
    'linux/dump_writer_common/ucontext_reader.cc',
    'linux/handler/exception_handler.cc',
    'linux/handler/minidump_descriptor.cc',
    'linux/log/log.cc',
    'linux/microdump_writer/microdump_writer.cc',
    'linux/minidump_writer/linux_core_dumper.cc',
    'linux/minidump_writer/linux_dumper.cc',
    'linux/minidump_writer/linux_ptrace_dumper.cc',
    'linux/minidump_writer/minidump_writer.cc',
  ])
endif

install_headers()

client_so = shared_library('breakpad_client', src, version : '1.0.0', soversion : '0',
  dependencies: deps, include_directories: main_includes, link_with: common)
client_a = static_library('breakpad_client', src, version : '1.0.0', soversion : '0',
  dependencies: deps, pic: true, include_directories: main_includes, link_with: common)

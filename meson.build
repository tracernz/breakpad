project('breakpad', ['c', 'cpp'], default_options: ['c_std=c11', 'cpp_std=c++11'])

main_includes = include_directories('src')

subdir('src/common')
subdir('src/client')

if host_machine.system() == 'linux'
  subdir('src/tools/linux')
endif

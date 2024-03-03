# test_drive


## Getting Started

# Building
## Issue: lstdc++
```/usr/bin/ld: cannot find -lstdc++: No such file or directory```

https://stackoverflow.com/questions/74543715/usr-bin-ld-cannot-find-lstdc-no-such-file-or-directory-on-running-flutte

Solution:
```sh
sudo apt install libstdc++-12-dev
```

## Issue: Permission denied
```
CMake Error at cmake_install.cmake:66 (file):
  file INSTALL cannot copy file "/media/iposthuman/Extreme
  SSD/Development/Flutter/FlutterSoftwareRenderer/TestDrive/test_drive/build/linux/x64/debug/intermediates_do_not_run/test_drive"
  to "/usr/local/test_drive": Permission denied.
```

Solution:
```flutter clean```
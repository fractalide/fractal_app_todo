{ buildRustCode, fetchzip, release, verbose }:
let
    all_crates_1_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "all_crates";
      version = "1.1.1";
      fractalType = "crate";
      src = ./.;
      inherit dependencies features release verbose;
    };
    bitflags_0_9_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "bitflags";
      version = "0.9.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/bitflags/0.9.1/download";
        sha256 = "18h073l5jd88rx4qdr95fjddr9rk79pb1aqnshzdnw16cfmb9rws";
        name = "bitflags-0.9.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    json_0_11_9_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "json";
      version = "0.11.9";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/json/0.11.9/download";
        sha256 = "0pmvz3qf6fzm7vszfcfzimbjl82fkhv1hzm4rzb38yddqk02mpyz";
        name = "json-0.11.9.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    kernel32_sys_0_2_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "kernel32-sys";
      version = "0.2.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/kernel32-sys/0.2.2/download";
        sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
        name = "kernel32-sys-0.2.2.tar.gz";
      };
      libName = "kernel32";
      build = "build.rs";
      buildDependencies = [ winapi_build_0_1_1_ ];      inherit dependencies features release verbose;
    };
    libc_0_2_30_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "libc";
      version = "0.2.30";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/libc/0.2.30/download";
        sha256 = "1c4gi6r5gbpbw3dmryc98x059awl4003cfz5kd6lqm03gp62wlkw";
        name = "libc-0.2.30.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    libsqlite3_sys_0_8_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "libsqlite3-sys";
      version = "0.8.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/libsqlite3-sys/0.8.1/download";
        sha256 = "131bjlxzni2aw3048p7sj8cs3v0jpkb3fxdpc5i7ndyhvpz3gdza";
        name = "libsqlite3-sys-0.8.1.tar.gz";
      };
      build = "build.rs";
      buildDependencies = [ ];      inherit dependencies features release verbose;
    };
    linked_hash_map_0_4_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "linked-hash-map";
      version = "0.4.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/linked-hash-map/0.4.2/download";
        sha256 = "04da208h6jb69f46j37jnvsw2i1wqplglp4d61csqcrhh83avbgl";
        name = "linked-hash-map-0.4.2.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    lru_cache_0_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "lru-cache";
      version = "0.1.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/lru-cache/0.1.1/download";
        sha256 = "1hl6kii1g54sq649gnscv858mmw7a02xj081l4vcgvrswdi2z8fw";
        name = "lru-cache-0.1.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    pkg_config_0_3_9_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "pkg-config";
      version = "0.3.9";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/pkg-config/0.3.9/download";
        sha256 = "06k8fxgrsrxj8mjpjcq1n7mn2p1shpxif4zg9y5h09c7vy20s146";
        name = "pkg-config-0.3.9.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    redox_syscall_0_1_31_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "redox_syscall";
      version = "0.1.31";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.31/download";
        sha256 = "0kipd9qslzin4fgj4jrxv6yz5l3l71gnbd7fq1jhk2j7f2sq33j4";
        name = "redox_syscall-0.1.31.tar.gz";
      };
      libName = "syscall";
      inherit dependencies features release verbose;
    };
    rusqlite_0_12_0_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "rusqlite";
      version = "0.12.0";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/rusqlite/0.12.0/download";
        sha256 = "18fybr7bd012j7axf4gzpphx0iil2amksdlab4dhhipjl6hyam6j";
        name = "rusqlite-0.12.0.tar.gz";
      };
      libName = "rusqlite";
      inherit dependencies features release verbose;
    };
    time_0_1_38_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "time";
      version = "0.1.38";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/time/0.1.38/download";
        sha256 = "1ws283vvz7c6jfiwn53rmc6kybapr4pjaahfxxrz232b0qzw7gcp";
        name = "time-0.1.38.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    vcpkg_0_2_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "vcpkg";
      version = "0.2.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/vcpkg/0.2.2/download";
        sha256 = "1fl5j0ksnwrnsrf1b1a9lqbjgnajdipq0030vsbhx81mb7d9478a";
        name = "vcpkg-0.2.2.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    winapi_0_2_8_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "winapi";
      version = "0.2.8";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/winapi/0.2.8/download";
        sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
        name = "winapi-0.2.8.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    winapi_build_0_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "winapi-build";
      version = "0.1.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/winapi-build/0.1.1/download";
        sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
        name = "winapi-build-0.1.1.tar.gz";
      };
      libName = "build";
      inherit dependencies features release verbose;
    };

in
rec {
  all_crates_1_1_1 = all_crates_1_1_1_ {
    dependencies = [ json_0_11_9 rusqlite_0_12_0 ];
  };
  bitflags_0_9_1 = bitflags_0_9_1_ {
    features = [ "example_generated" ];
  };
  json_0_11_9 = json_0_11_9_ {};
  kernel32_sys_0_2_2 = kernel32_sys_0_2_2_ {
    dependencies = [ winapi_0_2_8 winapi_build_0_1_1 ];
  };
  libc_0_2_30 = libc_0_2_30_ {
    features = [ "use_std" ];
  };
  libsqlite3_sys_0_8_1 = libsqlite3_sys_0_8_1_ {
    dependencies = [ pkg_config_0_3_9 vcpkg_0_2_2 ];
    features = [ "min_sqlite_version_3_6_8" "pkg-config" "vcpkg" ];
  };
  linked_hash_map_0_4_2 = linked_hash_map_0_4_2_ {};
  lru_cache_0_1_1 = lru_cache_0_1_1_ {
    dependencies = [ linked_hash_map_0_4_2 ];
  };
  pkg_config_0_3_9 = pkg_config_0_3_9_ {};
  redox_syscall_0_1_31 = redox_syscall_0_1_31_ {};
  rusqlite_0_12_0 = rusqlite_0_12_0_ {
    dependencies = [ bitflags_0_9_1 libsqlite3_sys_0_8_1 lru_cache_0_1_1 time_0_1_38 ];
  };
  time_0_1_38 = time_0_1_38_ {
    dependencies = [ kernel32_sys_0_2_2 libc_0_2_30 redox_syscall_0_1_31 winapi_0_2_8 ];
  };
  vcpkg_0_2_2 = vcpkg_0_2_2_ {};
  winapi_0_2_8 = winapi_0_2_8_ {};
  winapi_build_0_1_1 = winapi_build_0_1_1_ {};
  all_crates = all_crates_1_1_1;
  bitflags = bitflags_0_9_1;
  json = json_0_11_9;
  kernel32_sys = kernel32_sys_0_2_2;
  libc = libc_0_2_30;
  libsqlite3_sys = libsqlite3_sys_0_8_1;
  linked_hash_map = linked_hash_map_0_4_2;
  lru_cache = lru_cache_0_1_1;
  pkg_config = pkg_config_0_3_9;
  redox_syscall = redox_syscall_0_1_31;
  rusqlite = rusqlite_0_12_0;
  time = time_0_1_38;
  vcpkg = vcpkg_0_2_2;
  winapi = winapi_0_2_8;
  winapi_build = winapi_build_0_1_1;
}

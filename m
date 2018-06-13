Return-Path: bensammy2@yahoo.co.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92a83af9
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 17:43:34 +0000 (UTC)
Received: from sonic301-22.consmr.mail.ir2.yahoo.com
 (sonic301-22.consmr.mail.ir2.yahoo.com [77.238.176.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 268dd633
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 17:43:33 +0000 (UTC)
Date: Wed, 13 Jun 2018 17:47:25 +0000 (UTC)
From: Ben Edmunds <bensammy2@yahoo.co.uk>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <193313766.8410087.1528912045317@mail.yahoo.com>
Subject: Building the android apk on osx (case sensitive)
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_8410086_216130800.1528912045281"
References: <193313766.8410087.1528912045317.ref@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_8410086_216130800.1528912045281
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,
Ive been getting into helping out a little with the android app however whe=
n i run the build on a mac im getting the following.Are you able to point m=
e in the right direction to fix this?
Thanks
Bens-MacBook-Air:wireguard-android ben$ ./gradlew assembleRelease

Starting a Gradle Daemon, 2 stopped Daemons could not be reused, use --stat=
us for details




> Task :app:externalNativeBuildRelease FAILED

Build libwg.so x86_64

[1/19] Building wireguard-go

FAILED: cd /Users/ben/Documents/GitHub/wireguard-android/app/tools/libwg-go=
 && make ANDROID_ARCH_NAME=3Dx86_64 ANDROID_C_COMPILER=3D/Users/ben/Library=
/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang AN=
DROID_TOOLCHAIN_ROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/toolchains=
/x86_64-4.9/prebuilt/darwin-x86_64 ANDROID_LLVM_TRIPLE=3Dx86_64-none-linux-=
android ANDROID_SYSROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/sysroot=
 "CFLAGS=3D-isystem /Users/ben/Library/Android/sdk/ndk-bundle/sysroot/usr/i=
nclude/x86_64-linux-android -D__ANDROID_API__=3D21 -g -DANDROID -ffunction-=
sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -W=
a,--noexecstack -Wformat -Werror=3Dformat-security=C2=A0 -Wno-unused-comman=
d-line-argument" "LDFLAGS=3D-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,=
libatomic.a -nostdlib++ --sysroot /Users/ben/Library/Android/sdk/ndk-bundle=
/platforms/android-21/arch-x86_64 -Wl,--build-id -Wl,--warn-shared-textrel =
-Wl,--fatal-warnings -L/Users/ben/Library/Android/sdk/ndk-bundle/sources/cx=
x-stl/llvm-libc++/libs/x86_64 -Wl,--no-undefined -Wl,-z,noexecstack -Qunuse=
d-arguments -Wl,-z,relro -Wl,-z,now=C2=A0 -fuse-ld=3Dgold" DESTDIR=3D/Users=
/ben/Documents/GitHub/wireguard-android/app/build/intermediates/cmake/relea=
se/obj/x86_64

Using system Go

find . -name '*.go' -type l -delete

find . -type d -empty -delete

mkdir -p ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ./src/git.zx2c4.com/=
wireguard-go/ratelimiter/ ./src/git.zx2c4.com/wireguard-go/replay/ ./src/gi=
t.zx2c4.com/wireguard-go/replay/ ./src/git.zx2c4.com/wireguard-go/rwcancel/=
 ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-g=
o/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/=
wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/tai64n/ ./src/git.z=
x2c4.com/wireguard-go/tai64n/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src/g=
it.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src/=
git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src=
/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ./src/git.zx2c4.com/wireguar=
d-go/xchacha20poly1305/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.c=
om/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wire=
guard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-g=
o/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./sr=
c/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.z=
x2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.co=
m/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireg=
uard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go=
/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src=
/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx=
2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com=
/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wiregu=
ard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/=
 ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/=
git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2=
c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/

ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ../wireguard-go/rate=
limiter/ratelimiter.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimit=
er/ ../wireguard-go/ratelimiter/ratelimiter_test.go; ln -sfrt ./src/git.zx2=
c4.com/wireguard-go/replay/ ../wireguard-go/replay/replay.go; ln -sfrt ./sr=
c/git.zx2c4.com/wireguard-go/replay/ ../wireguard-go/replay/replay_test.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcanc=
el/fdset_default.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ..=
/wireguard-go/rwcancel/fdset_freebsd.go; ln -sfrt ./src/git.zx2c4.com/wireg=
uard-go/rwcancel/ ../wireguard-go/rwcancel/rwcancel.go; ln -sfrt ./src/git.=
zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/select_default.go=
; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcan=
cel/select_linux.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tai64n/ ../w=
ireguard-go/tai64n/tai64n.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tai=
64n/ ../wireguard-go/tai64n/tai64n_test.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/tun/ ../wireguard-go/tun/tun.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/tun/ ../wireguard-go/tun/tun_darwin.go; ln -sfrt ./src/git.zx2c4=
.com/wireguard-go/tun/ ../wireguard-go/tun/tun_freebsd.go; ln -sfrt ./src/g=
it.zx2c4.com/wireguard-go/tun/ ../wireguard-go/tun/tun_linux.go; ln -sfrt .=
/src/git.zx2c4.com/wireguard-go/tun/ ../wireguard-go/tun/tun_openbsd.go; ln=
 -sfrt ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ../wireguard-go/=
xchacha20poly1305/xchacha20.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/x=
chacha20poly1305/ ../wireguard-go/xchacha20poly1305/xchacha20_test.go; ln -=
sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips.go; ln -s=
frt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips_rand_test.=
go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips_t=
est.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/bind_tes=
t.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn_default.go; =
ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn_linux.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/constants.go; ln =
-sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/cookie.go; ln -sfrt=
 ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/cookie_test.go; ln -sfrt=
 ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/device.go; ln -sfrt ./sr=
c/git.zx2c4.com/wireguard-go/ ../wireguard-go/device_test.go; ln -sfrt ./sr=
c/git.zx2c4.com/wireguard-go/ ../wireguard-go/donotuseon_linux.go; ln -sfrt=
 ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/endpoint_test.go; ln -sf=
rt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/helper_test.go; ln -sf=
rt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/indextable.go; ln -sfr=
t ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/ip.go; ln -sfrt ./src/g=
it.zx2c4.com/wireguard-go/ ../wireguard-go/kdf_test.go; ln -sfrt ./src/git.=
zx2c4.com/wireguard-go/ ../wireguard-go/keypair.go; ln -sfrt ./src/git.zx2c=
4.com/wireguard-go/ ../wireguard-go/logger.go; ln -sfrt ./src/git.zx2c4.com=
/wireguard-go/ ../wireguard-go/misc.go; ln -sfrt ./src/git.zx2c4.com/wiregu=
ard-go/ ../wireguard-go/noise-helpers.go; ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/ ../wireguard-go/noise-protocol.go; ln -sfrt ./src/git.zx2c4.com/w=
ireguard-go/ ../wireguard-go/noise-types.go; ln -sfrt ./src/git.zx2c4.com/w=
ireguard-go/ ../wireguard-go/noise_test.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/ ../wireguard-go/peer.go; ln -sfrt ./src/git.zx2c4.com/wireguard=
-go/ ../wireguard-go/receive.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/=
 ../wireguard-go/send.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wir=
eguard-go/timers.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguar=
d-go/tun.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uap=
i.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uapi_bsd.g=
o; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uapi_linux.go=
; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/version.go;

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

ln: illegal option -- r

usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 link source_file target_file

make: *** [/Users/ben/Documents/GitHub/wireguard-android/app/build/intermed=
iates/cmake/release/obj/x86_64/libwg-go.so] Error 1

ninja: build stopped: subcommand failed.







FAILURE: Build failed with an exception.




* What went wrong:

Execution failed for task ':app:externalNativeBuildRelease'.

> Build command failed.

=C2=A0 Error while executing process /Users/ben/Library/Android/sdk/cmake/3=
.6.4111459/bin/cmake with arguments {--build /Users/ben/Documents/GitHub/wi=
reguard-android/app/.externalNativeBuild/cmake/release/x86_64 --target libw=
g.so}

=C2=A0 [1/19] Building wireguard-go

=C2=A0 FAILED: cd /Users/ben/Documents/GitHub/wireguard-android/app/tools/l=
ibwg-go && make ANDROID_ARCH_NAME=3Dx86_64 ANDROID_C_COMPILER=3D/Users/ben/=
Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/c=
lang ANDROID_TOOLCHAIN_ROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/too=
lchains/x86_64-4.9/prebuilt/darwin-x86_64 ANDROID_LLVM_TRIPLE=3Dx86_64-none=
-linux-android ANDROID_SYSROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/=
sysroot "CFLAGS=3D-isystem /Users/ben/Library/Android/sdk/ndk-bundle/sysroo=
t/usr/include/x86_64-linux-android -D__ANDROID_API__=3D21 -g -DANDROID -ffu=
nction-sections -funwind-tables -fstack-protector-strong -no-canonical-pref=
ixes -Wa,--noexecstack -Wformat -Werror=3Dformat-security=C2=A0 -Wno-unused=
-command-line-argument" "LDFLAGS=3D-Wl,--exclude-libs,libgcc.a -Wl,--exclud=
e-libs,libatomic.a -nostdlib++ --sysroot /Users/ben/Library/Android/sdk/ndk=
-bundle/platforms/android-21/arch-x86_64 -Wl,--build-id -Wl,--warn-shared-t=
extrel -Wl,--fatal-warnings -L/Users/ben/Library/Android/sdk/ndk-bundle/sou=
rces/cxx-stl/llvm-libc++/libs/x86_64 -Wl,--no-undefined -Wl,-z,noexecstack =
-Qunused-arguments -Wl,-z,relro -Wl,-z,now=C2=A0 -fuse-ld=3Dgold" DESTDIR=
=3D/Users/ben/Documents/GitHub/wireguard-android/app/build/intermediates/cm=
ake/release/obj/x86_64

=C2=A0 Using system Go

=C2=A0 find . -name '*.go' -type l -delete

=C2=A0 find . -type d -empty -delete

=C2=A0 mkdir -p ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ./src/git.zx2=
c4.com/wireguard-go/ratelimiter/ ./src/git.zx2c4.com/wireguard-go/replay/ .=
/src/git.zx2c4.com/wireguard-go/replay/ ./src/git.zx2c4.com/wireguard-go/rw=
cancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wire=
guard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2=
c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/tai64n/ ./sr=
c/git.zx2c4.com/wireguard-go/tai64n/ ./src/git.zx2c4.com/wireguard-go/tun/ =
./src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/=
 ./src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun=
/ ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ./src/git.zx2c4.com/w=
ireguard-go/xchacha20poly1305/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.=
zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.c=
om/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wire=
guard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-g=
o/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./sr=
c/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.z=
x2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.co=
m/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireg=
uard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go=
/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src=
/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx=
2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com=
/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wiregu=
ard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/=
 ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/=
git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/

=C2=A0 ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ../wireguard-=
go/ratelimiter/ratelimiter.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ra=
telimiter/ ../wireguard-go/ratelimiter/ratelimiter_test.go; ln -sfrt ./src/=
git.zx2c4.com/wireguard-go/replay/ ../wireguard-go/replay/replay.go; ln -sf=
rt ./src/git.zx2c4.com/wireguard-go/replay/ ../wireguard-go/replay/replay_t=
est.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go=
/rwcancel/fdset_default.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcan=
cel/ ../wireguard-go/rwcancel/fdset_freebsd.go; ln -sfrt ./src/git.zx2c4.co=
m/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/rwcancel.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/select_def=
ault.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-g=
o/rwcancel/select_linux.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tai64=
n/ ../wireguard-go/tai64n/tai64n.go; ln -sfrt ./src/git.zx2c4.com/wireguard=
-go/tai64n/ ../wireguard-go/tai64n/tai64n_test.go; ln -sfrt ./src/git.zx2c4=
.com/wireguard-go/tun/ ../wireguard-go/tun/tun.go; ln -sfrt ./src/git.zx2c4=
.com/wireguard-go/tun/ ../wireguard-go/tun/tun_darwin.go; ln -sfrt ./src/gi=
t.zx2c4.com/wireguard-go/tun/ ../wireguard-go/tun/tun_freebsd.go; ln -sfrt =
./src/git.zx2c4.com/wireguard-go/tun/ ../wireguard-go/tun/tun_linux.go; ln =
-sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../wireguard-go/tun/tun_openbsd=
.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ../wiregu=
ard-go/xchacha20poly1305/xchacha20.go; ln -sfrt ./src/git.zx2c4.com/wiregua=
rd-go/xchacha20poly1305/ ../wireguard-go/xchacha20poly1305/xchacha20_test.g=
o; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips.go=
; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips_ran=
d_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/allow=
edips_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/b=
ind_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/con=
n.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn_defau=
lt.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn_linu=
x.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/constants.=
go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/cookie.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/cookie_test.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/device.go; ln -sf=
rt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/device_test.go; ln -sf=
rt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/donotuseon_linux.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/endpoint_test.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/helper_test.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/indextable.go; =
ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/ip.go; ln -sfrt =
./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/kdf_test.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/ ../wireguard-go/keypair.go; ln -sfrt ./src/g=
it.zx2c4.com/wireguard-go/ ../wireguard-go/logger.go; ln -sfrt ./src/git.zx=
2c4.com/wireguard-go/ ../wireguard-go/misc.go; ln -sfrt ./src/git.zx2c4.com=
/wireguard-go/ ../wireguard-go/noise-helpers.go; ln -sfrt ./src/git.zx2c4.c=
om/wireguard-go/ ../wireguard-go/noise-protocol.go; ln -sfrt ./src/git.zx2c=
4.com/wireguard-go/ ../wireguard-go/noise-types.go; ln -sfrt ./src/git.zx2c=
4.com/wireguard-go/ ../wireguard-go/noise_test.go; ln -sfrt ./src/git.zx2c4=
.com/wireguard-go/ ../wireguard-go/peer.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/ ../wireguard-go/receive.go; ln -sfrt ./src/git.zx2c4.com/wiregu=
ard-go/ ../wireguard-go/send.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/=
 ../wireguard-go/timers.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../w=
ireguard-go/tun.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard=
-go/uapi.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uap=
i_bsd.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uapi_l=
inux.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/version=
.go;

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 ln: illegal option -- r

=C2=A0 usage: ln [-Ffhinsv] source_file [target_file]

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln [-Ffhinsv] source_file ... target_dir

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 link source_file target_file

=C2=A0 make: *** [/Users/ben/Documents/GitHub/wireguard-android/app/build/i=
ntermediates/cmake/release/obj/x86_64/libwg-go.so] Error 1

=C2=A0 ninja: build stopped: subcommand failed.







* Try:

Run with --stacktrace option to get the stack trace. Run with --info or --d=
ebug option to get more log output. Run with --scan to get full insights.




* Get more help at https://help.gradle.org




BUILD FAILED in 12s

21 actionable tasks: 1 executed, 20 up-to-date


------=_Part_8410086_216130800.1528912045281
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family:Helvetica Neue, Helvetic=
a, Arial, sans-serif;font-size:13px;"><div>Hi Jason,</div><div><br></div><d=
iv>Ive been getting into helping out a little with the android app however =
when i run the build on a mac im getting the following.</div><div>Are you a=
ble to point me in the right direction to fix this?</div><div><br></div><di=
v>Thanks</div><div><span>







<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Bens-MacBook-Air:wir=
eguard-android ben$ ./gradlew assembleRelease</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Starting a Gradle Da=
emon, 2 stopped Daemons could not be reused, use --status for details</span=
></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p3"><span class=3D"ydp8c3c748s1"><b>&gt; Task :app:ex=
ternalNativeBuildRelease</b> FAILED</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Build libwg.so x86_6=
4</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">[1/19] Building wire=
guard-go</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">FAILED: cd /Users/be=
n/Documents/GitHub/wireguard-android/app/tools/libwg-go &amp;&amp; make AND=
ROID_ARCH_NAME=3Dx86_64 ANDROID_C_COMPILER=3D/Users/ben/Library/Android/sdk=
/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang ANDROID_TOOLCH=
AIN_ROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/toolchains/x86_64-4.9/=
prebuilt/darwin-x86_64 ANDROID_LLVM_TRIPLE=3Dx86_64-none-linux-android ANDR=
OID_SYSROOT=3D/Users/ben/Library/Android/sdk/ndk-bundle/sysroot "CFLAGS=3D-=
isystem /Users/ben/Library/Android/sdk/ndk-bundle/sysroot/usr/include/x86_6=
4-linux-android -D__ANDROID_API__=3D21 -g -DANDROID -ffunction-sections -fu=
nwind-tables -fstack-protector-strong -no-canonical-prefixes -Wa,--noexecst=
ack -Wformat -Werror=3Dformat-security<span class=3D"ydp8c3c748Apple-conver=
ted-space">&nbsp; </span>-Wno-unused-command-line-argument" "LDFLAGS=3D-Wl,=
--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a -nostdlib++ --sysroo=
t /Users/ben/Library/Android/sdk/ndk-bundle/platforms/android-21/arch-x86_6=
4 -Wl,--build-id -Wl,--warn-shared-textrel -Wl,--fatal-warnings -L/Users/be=
n/Library/Android/sdk/ndk-bundle/sources/cxx-stl/llvm-libc++/libs/x86_64 -W=
l,--no-undefined -Wl,-z,noexecstack -Qunused-arguments -Wl,-z,relro -Wl,-z,=
now<span class=3D"ydp8c3c748Apple-converted-space">&nbsp; </span>-fuse-ld=
=3Dgold" DESTDIR=3D/Users/ben/Documents/GitHub/wireguard-android/app/build/=
intermediates/cmake/release/obj/x86_64</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Using system Go</spa=
n></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">find . -name '*.go' =
-type l -delete</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">find . -type d -empt=
y -delete</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">mkdir -p ./src/git.z=
x2c4.com/wireguard-go/ratelimiter/ ./src/git.zx2c4.com/wireguard-go/ratelim=
iter/ ./src/git.zx2c4.com/wireguard-go/replay/ ./src/git.zx2c4.com/wireguar=
d-go/replay/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com=
/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/gi=
t.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcance=
l/ ./src/git.zx2c4.com/wireguard-go/tai64n/ ./src/git.zx2c4.com/wireguard-g=
o/tai64n/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wiregua=
rd-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wiregu=
ard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireg=
uard-go/xchacha20poly1305/ ./src/git.zx2c4.com/wireguard-go/xchacha20poly13=
05/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./s=
rc/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.=
zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.c=
om/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wire=
guard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-g=
o/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./sr=
c/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.z=
x2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.co=
m/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireg=
uard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go=
/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src=
/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx=
2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com=
/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wiregu=
ard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/=
 ./src/git.zx2c4.com/wireguard-go/</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln -sfrt ./src/git.z=
x2c4.com/wireguard-go/ratelimiter/ ../wireguard-go/ratelimiter/ratelimiter.=
go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ../wireguard-go/=
ratelimiter/ratelimiter_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/=
replay/ ../wireguard-go/replay/replay.go; ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/replay/ ../wireguard-go/replay/replay_test.go; ln -sfrt ./src/git.=
zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/fdset_default.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcanc=
el/fdset_freebsd.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ..=
/wireguard-go/rwcancel/rwcancel.go; ln -sfrt ./src/git.zx2c4.com/wireguard-=
go/rwcancel/ ../wireguard-go/rwcancel/select_default.go; ln -sfrt ./src/git=
.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/select_linux.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/tai64n/ ../wireguard-go/tai64n/t=
ai64n.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tai64n/ ../wireguard-go=
/tai64n/tai64n_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../w=
ireguard-go/tun/tun.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../w=
ireguard-go/tun/tun_darwin.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tu=
n/ ../wireguard-go/tun/tun_freebsd.go; ln -sfrt ./src/git.zx2c4.com/wiregua=
rd-go/tun/ ../wireguard-go/tun/tun_linux.go; ln -sfrt ./src/git.zx2c4.com/w=
ireguard-go/tun/ ../wireguard-go/tun/tun_openbsd.go; ln -sfrt ./src/git.zx2=
c4.com/wireguard-go/xchacha20poly1305/ ../wireguard-go/xchacha20poly1305/xc=
hacha20.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ..=
/wireguard-go/xchacha20poly1305/xchacha20_test.go; ln -sfrt ./src/git.zx2c4=
.com/wireguard-go/ ../wireguard-go/allowedips.go; ln -sfrt ./src/git.zx2c4.=
com/wireguard-go/ ../wireguard-go/allowedips_rand_test.go; ln -sfrt ./src/g=
it.zx2c4.com/wireguard-go/ ../wireguard-go/allowedips_test.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/ ../wireguard-go/bind_test.go; ln -sfrt ./src=
/git.zx2c4.com/wireguard-go/ ../wireguard-go/conn.go; ln -sfrt ./src/git.zx=
2c4.com/wireguard-go/ ../wireguard-go/conn_default.go; ln -sfrt ./src/git.z=
x2c4.com/wireguard-go/ ../wireguard-go/conn_linux.go; ln -sfrt ./src/git.zx=
2c4.com/wireguard-go/ ../wireguard-go/constants.go; ln -sfrt ./src/git.zx2c=
4.com/wireguard-go/ ../wireguard-go/cookie.go; ln -sfrt ./src/git.zx2c4.com=
/wireguard-go/ ../wireguard-go/cookie_test.go; ln -sfrt ./src/git.zx2c4.com=
/wireguard-go/ ../wireguard-go/device.go; ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/ ../wireguard-go/device_test.go; ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/ ../wireguard-go/donotuseon_linux.go; ln -sfrt ./src/git.zx2c4.com=
/wireguard-go/ ../wireguard-go/endpoint_test.go; ln -sfrt ./src/git.zx2c4.c=
om/wireguard-go/ ../wireguard-go/helper_test.go; ln -sfrt ./src/git.zx2c4.c=
om/wireguard-go/ ../wireguard-go/indextable.go; ln -sfrt ./src/git.zx2c4.co=
m/wireguard-go/ ../wireguard-go/ip.go; ln -sfrt ./src/git.zx2c4.com/wiregua=
rd-go/ ../wireguard-go/kdf_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-=
go/ ../wireguard-go/keypair.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ =
../wireguard-go/logger.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wi=
reguard-go/misc.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard=
-go/noise-helpers.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wiregua=
rd-go/noise-protocol.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wire=
guard-go/noise-types.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wire=
guard-go/noise_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireg=
uard-go/peer.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go=
/receive.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/sen=
d.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/timers.go;=
 ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/tun.go; ln -sfr=
t ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/uapi.go; ln -sfrt ./src=
/git.zx2c4.com/wireguard-go/ ../wireguard-go/uapi_bsd.go; ln -sfrt ./src/gi=
t.zx2c4.com/wireguard-go/ ../wireguard-go/uapi_linux.go; ln -sfrt ./src/git=
.zx2c4.com/wireguard-go/ ../wireguard-go/version.go;</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ln: illegal option -=
- r</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">usage: ln [-Ffhinsv]=
 source_file [target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>ln [-Ffhinsv]=
 source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; </span>link source_f=
ile target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">make: *** [/Users/be=
n/Documents/GitHub/wireguard-android/app/build/intermediates/cmake/release/=
obj/x86_64/libwg-go.so] Error 1</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">ninja: build stopped=
: subcommand failed.</span></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p3"><span class=3D"ydp8c3c748s1">FAILURE: Build faile=
d with an exception.</span></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">* What went wrong:</=
span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Execution failed for=
 task ':app:externalNativeBuildRelease'.</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s2">&gt; </span><span cl=
ass=3D"ydp8c3c748s1">Build command failed.</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>Error while executing process /Us=
ers/ben/Library/Android/sdk/cmake/3.6.4111459/bin/cmake with arguments {--b=
uild /Users/ben/Documents/GitHub/wireguard-android/app/.externalNativeBuild=
/cmake/release/x86_64 --target libwg.so}</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>[1/19] Building wireguard-go</spa=
n></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>FAILED: cd /Users/ben/Documents/G=
itHub/wireguard-android/app/tools/libwg-go &amp;&amp; make ANDROID_ARCH_NAM=
E=3Dx86_64 ANDROID_C_COMPILER=3D/Users/ben/Library/Android/sdk/ndk-bundle/t=
oolchains/llvm/prebuilt/darwin-x86_64/bin/clang ANDROID_TOOLCHAIN_ROOT=3D/U=
sers/ben/Library/Android/sdk/ndk-bundle/toolchains/x86_64-4.9/prebuilt/darw=
in-x86_64 ANDROID_LLVM_TRIPLE=3Dx86_64-none-linux-android ANDROID_SYSROOT=
=3D/Users/ben/Library/Android/sdk/ndk-bundle/sysroot "CFLAGS=3D-isystem /Us=
ers/ben/Library/Android/sdk/ndk-bundle/sysroot/usr/include/x86_64-linux-and=
roid -D__ANDROID_API__=3D21 -g -DANDROID -ffunction-sections -funwind-table=
s -fstack-protector-strong -no-canonical-prefixes -Wa,--noexecstack -Wforma=
t -Werror=3Dformat-security<span class=3D"ydp8c3c748Apple-converted-space">=
&nbsp; </span>-Wno-unused-command-line-argument" "LDFLAGS=3D-Wl,--exclude-l=
ibs,libgcc.a -Wl,--exclude-libs,libatomic.a -nostdlib++ --sysroot /Users/be=
n/Library/Android/sdk/ndk-bundle/platforms/android-21/arch-x86_64 -Wl,--bui=
ld-id -Wl,--warn-shared-textrel -Wl,--fatal-warnings -L/Users/ben/Library/A=
ndroid/sdk/ndk-bundle/sources/cxx-stl/llvm-libc++/libs/x86_64 -Wl,--no-unde=
fined -Wl,-z,noexecstack -Qunused-arguments -Wl,-z,relro -Wl,-z,now<span cl=
ass=3D"ydp8c3c748Apple-converted-space">&nbsp; </span>-fuse-ld=3Dgold" DEST=
DIR=3D/Users/ben/Documents/GitHub/wireguard-android/app/build/intermediates=
/cmake/release/obj/x86_64</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>Using system Go</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>find . -name '*.go' -type l -dele=
te</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>find . -type d -empty -delete</sp=
an></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>mkdir -p ./src/git.zx2c4.com/wire=
guard-go/ratelimiter/ ./src/git.zx2c4.com/wireguard-go/ratelimiter/ ./src/g=
it.zx2c4.com/wireguard-go/replay/ ./src/git.zx2c4.com/wireguard-go/replay/ =
./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go=
/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.zx2c4.com/w=
ireguard-go/rwcancel/ ./src/git.zx2c4.com/wireguard-go/rwcancel/ ./src/git.=
zx2c4.com/wireguard-go/tai64n/ ./src/git.zx2c4.com/wireguard-go/tai64n/ ./s=
rc/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ ./=
src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/tun/ .=
/src/git.zx2c4.com/wireguard-go/tun/ ./src/git.zx2c4.com/wireguard-go/xchac=
ha20poly1305/ ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ./src/git=
.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.=
com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wir=
eguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-=
go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./s=
rc/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.=
zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.c=
om/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wire=
guard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-g=
o/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./sr=
c/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.z=
x2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.co=
m/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireg=
uard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go=
/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src=
/git.zx2c4.com/wireguard-go/ ./src/git.zx2c4.com/wireguard-go/ ./src/git.zx=
2c4.com/wireguard-go/</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/ratelimiter/ ../wireguard-go/ratelimiter/ratelimiter.go; ln -sfrt =
./src/git.zx2c4.com/wireguard-go/ratelimiter/ ../wireguard-go/ratelimiter/r=
atelimiter_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/replay/ ../wi=
reguard-go/replay/replay.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/repl=
ay/ ../wireguard-go/replay/replay_test.go; ln -sfrt ./src/git.zx2c4.com/wir=
eguard-go/rwcancel/ ../wireguard-go/rwcancel/fdset_default.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go/rwcancel/fdset_free=
bsd.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ ../wireguard-go=
/rwcancel/rwcancel.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/rwcancel/ =
../wireguard-go/rwcancel/select_default.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/rwcancel/ ../wireguard-go/rwcancel/select_linux.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/tai64n/ ../wireguard-go/tai64n/tai64n.go; ln =
-sfrt ./src/git.zx2c4.com/wireguard-go/tai64n/ ../wireguard-go/tai64n/tai64=
n_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../wireguard-go/t=
un/tun.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../wireguard-go/t=
un/tun_darwin.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ../wiregua=
rd-go/tun/tun_freebsd.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/tun/ ..=
/wireguard-go/tun/tun_linux.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/t=
un/ ../wireguard-go/tun/tun_openbsd.go; ln -sfrt ./src/git.zx2c4.com/wiregu=
ard-go/xchacha20poly1305/ ../wireguard-go/xchacha20poly1305/xchacha20.go; l=
n -sfrt ./src/git.zx2c4.com/wireguard-go/xchacha20poly1305/ ../wireguard-go=
/xchacha20poly1305/xchacha20_test.go; ln -sfrt ./src/git.zx2c4.com/wireguar=
d-go/ ../wireguard-go/allowedips.go; ln -sfrt ./src/git.zx2c4.com/wireguard=
-go/ ../wireguard-go/allowedips_rand_test.go; ln -sfrt ./src/git.zx2c4.com/=
wireguard-go/ ../wireguard-go/allowedips_test.go; ln -sfrt ./src/git.zx2c4.=
com/wireguard-go/ ../wireguard-go/bind_test.go; ln -sfrt ./src/git.zx2c4.co=
m/wireguard-go/ ../wireguard-go/conn.go; ln -sfrt ./src/git.zx2c4.com/wireg=
uard-go/ ../wireguard-go/conn_default.go; ln -sfrt ./src/git.zx2c4.com/wire=
guard-go/ ../wireguard-go/conn_linux.go; ln -sfrt ./src/git.zx2c4.com/wireg=
uard-go/ ../wireguard-go/constants.go; ln -sfrt ./src/git.zx2c4.com/wiregua=
rd-go/ ../wireguard-go/cookie.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go=
/ ../wireguard-go/cookie_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go=
/ ../wireguard-go/device.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../=
wireguard-go/device_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../=
wireguard-go/donotuseon_linux.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go=
/ ../wireguard-go/endpoint_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-=
go/ ../wireguard-go/helper_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-=
go/ ../wireguard-go/indextable.go; ln -sfrt ./src/git.zx2c4.com/wireguard-g=
o/ ../wireguard-go/ip.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wir=
eguard-go/kdf_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wiregu=
ard-go/keypair.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-=
go/logger.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/mi=
sc.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/noise-hel=
pers.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/noise-p=
rotocol.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/nois=
e-types.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/nois=
e_test.go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/peer.=
go; ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/receive.go; =
ln -sfrt ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/send.go; ln -sfr=
t ./src/git.zx2c4.com/wireguard-go/ ../wireguard-go/timers.go; ln -sfrt ./s=
rc/git.zx2c4.com/wireguard-go/ ../wireguard-go/tun.go; ln -sfrt ./src/git.z=
x2c4.com/wireguard-go/ ../wireguard-go/uapi.go; ln -sfrt ./src/git.zx2c4.co=
m/wireguard-go/ ../wireguard-go/uapi_bsd.go; ln -sfrt ./src/git.zx2c4.com/w=
ireguard-go/ ../wireguard-go/uapi_linux.go; ln -sfrt ./src/git.zx2c4.com/wi=
reguard-go/ ../wireguard-go/version.go;</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ln: illegal option -- r</span></p=
>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>usage: ln [-Ffhinsv] source_file =
[target_file]</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>ln [-F=
fhinsv] source_file ... target_dir</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span>link s=
ource_file target_file</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>make: *** [/Users/ben/Documents/G=
itHub/wireguard-android/app/build/intermediates/cmake/release/obj/x86_64/li=
bwg-go.so] Error 1</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1"><span class=3D"ydp8c=
3c748Apple-converted-space">&nbsp; </span>ninja: build stopped: subcommand =
failed.</span></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">* Try:</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">Run with <b>--stackt=
race</b> option to get the stack trace. Run with <b>--info</b> or <b>--debu=
g</b> option to get more log output. Run with <b>--scan</b> to get full ins=
ights.</span></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">* Get more help at h=
ttps://help.gradle.org</span></p>
<p class=3D"ydp8c3c748p2"><span class=3D"ydp8c3c748s1"></span><br></p>
<p class=3D"ydp8c3c748p3"><span class=3D"ydp8c3c748s1"><b>BUILD FAILED</b><=
/span><span class=3D"ydp8c3c748s3"> in 12s</span></p>
<p class=3D"ydp8c3c748p1"><span class=3D"ydp8c3c748s1">21 actionable tasks:=
 1 executed, 20 up-to-date</span></p></span><br></div><div style=3D"font-fa=
mily:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"></div></=
div></body></html>
------=_Part_8410086_216130800.1528912045281--

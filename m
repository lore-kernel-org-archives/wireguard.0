Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
 [209.85.161.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f01c89d
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 08:46:26 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id s68so14342439ywg.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 00:49:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161116081527.GB14469@tuxmachine.polynome.dn42>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Wed, 16 Nov 2016 17:48:54 +0900
Message-ID: <CAKXLc7cHjdUZdFfKrq8ynfo24AoD6W8otj2fNqbfnKef5Bm2=w@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Nov 16, 2016 at 5:15 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> On Tue, Nov 15, 2016 at 05:01:14PM +0100, Dan L=C3=BCdtke wrote:
>> thanks for the various feedback, guys! Here is the next round:
>>
>> https://github.com/openwrt/packages/pull/3514
>
> This one is now merged, thanks for the work Dan!
>

Hmm, something is iffy... I updated my buildroot (./scripts/feeds
update -a) and got the new versions, but it fails to build...

Here is the relevant log (from `make -j1 V=3Ds`) :
...
make[3]: Leaving directory '/srv/OpenWRT/openwrt/package/libs/libmnl'
make[3]: Entering directory
'/srv/OpenWRT/openwrt/package/network/utils/resolveip'
rm -rf /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-a=
r71xx/tmp-resolveip
mkdir -p /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root=
-ar71xx/stamp
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/t=
mp-resolveip
install -d -m0755
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/t=
mp-resolveip/usr/bin
install -m0755 /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/=
resolveip/resolveip
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/t=
mp-resolveip/usr/bin/
SHELL=3D flock /srv/OpenWRT/openwrt/tmp/.root-copy.flock -c 'cp -fpR
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/t=
mp-resolveip/.
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/'
rm -rf /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-a=
r71xx/tmp-resolveip
touch /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar=
71xx/stamp/.resolveip_installed
if [ -f /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkgin=
fo/resolveip.default.install.clean
]; then rm -f /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15=
/pkginfo/resolveip.default.install
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo/resol=
veip.default.install.clean;
fi; echo "resolveip" >>
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo/resol=
veip.default.install
make[3]: Leaving directory
'/srv/OpenWRT/openwrt/package/network/utils/resolveip'
make[3]: Entering directory '/srv/OpenWRT/openwrt/feeds/packages/net/wiregu=
ard'
mkdir -p /srv/OpenWRT/openwrt/bin/ar71xx/packages
/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-exper=
imental-0.0.20161110/ipkg-ar71xx/wireguard-tools/CONTROL
/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo
install -d -m0755
/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-exper=
imental-0.0.20161110/ipkg-ar71xx/wireguard-tools/usr/bin/
install -m0755 /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/=
WireGuard-experimental-0.0.20161110/src/tools/wg
/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-exper=
imental-0.0.20161110/ipkg-ar71xx/wireguard-tools/usr/bin/
install -m0755 ./files/wireguard.sh
/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-exper=
imental-0.0.20161110/ipkg-ar71xx/wireguard-tools/lib/netifd/proto/
install: target
'/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-expe=
rimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/lib/netifd/proto/'
is not a directory: No such file or directory
Makefile:106: recipe for target
'/srv/OpenWRT/openwrt/bin/ar71xx/packages/packages/wireguard-tools_0.0.2016=
1110-2_ar71xx.ipk'
failed
make[3]: *** [/srv/OpenWRT/openwrt/bin/ar71xx/packages/packages/wireguard-t=
ools_0.0.20161110-2_ar71xx.ipk]
Error 1
make[3]: Leaving directory '/srv/OpenWRT/openwrt/feeds/packages/net/wiregua=
rd'
package/Makefile:196: recipe for target
'package/feeds/packages/wireguard/compile' failed
make[2]: *** [package/feeds/packages/wireguard/compile] Error 2
make[2]: Leaving directory '/srv/OpenWRT/openwrt'
package/Makefile:193: recipe for target
'/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/stamp/.packa=
ge_compile'
failed
make[1]: *** [/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15=
/stamp/.package_compile]
Error 2
make[1]: Leaving directory '/srv/OpenWRT/openwrt'
/srv/OpenWRT/openwrt/include/toplevel.mk:192: recipe for target 'world' fai=
led
make: *** [world] Error 2

$ ll /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-=
experimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/
total 8
4 drwxr-xr-x 2 kalin users 4096 Nov 16 17:26 CONTROL
4 drwxr-xr-x 3 kalin users 4096 Nov 16 17:26 usr

Hmm, "No such file or directory" ? Somewhere mkdir -p is needed?


It used to work 4 days ago, I successfully built/tested/still running:
kmod-wireguard 4.4.14+0.0.20161105-1
wireguard-tools 0.0.20161105-1

I'll try a clean recompile of everything now...

Kalin.

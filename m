Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da7eafc3
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 09:31:27 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Dan Luedtke <mail@danrl.com>
In-Reply-To: <CAKXLc7cHjdUZdFfKrq8ynfo24AoD6W8otj2fNqbfnKef5Bm2=w@mail.gmail.com>
Date: Wed, 16 Nov 2016 10:34:10 +0100
Message-Id: <FE60D347-65AB-49AC-8ECC-8B5DD199DA53@danrl.com>
References: <A124E9F5-B1CF-4904-A849-EEAAD788030C@danrl.com>
 <55998A34-BCEC-4693-ABC4-48AC108F7A64@danrl.com>
 <39B38656-DD06-43E8-BC20-BAF5BC622EBA@danrl.com>
 <20161116081527.GB14469@tuxmachine.polynome.dn42>
 <CAKXLc7cHjdUZdFfKrq8ynfo24AoD6W8otj2fNqbfnKef5Bm2=w@mail.gmail.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

Hmm, could it be missing a line like

$(INSTALL_DIR) $(1)/lib/netifd/proto/

In the Makefile? Not sure why we would need to create it, shouldn't it be th=
ere?

Kalin, could you try again with the installdir line?

> On 16 Nov 2016, at 09:48, Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:
>=20
> On Wed, Nov 16, 2016 at 5:15 PM, Baptiste Jonglez
> <baptiste@bitsofnetworks.org> wrote:
>> On Tue, Nov 15, 2016 at 05:01:14PM +0100, Dan L=C3=BCdtke wrote:
>>> thanks for the various feedback, guys! Here is the next round:
>>>=20
>>> https://github.com/openwrt/packages/pull/3514
>>=20
>> This one is now merged, thanks for the work Dan!
>>=20
>=20
> Hmm, something is iffy... I updated my buildroot (./scripts/feeds
> update -a) and got the new versions, but it fails to build...
>=20
> Here is the relevant log (from `make -j1 V=3Ds`) :
> ...
> make[3]: Leaving directory '/srv/OpenWRT/openwrt/package/libs/libmnl'
> make[3]: Entering directory
> '/srv/OpenWRT/openwrt/package/network/utils/resolveip'
> rm -rf /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-=
ar71xx/tmp-resolveip
> mkdir -p /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/roo=
t-ar71xx/stamp
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/=
tmp-resolveip
> install -d -m0755
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/=
tmp-resolveip/usr/bin
> install -m0755 /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15=
/resolveip/resolveip
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/=
tmp-resolveip/usr/bin/
> SHELL=3D flock /srv/OpenWRT/openwrt/tmp/.root-copy.flock -c 'cp -fpR
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/=
tmp-resolveip/.
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-ar71xx/=
'
> rm -rf /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-=
ar71xx/tmp-resolveip
> touch /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/root-a=
r71xx/stamp/.resolveip_installed
> if [ -f /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkgi=
nfo/resolveip.default.install.clean
> ]; then rm -f /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.1=
5/pkginfo/resolveip.default.install
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo/reso=
lveip.default.install.clean;
> fi; echo "resolveip" >>
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo/reso=
lveip.default.install
> make[3]: Leaving directory
> '/srv/OpenWRT/openwrt/package/network/utils/resolveip'
> make[3]: Entering directory '/srv/OpenWRT/openwrt/feeds/packages/net/wireg=
uard'
> mkdir -p /srv/OpenWRT/openwrt/bin/ar71xx/packages
> /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-expe=
rimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/CONTROL
> /srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/pkginfo
> install -d -m0755
> /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-expe=
rimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/usr/bin/
> install -m0755 /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15=
/WireGuard-experimental-0.0.20161110/src/tools/wg
> /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-expe=
rimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/usr/bin/
> install -m0755 ./files/wireguard.sh
> /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-expe=
rimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/lib/netifd/proto/
> install: target
> '/srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard-exp=
erimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/lib/netifd/proto/'
> is not a directory: No such file or directory
> Makefile:106: recipe for target
> '/srv/OpenWRT/openwrt/bin/ar71xx/packages/packages/wireguard-tools_0.0.201=
61110-2_ar71xx.ipk'
> failed
> make[3]: *** [/srv/OpenWRT/openwrt/bin/ar71xx/packages/packages/wireguard-=
tools_0.0.20161110-2_ar71xx.ipk]
> Error 1
> make[3]: Leaving directory '/srv/OpenWRT/openwrt/feeds/packages/net/wiregu=
ard'
> package/Makefile:196: recipe for target
> 'package/feeds/packages/wireguard/compile' failed
> make[2]: *** [package/feeds/packages/wireguard/compile] Error 2
> make[2]: Leaving directory '/srv/OpenWRT/openwrt'
> package/Makefile:193: recipe for target
> '/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.15/stamp/.pack=
age_compile'
> failed
> make[1]: *** [/srv/OpenWRT/openwrt/staging_dir/target-mips_34kc_musl-1.1.1=
5/stamp/.package_compile]
> Error 2
> make[1]: Leaving directory '/srv/OpenWRT/openwrt'
> /srv/OpenWRT/openwrt/include/toplevel.mk:192: recipe for target 'world' fa=
iled
> make: *** [world] Error 2
>=20
> $ ll /srv/OpenWRT/openwrt/build_dir/target-mips_34kc_musl-1.1.15/WireGuard=
-experimental-0.0.20161110/ipkg-ar71xx/wireguard-tools/
> total 8
> 4 drwxr-xr-x 2 kalin users 4096 Nov 16 17:26 CONTROL
> 4 drwxr-xr-x 3 kalin users 4096 Nov 16 17:26 usr
>=20
> Hmm, "No such file or directory" ? Somewhere mkdir -p is needed?
>=20
>=20
> It used to work 4 days ago, I successfully built/tested/still running:
> kmod-wireguard 4.4.14+0.0.20161105-1
> wireguard-tools 0.0.20161105-1
>=20
> I'll try a clean recompile of everything now...
>=20
> Kalin.

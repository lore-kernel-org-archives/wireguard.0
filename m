Return-Path: steven@honson.id.au
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14b51800
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Jul 2018 09:40:27 +0000 (UTC)
Received: from mail-pl0-x231.google.com (mail-pl0-x231.google.com
 [IPv6:2607:f8b0:400e:c01::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40f2be20
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Jul 2018 09:40:27 +0000 (UTC)
Received: by mail-pl0-x231.google.com with SMTP id f6-v6so1538470plo.1
 for <wireguard@lists.zx2c4.com>; Tue, 24 Jul 2018 02:49:36 -0700 (PDT)
Return-Path: <steven@honson.id.au>
From: Steven Honson <steven@honson.id.au>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Wireguard fails on recent updates for OpenWRT on Turris Omnia,
 but same versions work on other (Linksys) routers with same CPU
Date: Tue, 24 Jul 2018 19:49:30 +1000
References: <131640bf823f0fba0adf5985e2e8aa17@mail.gmail.com>
 <CAHmME9r0rTCydGrf9cB474j1GOavzsdf8rDwLUhmMiK9FsTYbQ@mail.gmail.com>
 <3980181ad4f2980831b273db734f7772@mail.gmail.com>
 <ac459db2-43e2-975e-decd-86a5066dde0d@gmail.com>
To: Aaron Jones <aaronmdjones@gmail.com>, mike@pmfarmwald.com,
 wireguard@lists.zx2c4.com
In-Reply-To: <ac459db2-43e2-975e-decd-86a5066dde0d@gmail.com>
Message-Id: <8F6E9B31-B1E3-4304-8DE0-2F5F5CFB9779@honson.id.au>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On 22 Jul 2018, at 11:02 pm, Aaron Jones <aaronmdjones@gmail.com> =
wrote:
>=20
> # cat /sys/module/wireguard/version

On LEDE 17.01.5 at least, `/sys/module/wireguard/version` doesn=E2=80=99t =
exist, I=E2=80=99m not sure if this is the same for the release =
candidates of OpenWrt 18.06.

Unfortunately `modinfo wireguard` doesn=E2=80=99t give any indication of =
the version either for me with LEDE 17.01.5:

# modinfo wireguard
module:		/lib/modules/4.4.140/wireguard.ko
alias:		net-pf-16-proto-16-family-wireguard
alias:		rtnl-link-wireguard
license:	GPL v2
depends:	udp_tunnel,ip6_udp_tunnel

If you have installed WireGuard from the LEDE/OpenWrt package =
repository, then `opkg info wireguard-tools` to check the tools, and =
`opkg info kmod-wireguard` to check the kernel module is one way to =
verify the version:

# opkg info wireguard-tools
Package: wireguard-tools
Version: 0.0.20180625-1
Depends: libc, libmnl, ip
Status: install ok installed
Section: net
...

# opkg info kmod-wireguard
Package: kmod-wireguard
Version: 4.4.140+0.0.20180519-1
Depends: kernel (=3D 4.4.140-1-78acdb0e5133ba67c91f7694e305d1e7), =
kmod-udptunnel6, kmod-udptunnel4
Status: install ok installed
...

Note that updates to the tools appear to be backported regularly to LEDE =
17.01, but the kernel module appears to be as of the version available =
at the time of the release (17.01.5 in my case), so it isn=E2=80=99t =
unusual for these versions to not match as is the case here with mine. =
I=E2=80=99m not sure if the next release of OpenWrt will do a similar =
thing. It=E2=80=99d be nice if the kernel module updates were backported =
too.

Cheers,
Steven=

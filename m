Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c88a47
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 13:21:47 +0000 (UTC)
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com
 [IPv6:2a00:1450:400c:c09::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efe5c63a
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 13:21:47 +0000 (UTC)
Received: by mail-wm0-x22b.google.com with SMTP id l1-v6so1095863wmb.2
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 06:22:00 -0700 (PDT)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host75-210-dynamic.49-79-r.retail.telecomitalia.it. [79.49.210.75])
 by smtp.googlemail.com with ESMTPSA id p35-v6sm75790wrb.12.2018.05.15.06.21.57
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 May 2018 06:21:57 -0700 (PDT)
To: wireguard@lists.zx2c4.com
References: <f5c5a4c8-e20b-d810-909a-12ed0129b0a9@solidadmin.com>
From: Germano Massullo <germano.massullo@gmail.com>
Subject: Re: Fedora/CentOS error: wireguard-dkms-1:0.0.20180420-1.fc28.noarch:
 erase failed
Message-ID: <1d73fc93-add5-eeff-b1c9-6cd7dbd6f9ab@gmail.com>
Date: Tue, 15 May 2018 15:21:56 +0200
MIME-Version: 1.0
In-Reply-To: <f5c5a4c8-e20b-d810-909a-12ed0129b0a9@solidadmin.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I had the same problem, and I followed your guide till

> # rpm -e wireguard-dkms-0.0.20180420-1.fc28.noarch

Then I wanted to use 0.0.20180513-1.fc28 snapshot, so I runned

# dkms autoinstall

but I got errors

Error! Could not locate dkms.conf file.
File: /var/lib/dkms/wireguard/0.0.20180218/source/dkms.conf does not exis=
t.

Concerning installed files:
# dnf list installed | grep wireguard
wireguard-dkms.noarch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1:0.0.20180513-1.fc28=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
@jdoss-wireguard
wireguard-tools.x86_64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1:0.0.20180513-1.fc28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
@jdoss-wireguard



# updatedb
# locate wireguard
/etc/wireguard
/etc/wireguard/privatekey
/etc/wireguard/publickey
/etc/wireguard/wg0.conf
/etc/yum.repos.d/_copr_jdoss-wireguard.repo
/usr/lib/modules/4.15.10-300.fc27.x86_64/extra/wireguard.ko.xz
/usr/lib/modules/4.16.7-300.fc28.x86_64/extra/wireguard.ko.xz
/usr/share/doc/wireguard-tools
/usr/share/doc/wireguard-tools/README.md
/usr/share/doc/wireguard-tools/examples
/usr/share/doc/wireguard-tools/examples/dns-hatchet
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library
/usr/share/doc/wireguard-tools/examples/extract-handshakes
/usr/share/doc/wireguard-tools/examples/extract-keys
/usr/share/doc/wireguard-tools/examples/json
/usr/share/doc/wireguard-tools/examples/keygen-html
/usr/share/doc/wireguard-tools/examples/nat-hole-punching
/usr/share/doc/wireguard-tools/examples/ncat-client-server
/usr/share/doc/wireguard-tools/examples/reresolve-dns
/usr/share/doc/wireguard-tools/examples/sticky-sockets
/usr/share/doc/wireguard-tools/examples/synergy
/usr/share/doc/wireguard-tools/examples/dns-hatchet/README
/usr/share/doc/wireguard-tools/examples/dns-hatchet/apply.sh
/usr/share/doc/wireguard-tools/examples/dns-hatchet/hatchet.bash
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/.gitignore
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/Makefile
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/README
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/test.c
/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/wireguard.c=

/usr/share/doc/wireguard-tools/examples/embeddable-wg-library/wireguard.h=

/usr/share/doc/wireguard-tools/examples/extract-handshakes/.gitignore
/usr/share/doc/wireguard-tools/examples/extract-handshakes/Makefile
/usr/share/doc/wireguard-tools/examples/extract-handshakes/README
/usr/share/doc/wireguard-tools/examples/extract-handshakes/extract-handsh=
akes.sh
/usr/share/doc/wireguard-tools/examples/extract-handshakes/offset-finder.=
c
/usr/share/doc/wireguard-tools/examples/extract-keys/.gitignore
/usr/share/doc/wireguard-tools/examples/extract-keys/Makefile
/usr/share/doc/wireguard-tools/examples/extract-keys/README
/usr/share/doc/wireguard-tools/examples/extract-keys/config.c
/usr/share/doc/wireguard-tools/examples/extract-keys/extract-keys.c
/usr/share/doc/wireguard-tools/examples/json/README
/usr/share/doc/wireguard-tools/examples/json/wg-json
/usr/share/doc/wireguard-tools/examples/keygen-html/.gitignore
/usr/share/doc/wireguard-tools/examples/keygen-html/Makefile
/usr/share/doc/wireguard-tools/examples/keygen-html/README
/usr/share/doc/wireguard-tools/examples/keygen-html/keygen.html
/usr/share/doc/wireguard-tools/examples/keygen-html/src
/usr/share/doc/wireguard-tools/examples/keygen-html/src/curve25519_genera=
te.c
/usr/share/doc/wireguard-tools/examples/keygen-html/src/glue.js
/usr/share/doc/wireguard-tools/examples/nat-hole-punching/README
/usr/share/doc/wireguard-tools/examples/nat-hole-punching/nat-punch-clien=
t.c
/usr/share/doc/wireguard-tools/examples/nat-hole-punching/nat-punch-serve=
r.c
/usr/share/doc/wireguard-tools/examples/ncat-client-server/README
/usr/share/doc/wireguard-tools/examples/ncat-client-server/client.sh
/usr/share/doc/wireguard-tools/examples/ncat-client-server/server.sh
/usr/share/doc/wireguard-tools/examples/reresolve-dns/README
/usr/share/doc/wireguard-tools/examples/reresolve-dns/reresolve-dns.sh
/usr/share/doc/wireguard-tools/examples/sticky-sockets/README
/usr/share/doc/wireguard-tools/examples/sticky-sockets/sticky-sockets.c
/usr/share/doc/wireguard-tools/examples/synergy/README
/usr/share/doc/wireguard-tools/examples/synergy/synergy-client.sh
/usr/share/doc/wireguard-tools/examples/synergy/synergy-server.sh
/usr/share/licenses/wireguard-tools
/usr/share/licenses/wireguard-tools/COPYING
/usr/src/wireguard-0.0.20180513
/usr/src/debug/systemd-238-7.fc28.1.x86_64/src/network/netdev/wireguard.c=

/usr/src/debug/systemd-238-7.fc28.1.x86_64/src/network/netdev/wireguard.h=

/usr/src/debug/systemd-238-7.fc28.1.x86_64/src/shared/wireguard-netlink.h=

/usr/src/wireguard-0.0.20180513/Kbuild
/usr/src/wireguard-0.0.20180513/Kconfig
/usr/src/wireguard-0.0.20180513/Makefile
/usr/src/wireguard-0.0.20180513/allowedips.c
/usr/src/wireguard-0.0.20180513/allowedips.h
/usr/src/wireguard-0.0.20180513/compat
/usr/src/wireguard-0.0.20180513/cookie.c
/usr/src/wireguard-0.0.20180513/cookie.h
/usr/src/wireguard-0.0.20180513/crypto
/usr/src/wireguard-0.0.20180513/device.c
/usr/src/wireguard-0.0.20180513/device.h
/usr/src/wireguard-0.0.20180513/dkms.conf
/usr/src/wireguard-0.0.20180513/hashtables.c
/usr/src/wireguard-0.0.20180513/hashtables.h
/usr/src/wireguard-0.0.20180513/main.c
/usr/src/wireguard-0.0.20180513/messages.h
/usr/src/wireguard-0.0.20180513/netlink.c
/usr/src/wireguard-0.0.20180513/netlink.h
/usr/src/wireguard-0.0.20180513/noise.c
/usr/src/wireguard-0.0.20180513/noise.h
/usr/src/wireguard-0.0.20180513/peer.c
/usr/src/wireguard-0.0.20180513/peer.h
/usr/src/wireguard-0.0.20180513/queueing.c
/usr/src/wireguard-0.0.20180513/queueing.h
/usr/src/wireguard-0.0.20180513/ratelimiter.c
/usr/src/wireguard-0.0.20180513/ratelimiter.h
/usr/src/wireguard-0.0.20180513/receive.c
/usr/src/wireguard-0.0.20180513/selftest
/usr/src/wireguard-0.0.20180513/send.c
/usr/src/wireguard-0.0.20180513/socket.c
/usr/src/wireguard-0.0.20180513/socket.h
/usr/src/wireguard-0.0.20180513/timers.c
/usr/src/wireguard-0.0.20180513/timers.h
/usr/src/wireguard-0.0.20180513/uapi
/usr/src/wireguard-0.0.20180513/version.h
/usr/src/wireguard-0.0.20180513/compat/Kbuild.include
/usr/src/wireguard-0.0.20180513/compat/checksum
/usr/src/wireguard-0.0.20180513/compat/compat-asm.h
/usr/src/wireguard-0.0.20180513/compat/compat.h
/usr/src/wireguard-0.0.20180513/compat/dst_cache
/usr/src/wireguard-0.0.20180513/compat/fpu
/usr/src/wireguard-0.0.20180513/compat/intel-family
/usr/src/wireguard-0.0.20180513/compat/memneq
/usr/src/wireguard-0.0.20180513/compat/ptr_ring
/usr/src/wireguard-0.0.20180513/compat/simd
/usr/src/wireguard-0.0.20180513/compat/siphash
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel
/usr/src/wireguard-0.0.20180513/compat/checksum/checksum_partial_compat.h=

/usr/src/wireguard-0.0.20180513/compat/dst_cache/dst_cache.c
/usr/src/wireguard-0.0.20180513/compat/dst_cache/include
/usr/src/wireguard-0.0.20180513/compat/dst_cache/include/net
/usr/src/wireguard-0.0.20180513/compat/dst_cache/include/net/dst_cache.h
/usr/src/wireguard-0.0.20180513/compat/fpu/include
/usr/src/wireguard-0.0.20180513/compat/fpu/include/asm
/usr/src/wireguard-0.0.20180513/compat/fpu/include/asm/fpu
/usr/src/wireguard-0.0.20180513/compat/fpu/include/asm/fpu/api.h
/usr/src/wireguard-0.0.20180513/compat/intel-family/include
/usr/src/wireguard-0.0.20180513/compat/intel-family/include/asm
/usr/src/wireguard-0.0.20180513/compat/intel-family/include/asm/intel-fam=
ily.h
/usr/src/wireguard-0.0.20180513/compat/memneq/include.h
/usr/src/wireguard-0.0.20180513/compat/memneq/memneq.c
/usr/src/wireguard-0.0.20180513/compat/ptr_ring/include
/usr/src/wireguard-0.0.20180513/compat/ptr_ring/include/linux
/usr/src/wireguard-0.0.20180513/compat/ptr_ring/include/linux/ptr_ring.h
/usr/src/wireguard-0.0.20180513/compat/simd/include
/usr/src/wireguard-0.0.20180513/compat/simd/include/asm
/usr/src/wireguard-0.0.20180513/compat/simd/include/asm/simd.h
/usr/src/wireguard-0.0.20180513/compat/siphash/include
/usr/src/wireguard-0.0.20180513/compat/siphash/siphash.c
/usr/src/wireguard-0.0.20180513/compat/siphash/include/linux
/usr/src/wireguard-0.0.20180513/compat/siphash/include/linux/siphash.h
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel/include
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel/udp_tunnel.c
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel/udp_tunnel_partial_comp=
at.h
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel/include/net
/usr/src/wireguard-0.0.20180513/compat/udp_tunnel/include/net/udp_tunnel.=
h
/usr/src/wireguard-0.0.20180513/crypto/blake2s-x86_64.S
/usr/src/wireguard-0.0.20180513/crypto/blake2s.c
/usr/src/wireguard-0.0.20180513/crypto/blake2s.h
/usr/src/wireguard-0.0.20180513/crypto/chacha20-arm.S
/usr/src/wireguard-0.0.20180513/crypto/chacha20-arm64.S
/usr/src/wireguard-0.0.20180513/crypto/chacha20-x86_64.S
/usr/src/wireguard-0.0.20180513/crypto/chacha20poly1305.c
/usr/src/wireguard-0.0.20180513/crypto/chacha20poly1305.h
/usr/src/wireguard-0.0.20180513/crypto/curve25519-arm.S
/usr/src/wireguard-0.0.20180513/crypto/curve25519-arm.h
/usr/src/wireguard-0.0.20180513/crypto/curve25519-fiat32.h
/usr/src/wireguard-0.0.20180513/crypto/curve25519-hacl64.h
/usr/src/wireguard-0.0.20180513/crypto/curve25519-x86_64.h
/usr/src/wireguard-0.0.20180513/crypto/curve25519.c
/usr/src/wireguard-0.0.20180513/crypto/curve25519.h
/usr/src/wireguard-0.0.20180513/crypto/poly1305-arm.S
/usr/src/wireguard-0.0.20180513/crypto/poly1305-arm64.S
/usr/src/wireguard-0.0.20180513/crypto/poly1305-mips64.S
/usr/src/wireguard-0.0.20180513/crypto/poly1305-x86_64.S
/usr/src/wireguard-0.0.20180513/selftest/allowedips.h
/usr/src/wireguard-0.0.20180513/selftest/blake2s.h
/usr/src/wireguard-0.0.20180513/selftest/chacha20poly1305.h
/usr/src/wireguard-0.0.20180513/selftest/counter.h
/usr/src/wireguard-0.0.20180513/selftest/curve25519.h
/usr/src/wireguard-0.0.20180513/selftest/poly1305.h
/usr/src/wireguard-0.0.20180513/selftest/ratelimiter.h
/usr/src/wireguard-0.0.20180513/uapi/wireguard.h
/var/cache/PackageKit/28/hawkey/jdoss-wireguard-filenames.solvx
/var/cache/PackageKit/28/hawkey/jdoss-wireguard.solv
/var/cache/PackageKit/28/metadata/jdoss-wireguard
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir
/var/cache/PackageKit/28/metadata/jdoss-wireguard/pubkey.gpg
/var/cache/PackageKit/28/metadata/jdoss-wireguard/repodata
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/S.gpg-agent
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/S.gpg-agent.brow=
ser
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/S.gpg-agent.extr=
a
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/S.gpg-agent.ssh
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/private-keys-v1.=
d
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/pubring.kbx
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/pubring.kbx~
/var/cache/PackageKit/28/metadata/jdoss-wireguard/gpgdir/trustdb.gpg
/var/cache/PackageKit/28/metadata/jdoss-wireguard/repodata/*removed by
me*-primary.xml.gz
/var/cache/PackageKit/28/metadata/jdoss-wireguard/repodata/*removed by
me*-filelists.xml.gz
/var/cache/PackageKit/28/metadata/jdoss-wireguard/repodata/repomd.xml
/var/cache/app-info/xmls/jdoss-wireguard.xml.gz
/var/cache/dnf/jdoss-wireguard-*removed by me*
/var/cache/dnf/jdoss-wireguard-*removed by me*
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c
/var/cache/dnf/jdoss-wireguard-filenames.solvx
/var/cache/dnf/jdoss-wireguard.solv
/var/cache/dnf/jdoss-wireguard-*removed by me*/packages
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/*removed by
me*.xml.gz
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/*removed by
me*-primary.xml.gz
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/repomd.xml
/var/cache/dnf/jdoss-wireguard-*removed by me*/packages
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/*removed by
me*-filelists.xml.gz
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/*removed by
me*-primary.xml.gz
/var/cache/dnf/jdoss-wireguard-*removed by me*/repodata/repomd.xml
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c/packages
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c/repodata
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c/repodata/*removed by
me*-primary.xml.gz
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c/repodata/*removed by
me*-filelists.xml.gz
/var/cache/dnf/jdoss-wireguard-cb5fe4f76c2e705c/repodata/repomd.xml
/var/lib/dkms/wireguard
/var/lib/dkms/wireguard/0.0.20180218
/var/lib/dkms/wireguard/0.0.20180513
/var/lib/dkms/wireguard/kernel-4.15.10-300.fc27.x86_64-x86_64
/var/lib/dkms/wireguard/kernel-4.16.7-300.fc28.x86_64-x86_64
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64
/var/lib/dkms/wireguard/0.0.20180218/source
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64/x86_64
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64/x86_64/log
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64/x86_64/modul=
e
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64/x86_64/log/m=
ake.log
/var/lib/dkms/wireguard/0.0.20180218/4.15.10-300.fc27.x86_64/x86_64/modul=
e/wireguard.ko.xz
/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64
/var/lib/dkms/wireguard/0.0.20180513/source
/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64/x86_64
/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64/x86_64/log
/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64/x86_64/module=

/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64/x86_64/log/ma=
ke.log
/var/lib/dkms/wireguard/0.0.20180513/4.16.7-300.fc28.x86_64/x86_64/module=
/wireguard.ko.xz


> This issue seems to be a pretty rare edge case, and the fix is easy. I
> will try and improve the RPM so this can't happen in the future. Any
> ideas from the list on how to prevent this edge case are welcome.

You should ask for suggestions in Fedora devel mailing list

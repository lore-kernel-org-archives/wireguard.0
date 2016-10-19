Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0b3195e
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2016 13:03:05 +0000 (UTC)
Sender: toke@toke.dk
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Date: Wed, 19 Oct 2016 15:03:48 +0200
Message-ID: <87mvi0jxsb.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm getting build errors when building WireGuard against a grsec-enabled
kernel (on Arch linux):

DKMS make.log for wireguard-0.0.20161014 for kernel 4.7.8.201610161720-1-gr=
sec (x86_64)
Wed 19 Oct 14:59:25 CEST 2016
make: Entering directory '/usr/lib/modules/4.7.8.201610161720-1-grsec/build'
  LD      /var/lib/dkms/wireguard/0.0.20161014/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/main.o
/var/lib/dkms/wireguard/0.0.20161014/build/main.o: warning: objtool: mod_ex=
it(): can't find starting instruction
  CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/device.o
/var/lib/dkms/wireguard/0.0.20161014/build/device.c:330:29: error: constifi=
ed variable =E2=80=98link_ops=E2=80=99 placed into writable section ".data.=
.read_mostly"
 static struct rtnl_link_ops link_ops __read_mostly =3D {
                             ^~~~~~~~
make[1]: *** [scripts/Makefile.build:290: /var/lib/dkms/wireguard/0.0.20161=
014/build/device.o] Error 1
make: *** [Makefile:1465: _module_/var/lib/dkms/wireguard/0.0.20161014/buil=
d] Error 2
make: Leaving directory '/usr/lib/modules/4.7.8.201610161720-1-grsec/build'


Any idea how to fix this?

-Toke

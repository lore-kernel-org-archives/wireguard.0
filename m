Return-Path: monsoon.cl@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46c15be6
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 14:31:11 +0000 (UTC)
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fcf4b6d
 for <wireguard@lists.zx2c4.com>; Tue, 7 Aug 2018 14:31:11 +0000 (UTC)
Received: by mail-qk0-x230.google.com with SMTP id c192-v6so11530755qkg.12
 for <wireguard@lists.zx2c4.com>; Tue, 07 Aug 2018 07:42:10 -0700 (PDT)
MIME-Version: 1.0
From: Lejia Chen <monsoon.cl@gmail.com>
Date: Tue, 7 Aug 2018 23:41:56 +0900
Message-ID: <CAPyEcbmfaLgZ0z=9CKgYapQEzohovw9RxkEX3MKRhhXUawD+FA@mail.gmail.com>
Subject: Fedora package: missing the make dependency
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000001682d10572d96658"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000001682d10572d96658
Content-Type: text/plain; charset="UTF-8"

Today I reinstalled my Fedora server (Fedora 28 x64), found the
make dependency is missed in current Fedora WireGuard packages resulting in
failing to use Wireguard.

```
[xx@xxx ~]$ sudo dnf install wireguard-dkms wireguard-tools
  Installing       : wireguard-dkms-1:0.0.20180802-1.fc28.noarch
      13/14
  Running scriptlet: wireguard-dkms-1:0.0.20180802-1.fc28.noarch
      13/14
warning: %post(wireguard-dkms-1:0.0.20180802-1.fc28.noarch) scriptlet
failed, exit status 10
Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms
Non-fatal POSTIN scriptlet failure in rpm package wireguard-dkms
  Installing       : wireguard-tools-1:0.0.20180802-1.fc28.x86_64
       14/14
  Running scriptlet: wireguard-tools-1:0.0.20180802-1.fc28.x86_64
       14/14
...

[xx@xxx ~]$ sudo ip link add dev wg0 type wireguard
RTNETLINK answers: Operation not supported

[xx@xxx ~]$ sudo dkms build -m wireguard -v 0.0.20180802

Kernel preparation unnecessary for this kernel.  Skipping...

Building module:
cleaning build area...(bad exit status: 127)
make -j1 KERNELRELEASE=4.17.11-200.fc28.x86_64 -C
/lib/modules/4.17.11-200.fc28.x86_64/build
M=/var/lib/dkms/wireguard/0.0.20180802/build...(bad exit status: 127)
Error! Bad return status for module build on kernel:
4.17.11-200.fc28.x86_64 (x86_64)
Consult /var/lib/dkms/wireguard/0.0.20180802/build/make.log for more
information.
[xx@xxx~]$ cat /var/lib/dkms/wireguard/0.0.20180802/build/make.log
DKMS make.log for wireguard-0.0.20180802 for kernel 4.17.11-200.fc28.x86_64
(x86_64)
Tue Aug  7 22:07:45 JST 2018
/usr/sbin/dkms: line 74: make: command not found
```

After I install the make dependency by hand and reinstall WireGuard
packages, anything works fine.
Should the Fedora WireGuard packages add the make dependency? (I have no
experience in maintaining package.)
If no needed, feel free to ignore this email.

Thanks.

--0000000000001682d10572d96658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Today I reinstalled my Fedora server (Fedora 28 x64), foun=
d the make=C2=A0dependency is missed in current Fedora WireGuard=C2=A0packa=
ges resulting in failing to use Wireguard.<div><br></div><div>```</div><div=
>[xx@xxx ~]$ sudo dnf install wireguard-dkms wireguard-tools<br></div><div>=
<div>=C2=A0 Installing=C2=A0 =C2=A0 =C2=A0 =C2=A0: wireguard-dkms-1:0.0.201=
80802-1.fc28.noarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 13/14=C2=A0</div><div>=C2=A0 Running scriptlet: wireguard-dkms-1:0.0=
.20180802-1.fc28.noarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 13/14=C2=A0</div><div>warning: %post(wireguard-dkms-1:0.0.201808=
02-1.fc28.noarch) scriptlet failed, exit status 10</div><div>Non-fatal POST=
IN scriptlet failure in rpm package wireguard-dkms</div><div>Non-fatal POST=
IN scriptlet failure in rpm package wireguard-dkms</div><div>=C2=A0 Install=
ing=C2=A0 =C2=A0 =C2=A0 =C2=A0: wireguard-tools-1:0.0.20180802-1.fc28.x86_6=
4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014/14=C2=A0<=
/div><div>=C2=A0 Running scriptlet: wireguard-tools-1:0.0.20180802-1.fc28.x=
86_64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014/14=C2=
=A0</div></div><div>...</div><div><br></div><div><div>[xx@xxx ~]$ sudo ip l=
ink add dev wg0 type wireguard</div><div>RTNETLINK answers: Operation not s=
upported</div></div><div><br></div><div><div>[xx@xxx ~]$ sudo dkms build -m=
 wireguard -v 0.0.20180802</div><div><br></div><div>Kernel preparation unne=
cessary for this kernel.=C2=A0 Skipping...</div><div><br></div><div>Buildin=
g module:</div><div>cleaning build area...(bad exit status: 127)</div><div>=
make -j1 KERNELRELEASE=3D4.17.11-200.fc28.x86_64 -C /lib/modules/4.17.11-20=
0.fc28.x86_64/build M=3D/var/lib/dkms/wireguard/0.0.20180802/build...(bad e=
xit status: 127)</div><div>Error! Bad return status for module build on ker=
nel: 4.17.11-200.fc28.x86_64 (x86_64)</div><div>Consult /var/lib/dkms/wireg=
uard/0.0.20180802/build/make.log for more information.</div><div>[xx@xxx~]$=
 cat /var/lib/dkms/wireguard/0.0.20180802/build/make.log</div><div>DKMS mak=
e.log for wireguard-0.0.20180802 for kernel 4.17.11-200.fc28.x86_64 (x86_64=
)</div><div>Tue Aug=C2=A0 7 22:07:45 JST 2018</div><div>/usr/sbin/dkms: lin=
e 74: make: command not found</div></div><div>```</div><div><br></div><div>=
After I install the make=C2=A0dependency by hand and reinstall WireGuard pa=
ckages, anything works fine.</div><div>Should the Fedora WireGuard=C2=A0pac=
kages add the make dependency? (I have no experience in maintaining package=
.)</div><div>If no needed, feel free to ignore this email.</div><div><br></=
div><div>Thanks.</div></div>

--0000000000001682d10572d96658--

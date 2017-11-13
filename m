Return-Path: mrgranthaywood@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45c05637
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 02:34:34 +0000 (UTC)
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b96e5775
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 02:34:34 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id p74so1935476ywe.2
 for <wireguard@lists.zx2c4.com>; Sun, 12 Nov 2017 18:38:29 -0800 (PST)
MIME-Version: 1.0
From: Grant Haywood <mrgranthaywood@gmail.com>
Date: Mon, 13 Nov 2017 02:38:26 +0000
Message-ID: <CAPayrd584iu0B=0ojTPdkZNQzwfCfE3SUcqst3NAHjw6efWqJQ@mail.gmail.com>
Subject: only last configured peer has allowed-ips
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f4030438bd8049024f055dd42abe"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f4030438bd8049024f055dd42abe
Content-Type: text/plain; charset="UTF-8"

When I run the following on a wireguard instance
wireguard@lists.zx2c4.com
    wg set wg0 peer *SOMEPUB1* allowed-ips 0.0.0.0/0 persistent-keepalive 25
    wg set wg0 peer *SOMEPUB2* allowed-ips 0.0.0.0/0 persistent-keepalive 25

only the last key gets set with an allowed-ips directive

interface: wg0
  public key: *HOSTKEY*
  private key: (hidden)
  listening port: 51820

peer: *SOMEPUB2*
  endpoint: *SOMEIP*:38568
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 11 seconds ago
  transfer: 4.81 KiB received, 3.47 KiB sent
  persistent keepalive: every 25 seconds

peer: *SOMEPUB1*
  endpoint: *SOMEIP*:36411
  allowed ips: (none)         #<< This appears wrong
  latest handshake: 1 minute, 24 seconds ago
  transfer: 44.05 KiB received, 47.68 KiB sent
  persistent keepalive: every 25 seconds

I cannot pass traffic from SOMEPUB1, and no handshake occurs

if SOMEPUB1 occurs last in the sequence of running wg set commands, it
retains the allowed-ips configuration and it CAN pass traffic, so it seems
only the last command run for me is valid for allowed-ips

the host is running the following
ii  wireguard-dkms                      0.0.20171111-wg1~zesty
all          fast, modern, secure kernel VPN tunnel (DKMS version)
ii  wireguard-tools                     0.0.20171111-wg1~zesty
amd64        fast, modern, secure kernel VPN tunnel (userland utilities)

one of the peers is running the same, the other is a rasberry pi built from
source snapshot as described on wireguard.com (WireGuard-0.0.20171111)

Am I missing something or is there an issue with configuring 2 peers with
0.0.0.0/0 in this release?

Thanks in advance

--f4030438bd8049024f055dd42abe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When I run the following on a wireguard instance<br><table=
 cellpadding=3D"0" class=3D"gmail-ajC" style=3D"color:rgb(0,0,0);font-size:=
12.8px"><tbody><tr class=3D"gmail-ajv"><td colspan=3D"2" class=3D"gmail-gL"=
 style=3D"padding:6px 0px"><span class=3D"gmail-gI"><span><a href=3D"mailto=
:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></span><br></span>=
</td></tr><tr class=3D"gmail-ajv"></tr></tbody></table><div>=C2=A0 =C2=A0 w=
g set wg0 peer *SOMEPUB1* allowed-ips <a href=3D"http://0.0.0.0/0">0.0.0.0/=
0</a> persistent-keepalive 25</div><div>=C2=A0 =C2=A0 wg set wg0 peer *SOME=
PUB2* allowed-ips <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> persistent-kee=
palive 25</div><div><br></div><div>only the last key gets set with an allow=
ed-ips directive</div><div><br></div><div><div>interface: wg0</div><div>=C2=
=A0 public key: *HOSTKEY*</div><div>=C2=A0 private key: (hidden)</div><div>=
=C2=A0 listening port: 51820</div><div><br></div><div>peer: *SOMEPUB2*</div=
><div>=C2=A0 endpoint: *SOMEIP*:38568</div><div>=C2=A0 allowed ips: <a href=
=3D"http://0.0.0.0/0">0.0.0.0/0</a></div><div>=C2=A0 latest handshake: 1 mi=
nute, 11 seconds ago</div><div>=C2=A0 transfer: 4.81 KiB received, 3.47 KiB=
 sent</div><div>=C2=A0 persistent keepalive: every 25 seconds</div><div><br=
></div><div>peer: *SOMEPUB1*</div><div>=C2=A0 endpoint: *SOMEIP*:36411</div=
><div>=C2=A0 allowed ips: (none)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#&lt;&lt;=
 This appears wrong</div><div>=C2=A0 latest handshake: 1 minute, 24 seconds=
 ago</div><div>=C2=A0 transfer: 44.05 KiB received, 47.68 KiB sent</div><di=
v>=C2=A0 persistent keepalive: every 25 seconds</div></div><div><br></div><=
div>I cannot pass traffic from SOMEPUB1, and no handshake occurs</div><div>=
<br></div><div>if SOMEPUB1 occurs last in the sequence of running wg set co=
mmands, it retains the allowed-ips configuration and it CAN pass traffic, s=
o it seems only the last command run for me is valid for allowed-ips</div><=
div><br></div><div>the host is running the following=C2=A0<br><div>ii=C2=A0=
 wireguard-dkms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0.0.20171111-wg1~zesty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 all=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fast, modern, secure kernel VP=
N tunnel (DKMS version)</div><div>ii=C2=A0 wireguard-tools=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.0.20171111-wg1=
~zesty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 amd64=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fast, modern, secure kernel VPN tunnel (userland utilities)</div></d=
iv><div><br></div><div>one of the peers is running the same, the other is a=
 rasberry pi built from source snapshot as described on <a href=3D"http://w=
ireguard.com">wireguard.com</a> (WireGuard-0.0.20171111)</div><div><br></di=
v><div>Am I missing something or is there an issue with configuring 2 peers=
 with <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> in this release?</div><div=
><br></div><div>Thanks in advance</div><div><br></div><div><br></div></div>

--f4030438bd8049024f055dd42abe--

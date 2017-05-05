Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0e435a3
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 17:50:56 +0000 (UTC)
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
 [209.85.216.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 685c0f21
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 17:50:56 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id n4so11224606qte.2
 for <wireguard@lists.zx2c4.com>; Fri, 05 May 2017 11:00:52 -0700 (PDT)
MIME-Version: 1.0
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Fri, 5 May 2017 20:00:10 +0200
Message-ID: <CAGzienGKsqkmpGtn7tfunhzRQex9YdN87+tQKwdjzEXOSnmuJg@mail.gmail.com>
Subject: Ability to enable catch all allowed-ips on all peers
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a11377ff27b19ac054ecaabe3
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11377ff27b19ac054ecaabe3
Content-Type: text/plain; charset=UTF-8

Hello Jason.

I would like to enable allowed-ips 0.0.0.0/0 on all peers, cause I have a
scenario with multi-homed hosts where I would like to rely on firewall and
routes only instead of additional wireguard acls. Traffic is routed forth
and back via different interfaces thus I have to know which interface it's
gona come back and allow remote ips on few/all interfaces. Currently
wireguard applys catch all 0.0.0.0/0 allowed-ips only on one peer under wg
interface which is a no-go in such scenario.

This I think is also needed if one wants to build some dynamic routing on
top of wireguard connected nodes, isn't it?

Example wg output:

interface: wg2
  public key: <blank>
  private key: (hidden)
  preshared key: (hidden)
  listening port: 51821

peer: <blank>
  endpoint: <blank>
  allowed ips: (none)    <-------------------------------------------
  latest handshake: 34 seconds ago
  transfer: 1.16 KiB received, 736 B sent

peer: <blank>
  endpoint: <blank>
  allowed ips: (none)    <-------------------------------------------
  latest handshake: 34 seconds ago
  transfer: 888 B received, 552 B sent

peer: <blank>
  endpoint: <blank>
  allowed ips: (none)    <-------------------------------------------
  latest handshake: 34 seconds ago
  transfer: 1.16 KiB received, 736 B sent

peer: <blank>
  endpoint: <blank>
  allowed ips: 0.0.0.0/0    <----------------------------------------
  latest handshake: 1 day, 18 hours, 41 minutes, 34 seconds ago
  transfer: 4.30 KiB received, 3.12 KiB sent

Greets.
Damian

--001a11377ff27b19ac054ecaabe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jason.<div><br></div><div>I would like to enable all=
owed-ips <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> on all peers, cause I h=
ave a scenario with multi-homed hosts where I would like to rely on firewal=
l and routes only instead of additional wireguard acls. Traffic is routed f=
orth and back via different interfaces thus I have to know which interface =
it&#39;s gona come back and allow remote ips on few/all interfaces. Current=
ly wireguard applys catch all <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> al=
lowed-ips only on one peer under wg interface which is a no-go in such scen=
ario.</div><div><br></div><div>This I think is also needed if one wants to =
build some dynamic routing on top of wireguard connected nodes, isn&#39;t i=
t?</div><div><br></div><div>Example wg output:<br></div><div><br></div><div=
><div>interface: wg2</div><div>=C2=A0 public key: &lt;blank&gt;</div><div>=
=C2=A0 private key: (hidden)</div><div>=C2=A0 preshared key: (hidden)</div>=
<div>=C2=A0 listening port: 51821</div><div><br></div><div>peer: &lt;blank&=
gt;</div><div>=C2=A0 endpoint: &lt;blank&gt;</div><div>=C2=A0 allowed ips: =
(none) =C2=A0 =C2=A0&lt;-------------------------------------------</div><d=
iv>=C2=A0 latest handshake: 34 seconds ago</div><div>=C2=A0 transfer: 1.16 =
KiB received, 736 B sent</div><div><br></div><div>peer: &lt;blank&gt;</div>=
<div>=C2=A0 endpoint: &lt;blank&gt;</div><div>=C2=A0 allowed ips: (none) =
=C2=A0 =C2=A0&lt;-------------------------------------------</div><div>=C2=
=A0 latest handshake: 34 seconds ago</div><div>=C2=A0 transfer: 888 B recei=
ved, 552 B sent</div><div><br></div><div>peer: &lt;blank&gt;</div><div>=C2=
=A0 endpoint: &lt;blank&gt;</div><div>=C2=A0 allowed ips: (none) =C2=A0 =C2=
=A0&lt;-------------------------------------------</div><div>=C2=A0 latest =
handshake: 34 seconds ago</div><div>=C2=A0 transfer: 1.16 KiB received, 736=
 B sent</div><div><br></div><div>peer: &lt;blank&gt;</div><div>=C2=A0 endpo=
int: &lt;blank&gt;</div><div>=C2=A0 allowed ips: <a href=3D"http://0.0.0.0/=
0">0.0.0.0/0</a> =C2=A0 =C2=A0&lt;----------------------------------------<=
/div><div>=C2=A0 latest handshake: 1 day, 18 hours, 41 minutes, 34 seconds =
ago</div><div>=C2=A0 transfer: 4.30 KiB received, 3.12 KiB sent</div></div>=
<div><br></div><div>Greets.</div><div>Damian</div><div><br></div></div>

--001a11377ff27b19ac054ecaabe3--

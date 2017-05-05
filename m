Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdecb899
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 09:25:10 +0000 (UTC)
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
 [209.85.216.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 818d6dd3
 for <wireguard@lists.zx2c4.com>; Fri, 5 May 2017 09:25:09 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id m91so449728qte.3
 for <wireguard@lists.zx2c4.com>; Fri, 05 May 2017 02:35:03 -0700 (PDT)
MIME-Version: 1.0
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Fri, 5 May 2017 11:34:20 +0200
Message-ID: <CAGzienFjbbm-NY5c8EEY5sB+pGx7xbs8r5ac4+G8smfOp0Nzpg@mail.gmail.com>
Subject: Ability to bind wireguard to specific interface / ip address
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a11377ff2870152054ec39a09
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11377ff2870152054ec39a09
Content-Type: text/plain; charset=UTF-8

Hello Jason.

Currently wireguard binds by default to: 0.0.0.0:<ListenPort>

I want to bind to port 53. However I still want to run dnsmasq on LAN
interface. Currently it is not possible:

daemon.crit dnsmasq[1359]: failed to create listening socket for 10.7.7.1:
Address in use
daemon.crit dnsmasq[1359]: FAILED to start up

I want wireguard only on WAN interface / ip address.

This could be done by listening on some other port and mangling packets
with iptables, but this just does not go hand in hand with 'Simple &
Easy-to-use' wireguard policy ; ).

Could you consider implementing ability to select to which interface / ip
address bind to please?

Greets.
Damian

--001a11377ff2870152054ec39a09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jason.<div><br></div><div>Currently wireguard binds =
by default to: <a href=3D"http://0.0.0.0">0.0.0.0</a>:&lt;ListenPort&gt;</d=
iv><div><br></div><div>I want to bind to port 53. However I still want to r=
un dnsmasq on LAN interface. Currently it is not possible:</div><div><br></=
div><div><div>daemon.crit dnsmasq[1359]: failed to create listening socket =
for <a href=3D"http://10.7.7.1">10.7.7.1</a>: Address in use</div><div>daem=
on.crit dnsmasq[1359]: FAILED to start up</div></div><div><br></div><div>I =
want wireguard only on WAN interface / ip address.</div><div><br></div><div=
>This could be done by listening on some other port and mangling packets wi=
th iptables, but this just does not go hand in hand with &#39;Simple &amp; =
Easy-to-use&#39; wireguard policy ; ).<br></div><div><br></div><div><div>Co=
uld you consider implementing ability to select to which interface / ip add=
ress bind to please?</div></div><div><br></div><div>Greets.</div><div>Damia=
n</div></div>

--001a11377ff2870152054ec39a09--

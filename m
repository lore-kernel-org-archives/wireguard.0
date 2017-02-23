Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db412bc6
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 17:30:10 +0000 (UTC)
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
 [209.85.215.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44b7caa0
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 17:30:10 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id g134so19466895lfe.1
 for <wireguard@lists.zx2c4.com>; Thu, 23 Feb 2017 09:31:15 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Thu, 23 Feb 2017 18:31:14 +0100
Message-ID: <CADdae-jjwxrBSw0e5nJNGUQv6Bf=JuiRoKfj5qVS351ExaHtoA@mail.gmail.com>
Subject: [ wireguard-dev ] dmesg when using ipv6
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a11401db4e171cc054935faf1
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11401db4e171cc054935faf1
Content-Type: text/plain; charset=UTF-8

hello,
i've a lot of
Wireguard : could not create ipv4 socket  in dmesg

I 'm using wireguard with setting ipv6 peer private ip, and the connection
betweek peers is ipv4

interface: wg0
  public key: vhnquNl9iD3oJrJPVBbOUma7MohVcQ1zm5suUTm1QCk=
  private key: (hidden)
  listening port: 6081

peer: oyJfXtqaqO3sLVQXNOfqgpv0PN2O8TG8KKOADaEhskc=
  endpoint: 52.49.x.x:6081
  allowed ips: ::/0
  persistent keepalive: every 25 seconds


Regards,
Nicolas

--001a11401db4e171cc054935faf1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello,=C2=A0<div>i&#39;ve a lot of=C2=A0</div><div>Wiregua=
rd : could not create ipv4 socket =C2=A0in dmesg</div><div><br></div><div>I=
 &#39;m using wireguard with setting ipv6 peer private ip, and the connecti=
on betweek peers is ipv4</div><div><br></div><div>interface: wg0<br></div><=
div><div>=C2=A0 public key: vhnquNl9iD3oJrJPVBbOUma7MohVcQ1zm5suUTm1QCk=3D<=
/div><div>=C2=A0 private key: (hidden)</div><div>=C2=A0 listening port: 608=
1</div><div><br></div><div>peer: oyJfXtqaqO3sLVQXNOfqgpv0PN2O8TG8KKOADaEhsk=
c=3D</div><div>=C2=A0 endpoint: 52.49.x.x:6081</div><div>=C2=A0 allowed ips=
: ::/0</div><div>=C2=A0 persistent keepalive: every 25 seconds</div></div><=
div><br></div><div><br></div><div>Regards,=C2=A0</div><div>Nicolas</div></d=
iv>

--001a11401db4e171cc054935faf1--

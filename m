Return-Path: johnstonljordan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a90c2469
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 00:38:14 +0000 (UTC)
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63793212
 for <wireguard@lists.zx2c4.com>; Sun, 3 Dec 2017 00:38:14 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 64so8770533wme.3
 for <wireguard@lists.zx2c4.com>; Sat, 02 Dec 2017 16:44:41 -0800 (PST)
MIME-Version: 1.0
From: Jordan Johnston <johnstonljordan@gmail.com>
Date: Sat, 2 Dec 2017 19:44:39 -0500
Message-ID: <CAKgnZ5yLcH45+a2N1qNMKqEhC3kPcS5uS_k6FNDi-AN7iUoXVw@mail.gmail.com>
Subject: WireGuard (Android) wg-quick down not working, WireGuard app can't
 bring down WireGuard tunnel
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c491c2b09ed055f64e865"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c491c2b09ed055f64e865
Content-Type: text/plain; charset="UTF-8"

Hey list,

So after some help from the list, zx2c4 and on IRC

I've managed to get WireGuard working on my Google Pixel (Stock Rom). I've
been using it for a few hours now ~ after getting past a few initial
issues; I must say; WireGuard is fantastic!

Now, onto my current issue.

Currently, I have no problem enabling the wg tunnel on my device (using the
app or quick tile), however; I can't disable the tunnel once enabled (?)...

(using adb ... az = AzireVPN /data/misc/wireguard/az.conf ... the tunnel is
already running)

sailfish:/ # wg
interface: az
  public key: (hidden)
  private key: (hidden)
  listening port: 42507
  fwmark: 0x20000

peer: (hidden)
  endpoint: 149.248.160.60:51820
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 3 minutes, 50 seconds ago
  transfer: 7.52 MiB received, 1.17 MiB sent

sailfish:/ # wg-quick down az
wg-quick: `az' is not a WireGuard interface

(note: the above keys I've made hidden, on my ouput they are there, minus
private key)

It's peculiar because the above does show the az interface via wg command
...

Likewise, the WireGuard app also fails when trying to bring down the tunnel
with the error message "Error bringing down WireGuard tunnel"... Yet the
tunnel is brought up no problem, from within the app, quick tile or
commandline (?).

According to the The help I was given on IRC - my config file appears to be
correct. (and is mostly working). So I'm not really sure what the problem
might be... I had thought there may have been a permission or selinux
denial somewhere - but I'm not seeing that in logcat;

logcat only shows the above wg-quick message

Jordan

--f403045c491c2b09ed055f64e865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey list,</div><div><br></div><div>So after some help=
 from the list, zx2c4 and on IRC</div><div><br></div><div>I&#39;ve managed =
to get WireGuard working on my Google Pixel (Stock Rom). I&#39;ve been usin=
g it for a few hours now ~ after getting past a few initial issues; I must =
say; WireGuard is fantastic!</div><div><br></div><div>Now, onto my current =
issue.</div><div><br></div><div>Currently, I have no problem enabling the w=
g tunnel on my device (using the app or quick tile), however; I can&#39;t d=
isable the tunnel once enabled (?)...</div><div><br></div><div>(using adb .=
.. az =3D AzireVPN /data/misc/wireguard/az.conf ... the tunnel is already r=
unning)<br></div><div><br></div><div>sailfish:/ # wg<br>interface: az<br>=
=C2=A0 public key: (hidden)<br>=C2=A0 private key: (hidden)<br>=C2=A0 liste=
ning port: 42507<br>=C2=A0 fwmark: 0x20000<br><br>peer: (hidden)<br>=C2=A0 =
endpoint: <a href=3D"http://149.248.160.60:51820">149.248.160.60:51820</a><=
br>=C2=A0 allowed ips: <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a>, ::/0<br>=
=C2=A0 latest handshake: 3 minutes, 50 seconds ago<br>=C2=A0 transfer: 7.52=
 MiB received, 1.17 MiB sent</div><div></div><div><br></div><div>sailfish:/=
 # wg-quick down az<br>wg-quick: `az&#39; is not a WireGuard interface</div=
><div><br></div><div>(note: the above keys I&#39;ve made hidden, on my oupu=
t they are there, minus private key)<br></div><div><br></div><div>It&#39;s =
peculiar because the above does show the az interface via wg command ... <b=
r></div><div><br></div><div>Likewise, the WireGuard app also fails when try=
ing to bring down the tunnel with the error message &quot;Error bringing do=
wn WireGuard tunnel&quot;... Yet the tunnel is brought up no problem, from =
within the app, quick tile or commandline (?).</div><div><br></div><div>Acc=
ording to the The help I was given on IRC - my config file appears to be co=
rrect. (and is mostly working). So I&#39;m not really sure what the problem=
 might be... I had thought there may have been a permission or selinux deni=
al somewhere - but I&#39;m not seeing that in logcat;</div><div><br></div><=
div>logcat only shows the above wg-quick message <br></div><div><br></div><=
div>Jordan<br></div><div><br></div></div>

--f403045c491c2b09ed055f64e865--

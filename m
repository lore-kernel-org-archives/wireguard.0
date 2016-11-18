Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdfb5893
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Nov 2016 11:39:37 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id r204so161939406ywb.0
 for <wireguard@lists.zx2c4.com>; Fri, 18 Nov 2016 03:42:41 -0800 (PST)
MIME-Version: 1.0
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 18 Nov 2016 20:42:20 +0900
Message-ID: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114d6deeb7dfd5054191cdb0
Subject: [WireGuard] What is a good way to ingrate (as of now) wireguard
	into openrc in Gentoo?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114d6deeb7dfd5054191cdb0
Content-Type: text/plain; charset=UTF-8

Hello,

I have been testing a few things between Gentoo and few OpenWRT boxen, so
far so good. Just saw that Luci config landed, recompiling now.

This brings me to "What is a good way to ingrate (as of now) wireguard into
openrc in Gentoo?" question.

I have my scripts, I just found out about /lib64/netifrc/net/wireguard.sh
but I couldn't find a way to edit /etc/conf.d/net so that I can integrate
it.

Since Jason is a Gentoo user/dev I thought that is already solved :-D

An example static config for the simple case of

host_A:wg0<----->wg0:host_B

and

              /-->wg0:host_B
host_A:wg0<--||
              \-->wg0:host_C

(say where A,B,C share some private subnet) will be appreciated.

Any good "default" way to store config files? Private keys?

Cheers,
Kalin.

--001a114d6deeb7dfd5054191cdb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><span style=3D"font-family:monospace,monospace">=
Hello,<br><br>I have been testing a few things between Gentoo and few OpenW=
RT boxen, so far so good. Just saw that Luci config landed, recompiling now=
.<br><br>This brings me to &quot;What is a good way to ingrate (as of now) =
wireguard into openrc in Gentoo?&quot; question.<br><br>I have my scripts, =
I just found out about /lib64/netifrc/net/wireguard.sh but I couldn&#39;t f=
ind a way to edit /etc/conf.d/net so that I can integrate it.<br><br>Since =
Jason is a Gentoo user/dev I thought that is already solved :-D<br><br>An e=
xample static config for the simple case of<br><br>host_A:wg0&lt;-----&gt;w=
g0:host_B<br><br>and<br><br>=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 /--&gt;wg0:</span><span style=3D"font-family:monospace,monospace"><s=
pan style=3D"font-family:monospace,monospace">host_</span>B<br></span><span=
 style=3D"font-family:monospace,monospace"><span style=3D"font-family:monos=
pace,monospace">host_</span>A:wg0&lt;--||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=C2=A0 =C2=A0=C2=A0 \--&gt;wg0:</span><span style=3D"font-family:mono=
space,monospace"><span style=3D"font-family:monospace,monospace">host_</spa=
n>C<br><br>(say where A,B,C share some private subnet) will be appreciated.=
<br></span></div><span style=3D"font-family:monospace,monospace"><br></span=
></div><span style=3D"font-family:monospace,monospace">Any good &quot;defau=
lt&quot; way to store config files? Private keys?<br></span><div><div><span=
 style=3D"font-family:monospace,monospace"><br>Cheers,<br>Kalin.</span><br>=
</div></div></div>

--001a114d6deeb7dfd5054191cdb0--

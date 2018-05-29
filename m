Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24c7c3d4
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 14:09:54 +0000 (UTC)
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14d5204a
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 14:09:54 +0000 (UTC)
Received: by mail-qt0-x22d.google.com with SMTP id g13-v6so18765429qth.8
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 07:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACW8NbAnCtceEQLqgJ6vaCHexH3dH_uq82TTPuYKeb-C55NM-Q@mail.gmail.com>
 <03090631-bb0c-5b54-a9ff-9d79021afea5@mib-infotech.co.nz>
In-Reply-To: <03090631-bb0c-5b54-a9ff-9d79021afea5@mib-infotech.co.nz>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Tue, 29 May 2018 10:11:41 -0400
Message-ID: <CAM3m09TWfZH-Je_49m6j4cCXF+Qqihw_nbY52BLP6rPHsEbQdQ@mail.gmail.com>
Subject: Re: Recommended Mini-VM image?
To: john@mib-infotech.co.nz
Content-Type: multipart/alternative; boundary="000000000000e28ba3056d58d073"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000e28ba3056d58d073
Content-Type: text/plain; charset="UTF-8"

I use buildroot (buildroot.org) to build linux for my WG devices.  The x86
version ends up being ~20Mb in size and when bundling the userspace into
the init in the kernel, it runs completely from memory.

On Tue, May 29, 2018 at 1:36 AM John Huttley <john@mib-infotech.co.nz>
wrote:

> Hi team,
> I want to run WG in a VM under windows with Virtual box or such.
>
> I could use my Gentoo image, buts its 25Gb. Does anyone have an
> "appliance" image?
> Regards,
> -Dad
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000e28ba3056d58d073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I use buildroot (<a href=3D"http://buildroot.org">buildroo=
t.org</a>) to build linux for my WG devices.=C2=A0 The x86 version ends up =
being ~20Mb in size and when bundling the userspace into the init in the ke=
rnel, it runs completely from memory.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Tue, May 29, 2018 at 1:36 AM John Huttley &lt;<a href=3D=
"mailto:john@mib-infotech.co.nz">john@mib-infotech.co.nz</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Hi team,<br>
I want to run WG in a VM under windows with Virtual box or such.<br>
<br>
I could use my Gentoo image, buts its 25Gb. Does anyone have an <br>
&quot;appliance&quot; image?<br>
Regards,<br>
-Dad<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000e28ba3056d58d073--

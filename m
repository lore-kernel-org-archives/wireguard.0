Return-Path: steve@erayd.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a59882
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 22:08:31 +0000 (UTC)
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a0fe109
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 22:08:31 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id w12so673221ywa.8
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 14:16:03 -0800 (PST)
MIME-Version: 1.0
References: <28272814.1271279.1519071494156.JavaMail.zimbra@jave.fr>
In-Reply-To: <28272814.1271279.1519071494156.JavaMail.zimbra@jave.fr>
From: Steve Gilberd <steve@erayd.net>
Date: Mon, 19 Feb 2018 22:15:52 +0000
Message-ID: <CAJQSx3ahtq40bO=Fa4qJz=3_q0FU6cfOh1nuYg_s0KuVwSaoJA@mail.gmail.com>
Subject: Re: Alternative to UDP
To: Eric Dillmann <lists@jave.fr>
Content-Type: multipart/alternative; boundary="001a114dcf6a267d8e0565980ace"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114dcf6a267d8e0565980ace
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This feels like a bad idea to me - switching to a dedicated protocol would
remove a small amount of overhead, but comes with a lot of downsides, which
in my opinion outweighs the minor benefit of removing some of the overhead.

I have a strong preference for the continued use of UDP, because a large
amount of consumer networking gear can't handle destination NAT for
anything that isn't UDP or TCP. And even wth gear that can, using a
separate IP protocol would limit clients relying on destination NAT to one
client machine per public IP.

Cheers,
Steve

On Tue, 20 Feb 2018, 09:20 Eric Dillmann, <lists@jave.fr> wrote:

> Hi,
>
> Today i discovered that OVH is limiting UDP rate to 6Mbit/s, i did a test
> by encapsulating wireguard in an ip/ip tunnel
> and got 90Mbit/S.
>
> Is there a way to make wireguard evolve to use it's own protocol number.
>
> That would prevent the overhead of wireguard over ipip/gre/vxlan ...
>
> Thanks,
> Regards,
> Eric
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019 The Terrace, Wellington 6143, NZ*

--001a114dcf6a267d8e0565980ace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>This feels like a bad idea to me - switch=
ing to a dedicated protocol would remove a small amount of overhead, but co=
mes with a lot of downsides, which in my opinion outweighs the minor benefi=
t of removing some of the overhead.</div><div><br></div>I have a strong pre=
ference for the continued use of UDP, because a large amount of consumer ne=
tworking gear can&#39;t handle destination NAT for anything that isn&#39;t =
UDP or TCP. And even wth gear that can, using a separate IP protocol would =
limit clients relying on destination NAT to one client machine per public I=
P.<div><br></div><div>Cheers,</div><div>Steve<br><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Tue, 20 Feb 2018, 09:20 Eric Dillmann, &lt;<a href=
=3D"mailto:lists@jave.fr">lists@jave.fr</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi,<br>
<br>
Today i discovered that OVH is limiting UDP rate to 6Mbit/s, i did a test b=
y encapsulating wireguard in an ip/ip tunnel<br>
and got 90Mbit/S.<br>
<br>
Is there a way to make wireguard evolve to use it&#39;s own protocol number=
.<br>
<br>
That would prevent the overhead of wireguard over ipip/gre/vxlan ...<br>
<br>
Thanks,<br>
Regards,<br>
Eric<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Cheers,<=
/p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<font color=3D"#666666">Erayd LTD=C2=A0</font><b><font color=3D"#666666">=
=C2=B7</font></b><font color=3D"#666666">=C2=A0Consultant</font><br>
<i><font color=3D"#666666">Phone: +64 4 974-4229=C2=A0</font></i><b><i><fon=
t color=3D"#666666">=C2=B7</font></i></b><i><font color=3D"#666666">=C2=A0M=
ob: +64 27 565-3237</font></i><br>
<i><font color=3D"#666666">PO Box 10019 The Terrace, Wellington 6143, NZ</f=
ont></i></p>
</div></div>

--001a114dcf6a267d8e0565980ace--

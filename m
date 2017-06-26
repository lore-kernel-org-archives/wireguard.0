Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 862d789b
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:38:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15975818
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:38:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56f4f7a7
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:52:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3166b396
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 11:52:10 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id y47so65725159oty.0
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 04:54:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170626113011.Horde.LnrakzTxipAs-PhMdgApTF3@www.vdorst.com>
References: <20170626113011.Horde.LnrakzTxipAs-PhMdgApTF3@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Jun 2017 13:54:56 +0200
Message-ID: <CAHmME9rjmo-ow8yFS48fhK81NP7iJtLkF10MHgRpMumEJU1yrQ@mail.gmail.com>
Subject: Re: Hash fix commit by Sultan Alsawaf.
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: multipart/alternative; boundary="001a113d0a24c11a370552db9e0e"
Cc: Sultan XDA <sultanxda@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d0a24c11a370552db9e0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. It's totally bogus since the struct initializer already zeros these
bytes.

On Jun 26, 2017 13:36, "Ren=C3=A9 van Dorst" <opensource@vdorst.com> wrote:

> Jason,
>
> Did you notice this commit [1] from Sultan Alsawaf?
>
> [1] ratelimiter: fix hashing and hashmap searching for ipv4 addresses;
> https://git.zx2c4.com/WireGuard/commit/?h=3Dsa/20170623&id=3D8da
> 15aa96cdf918d8a98cf2caaefb475cadee355
>
> Greats,
>
> Ren=C3=A9 van Dorst.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--001a113d0a24c11a370552db9e0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div data-smartmail=3D"gmail_signature">Yes. It&#39;s tot=
ally bogus since the struct initializer already zeros these bytes.</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jun 26, 201=
7 13:36, &quot;Ren=C3=A9 van Dorst&quot; &lt;<a href=3D"mailto:opensource@v=
dorst.com">opensource@vdorst.com</a>&gt; wrote:<br type=3D"attribution"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Jason,<br>
<br>
Did you notice this commit [1] from Sultan Alsawaf?<br>
<br>
[1] ratelimiter: fix hashing and hashmap searching for ipv4 addresses; <a h=
ref=3D"https://git.zx2c4.com/WireGuard/commit/?h=3Dsa/20170623&amp;id=3D8da=
15aa96cdf918d8a98cf2caaefb475cadee355" rel=3D"noreferrer" target=3D"_blank"=
>https://git.zx2c4.com/WireGuar<wbr>d/commit/?h=3Dsa/20170623&amp;id=3D8da<=
wbr>15aa96cdf918d8a98cf2caaefb475c<wbr>adee355</a><br>
<br>
Greats,<br>
<br>
Ren=C3=A9 van Dorst.<br>
<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
</blockquote></div></div>

--001a113d0a24c11a370552db9e0e--

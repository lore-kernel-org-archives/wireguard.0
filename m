Return-Path: rost.bel@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75b0a7c3
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:44:07 +0000 (UTC)
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2040302
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:44:07 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id c80so52560307lfh.3
 for <wireguard@lists.zx2c4.com>; Sun, 30 Apr 2017 07:53:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qx9P4dwgkaiODQVdoh8X+c_Lyvp+QL95Gqntn+SPvTcA@mail.gmail.com>
References: <CAKJBWRfDRi9KGM_OJwgN2ZaQ9a56Gxshh=apnj5j9ish-WOOcg@mail.gmail.com>
 <CAHmME9obiOSUAxaOEFk64VDH=8KRGOrA957RZVdAjHYDGsm0AQ@mail.gmail.com>
 <CAKJBWRckpjWWKcUZDAtvFoG87hGG9wcKBbvY_JVeHXoptZUYaw@mail.gmail.com>
 <CAHmME9qx9P4dwgkaiODQVdoh8X+c_Lyvp+QL95Gqntn+SPvTcA@mail.gmail.com>
From: Rostislav Belotserkovski <rost.bel@gmail.com>
Date: Sun, 30 Apr 2017 17:53:03 +0300
Message-ID: <CAKJBWRei3fx6Sd9ooTL5-DJOsf8QPwZAZoeBkn1bspRcq-ENwA@mail.gmail.com>
Subject: Re: do a client behind NAT needs to define listening port?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=f403045fc0f8e55de7054e6377a3
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045fc0f8e55de7054e6377a3
Content-Type: text/plain; charset=UTF-8

I understand your example, but then another question is up - if we don't
specify PersistentKeepalive on one of the sides, after a while both client
and server become silent, and session effectively ends by routers udp
timeout (30 sec on mine), and if server needs to talk to a client which is
behind NAT w/o listening port forwarded, it will fail, right?

On Sun, 30 Apr 2017 at 15:35 Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> If you're the client, you're already connecting _up_ to a server,
> which means ordinary stateful NAT takes care of that.
>
> Comparison: do you manually specify a source port when making an
> outgoing HTTP connection?
>

--f403045fc0f8e55de7054e6377a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I understand your example, but then another question =
is up - if we don&#39;t specify=C2=A0PersistentKeepalive on one of the side=
s, after a while both client and server become silent, and session effectiv=
ely ends by routers udp timeout (30 sec on mine), and if server needs to ta=
lk to a client which is behind NAT w/o listening port forwarded, it will fa=
il, right?</div><div><br><div class=3D"gmail_quote"><div>On Sun, 30 Apr 201=
7 at 15:35 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=
=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">If you&#39;re the client, you&#39;re already con=
necting _up_ to a server,<br>
which means ordinary stateful NAT takes care of that.<br>
<br>
Comparison: do you manually specify a source port when making an<br>
outgoing HTTP connection?<br>
</blockquote></div></div></div>

--f403045fc0f8e55de7054e6377a3--

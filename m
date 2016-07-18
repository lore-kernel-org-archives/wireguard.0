Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78d9d123
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 22:00:01 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id c124so113324ywd.3
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jul 2016 15:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRLKH_CB2oKmYnyBX3ntyqyLHUCZh_m5Wk-bWdYd_tkm-FxGA@mail.gmail.com>
 <CAHmME9rR586Z-ijdgDLbJj3HCckTkP+NV=MeHVSemOW+AL9TkA@mail.gmail.com>
In-Reply-To: <CAHmME9rR586Z-ijdgDLbJj3HCckTkP+NV=MeHVSemOW+AL9TkA@mail.gmail.com>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Mon, 18 Jul 2016 22:01:27 +0000
Message-ID: <CAMRLKH9DrPEA1wM5uWQYAr+gkK=X_BWfzGd3-wWuLBm_7Xc7mA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114f221ab68df00537f01c49
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] 0.0.0.0/0 in AllowedIPs for multiple peer on the
	same interface.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114f221ab68df00537f01c49
Content-Type: text/plain; charset=UTF-8

I'm using bird to do the routing stuff, assuming wg0 is an ptmp tunnel, so
traffic were sent by 'via' directives.
On Mon, Jul 18, 2016 at 10:45 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> You cannot have 0/0 for multiple peers. Otherwise, how will WireGuard
> know where to send traffic?
>

--001a114f221ab68df00537f01c49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I&#39;m using bird to do the routing stuff, assuming wg0 is an ptmp tunnel,=
 so traffic were sent by &#39;via&#39; directives. <br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Mon, Jul 18, 2016 at 10:45 PM Jason A. Donenfeld=
 &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">You cannot have 0/0 for multiple peers.=
 Otherwise, how will WireGuard<br>
know where to send traffic?<br>
</blockquote></div>

--001a114f221ab68df00537f01c49--

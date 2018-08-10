Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79d8bdcc
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 16:27:10 +0000 (UTC)
Received: from mail-oi0-x233.google.com (mail-oi0-x233.google.com
 [IPv6:2607:f8b0:4003:c06::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8423f8ab
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 16:27:10 +0000 (UTC)
Received: by mail-oi0-x233.google.com with SMTP id d189-v6so16843029oib.6
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 09:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <20180810200346.0e9646ac@natsu>
 <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
In-Reply-To: <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 10 Aug 2018 19:38:19 +0300
Message-ID: <CAKXLc7faAQ1-a_U1DJQU1HWYmq3f=Xy4SZPHVNtG8ZUe4VYA4g@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Brian Candler <b.candler@pobox.com>
Content-Type: multipart/alternative; boundary="000000000000cd249a0573175ff9"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000cd249a0573175ff9
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Aug 2018, 19:04 Brian Candler, <b.candler@pobox.com> wrote:

> On 10/08/2018 16:03, Roman Mamedov wrote:
>
> But I'd feel a lot happier if a second level of authentication were
> required to establish a wireguard connection, if no packets had been
> flowing for more than a configurable amount of time - say, an hour. It
> would give some comfort around lost/stolen devices.
>
> Couldn't you just encrypt your home directory? Or even the root FS entirely.
> Either of those should be a must on a portable device storing valuable
> information.
>
> But by analogy, would you say that SSH keys and PGP keys don't need
> protection by a passphrase?
>
Yes, I will say so. I (almost) never use it, it is either too unsecure yet
cumbersome, so I use separate devices (nFA), encrypted FS, etc. where
needed. Or nothing at all.

Kalin.

--000000000000cd249a0573175ff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, =
10 Aug 2018, 19:04 Brian Candler, &lt;<a href=3D"mailto:b.candler@pobox.com=
">b.candler@pobox.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"m_5431681004389507295moz-cite-prefix">On 10/08/2018 16:03=
, Roman Mamedov
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <blockquote type=3D"cite" style=3D"color:#000000">
        <pre>But I&#39;d feel a lot happier if a second level of authentica=
tion were=20
required to establish a wireguard connection, if no packets had been=20
flowing for more than a configurable amount of time - say, an hour. It=20
would give some comfort around lost/stolen devices.
</pre>
      </blockquote>
      <pre>Couldn&#39;t you just encrypt your home directory? Or even the r=
oot FS entirely.
Either of those should be a must on a portable device storing valuable
information.</pre>
    </blockquote>
    <p>But by analogy, would you say that SSH keys and PGP keys don&#39;t
      need protection by a passphrase?</p></div></blockquote></div></div><d=
iv dir=3D"auto">Yes, I will say so. I (almost) never use it, it is either t=
oo unsecure yet cumbersome, so I use separate devices (nFA), encrypted FS, =
etc. where needed. Or nothing at all.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Kalin.</div><div dir=3D"auto"></div></div>

--000000000000cd249a0573175ff9--

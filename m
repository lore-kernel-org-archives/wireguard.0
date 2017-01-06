Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea4cc400
 for <wireguard@lists.zx2c4.com>; Fri, 6 Jan 2017 22:52:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b05ca57
 for <wireguard@lists.zx2c4.com>; Fri, 6 Jan 2017 22:52:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abd432a0
 for <wireguard@lists.zx2c4.com>; Fri, 6 Jan 2017 22:52:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5408e5dd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Jan 2017 22:52:09 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 3so449007202oih.1
 for <wireguard@lists.zx2c4.com>; Fri, 06 Jan 2017 15:01:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9FF22623-C2E8-4342-BEFC-C8B2C44FEF25@danrl.com>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
 <9FF22623-C2E8-4342-BEFC-C8B2C44FEF25@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 7 Jan 2017 00:01:23 +0100
Message-ID: <CAHmME9rsVAbJ=TzkyhFMz5TjP3rCc_CNW7t+s5jZQ9Go8EKEFw@mail.gmail.com>
Subject: Re: distro packaging, makefiles, deps, systemd, new tools
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: multipart/alternative; boundary=94eb2c034dda4607f9054574ff9c
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c034dda4607f9054574ff9c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Jan 6, 2017 23:44, "Dan L=C3=BCdtke" <mail@danrl.com> wrote:


> On 4 Jan 2017, at 19:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> OpenWRT should _not_ ship this.


Agreed.

Everything else looks good to me. Just had a brief look at it.

Let's see what buildbot says. Should all run smoothly!


I assume youre not shipping the bash completion stuff either, right? Since
openwrt doesn't use bash.

--94eb2c034dda4607f9054574ff9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div data-smartmail=3D"gmail_signature" dir=3D"auto"><br>=
</div><div class=3D"gmail_extra" dir=3D"auto"><br><div class=3D"gmail_quote=
">On Jan 6, 2017 23:44, &quot;Dan L=C3=BCdtke&quot; &lt;<a href=3D"mailto:m=
ail@danrl.com">mail@danrl.com</a>&gt; wrote:<br type=3D"attribution"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"quoted-text"><br>
&gt; On 4 Jan 2017, at 19:50, Jason A. Donenfeld &lt;<a href=3D"mailto:Jaso=
n@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
&gt;<br>
&gt; OpenWRT should _not_ ship this.<br>
<br>
<br>
</div>Agreed.<br>
<br>
Everything else looks good to me. Just had a brief look at it.<br>
<br>
Let&#39;s see what buildbot says. Should all run smoothly!<br>
</blockquote></div><br></div><div class=3D"gmail_extra" dir=3D"auto">I assu=
me youre not shipping the bash completion stuff either, right? Since openwr=
t doesn&#39;t use bash.</div></div>

--94eb2c034dda4607f9054574ff9c--

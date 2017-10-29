Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeab18db
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 17:05:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94086c66
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 17:05:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f31c78a
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 17:05:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2e86e3d3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 17:05:01 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id j126so17806491oib.8
 for <wireguard@lists.zx2c4.com>; Sun, 29 Oct 2017 10:07:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <801971811.33026.1509279684633@ichabod.co-bxl>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
 <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
 <801971811.33026.1509279684633@ichabod.co-bxl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Oct 2017 18:07:07 +0100
Message-ID: <CAHmME9qrY9r=uZ=0mqXh=TfiSp3FUXYkbuWp7DgZhx+k11X-ig@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Geo Kozey <geokozey@mailfence.com>
Content-Type: multipart/alternative; boundary="001a114a23684e235f055cb28d22"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114a23684e235f055cb28d22
Content-Type: text/plain; charset="UTF-8"

On Oct 29, 2017 1:21 PM, "Geo Kozey" <geokozey@mailfence.com> wrote:

October 28, 2017 7:57:06 PM CEST "Jason A. Donenfeld" <Jason@zx2c4.com>
wrote:

>On Oct 28, 2017 5:03 PM, "Daniel Kahn Gillmor" <dkg@fifthhorseman.net>
wrote:
>
>My concern with the resolvconf model (whether implemented by openresolv
>or not) is that each daemon that needs to execute resolvconf needs to be
>root.
>
>1) wg-quick isn't a daemon, though openvpn is.
>
>2) I can think of at least 5 ways to implement a resolvconf binary without
requiring root, making your argument moot. There's nothing inherent in the
resolvconf model that would require it.
>
>If you're interested in spending the time implementing this for
openresolv, I can spec those out in detail for you. Alternatively, you can
just wait for the systemd devs to add a resolvconf for controlling
systemd-resolved, if that's the horse you're betting on.

FYI you can already change DNS through resolvconf from non-root daemons
with correct file permissions or ACLs but that's off-topic.


Yep! Pretty straight forward.


Yours sincerely

G. K.

--001a114a23684e235f055cb28d22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Oct 29, 2017 1:21 PM, &quot;Geo Kozey&quot; &lt;<a href=3D=
"mailto:geokozey@mailfence.com">geokozey@mailfence.com</a>&gt; wrote:<br ty=
pe=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"elided-text">Octo=
ber 28, 2017 7:57:06 PM CEST &quot;Jason A. Donenfeld&quot; &lt;<a href=3D"=
mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
<br>
&gt;On Oct 28, 2017 5:03 PM, &quot;Daniel Kahn Gillmor&quot; &lt;<a href=3D=
"mailto:dkg@fifthhorseman.net">dkg@fifthhorseman.net</a>&gt; wrote:<br>
&gt;<br>
&gt;My concern with the resolvconf model (whether implemented by openresolv=
<br>
&gt;or not) is that each daemon that needs to execute resolvconf needs to b=
e<br>
&gt;root.<br>
&gt;<br>
&gt;1) wg-quick isn&#39;t a daemon, though openvpn is.<br>
&gt;<br>
&gt;2) I can think of at least 5 ways to implement a resolvconf binary with=
out requiring root, making your argument moot. There&#39;s nothing inherent=
 in the resolvconf model that would require it.<br>
&gt;<br>
&gt;If you&#39;re interested in spending the time implementing this for ope=
nresolv, I can spec those out in detail for you. Alternatively, you can jus=
t wait for the systemd devs to add a resolvconf for controlling systemd-res=
olved, if that&#39;s the horse you&#39;re betting on.<br>
<br>
</div>FYI you can already change DNS through resolvconf from non-root daemo=
ns with correct file permissions or ACLs but that&#39;s off-topic.<br></blo=
ckquote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yep=
! Pretty straight forward.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=
=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Yours sincerely<br>
<font color=3D"#888888"><br>
G. K.<br>
</font></blockquote></div><br></div></div></div>

--001a114a23684e235f055cb28d22--

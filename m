Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e8ef019
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 17:55:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1736c997
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 17:55:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c697d81
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 17:55:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3629200f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Oct 2017 17:55:08 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id v132so15509483oie.1
 for <wireguard@lists.zx2c4.com>; Sat, 28 Oct 2017 10:57:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ineze3x2.fsf@fifthhorseman.net>
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
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 28 Oct 2017 19:57:06 +0200
Message-ID: <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary="001a113cca143a19bb055c9f2291"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cca143a19bb055c9f2291
Content-Type: text/plain; charset="UTF-8"

On Oct 28, 2017 5:03 PM, "Daniel Kahn Gillmor" <dkg@fifthhorseman.net>
wrote:


My concern with the resolvconf model (whether implemented by openresolv
or not) is that each daemon that needs to execute resolvconf needs to be
root.


1) wg-quick isn't a daemon, though openvpn is.

2) I can think of at least 5 ways to implement a resolvconf binary without
requiring root, making your argument moot. There's nothing inherent in the
resolvconf model that would require it.

If you're interested in spending the time implementing this for openresolv,
I can spec those out in detail for you. Alternatively, you can just wait
for the systemd devs to add a resolvconf for controlling systemd-resolved,
if that's the horse you're betting on.

--001a113cca143a19bb055c9f2291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature"><br></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 28, 2017 5:0=
3 PM, &quot;Daniel Kahn Gillmor&quot; &lt;<a href=3D"mailto:dkg@fifthhorsem=
an.net">dkg@fifthhorseman.net</a>&gt; wrote:<blockquote class=3D"quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"quoted-text">
<br>
</div>My concern with the resolvconf model (whether implemented by openreso=
lv<br>
or not) is that each daemon that needs to execute resolvconf needs to be<br=
>
root.<br></blockquote></div></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">1) wg-quick isn&#39;t a daemon, though openvpn is.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">2) I can think of at least 5 ways to =
implement a resolvconf binary without requiring root, making your argument =
moot. There&#39;s nothing inherent in the resolvconf model that would requi=
re it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you&#39;re int=
erested in spending the time implementing this for openresolv, I can spec t=
hose out in detail for you. Alternatively, you can just wait for the system=
d devs to add a resolvconf for controlling systemd-resolved, if that&#39;s =
the horse you&#39;re betting on.</div></div>

--001a113cca143a19bb055c9f2291--

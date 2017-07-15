Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9c9eaec
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jul 2017 22:04:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07c1a243
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jul 2017 22:04:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f66071c
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jul 2017 22:17:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 109780c4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Jul 2017 22:17:44 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id v60so14942009wrc.3
 for <wireguard@lists.zx2c4.com>; Sat, 15 Jul 2017 15:23:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170715215751.GA3773@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
 <20170710025614.GA17552@wolff.to>
 <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
 <20170715215751.GA3773@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 16 Jul 2017 00:22:58 +0200
Message-ID: <CAHmME9rVdjSAt8Lhm3N+Yc24wa31zX11M5s04XsT8AJqjdMjbw@mail.gmail.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: multipart/alternative; boundary="001a113a4172b6ae1e0554629b23"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113a4172b6ae1e0554629b23
Content-Type: text/plain; charset="UTF-8"

Nice! I was starting to loose faith in Ted. But glad we got this done...

If you haven't noticed, this is another piece of WireGuard that's gone
upstream, with the compat/ section augmented for old kernels. Little by
little, I'm hoping to move more into compat/ to get the controversial
things upstream piecemeal without folks noticing. Shh, don't tell! Strategy
seems to be working quite well. :)

Jason

--001a113a4172b6ae1e0554629b23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Nice! I was starting to loose f=
aith in Ted. But glad we got this done...
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If yo=
u haven&#39;t noticed, this is another piece of WireGuard that&#39;s gone u=
pstream, with the compat/ section augmented for old kernels. Little by litt=
le, I&#39;m hoping to move more into compat/ to get the controversial thing=
s upstream piecemeal without folks noticing. Shh, don&#39;t tell! Strategy =
seems to be working quite well. :)</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Jason</div></div>

--001a113a4172b6ae1e0554629b23--

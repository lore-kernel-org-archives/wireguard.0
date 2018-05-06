Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47a8ae0f
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:25:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02c3997a
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:25:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b1135e7
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:27:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86fc4a81
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:27:20 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id l1-v6so22301632oii.1
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 18:27:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1a630d88-d7f8-7437-89a2-786b3da5888c@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAKXLc7dZD1Qzx1q1fPPikXPvu+vAgCpKnBBiP_hKSiJOtTbxng@mail.gmail.com>
 <CAHLp1Y=S0EmJHJ5kKJMJnd=0==QqCGVX4HXrYV62H=Nk+nx96Q@mail.gmail.com>
 <1a630d88-d7f8-7437-89a2-786b3da5888c@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 May 2018 03:27:35 +0200
Message-ID: <CAHmME9o4PUH_+DNMC1cWPcRRfDvdeB0k_6bJMgsMMN8JSq51PA@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol <vtol@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, May 5, 2018 at 7:53 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net> wrote:
> I trust that such is available and common practice with other VPN apps.

I should point out that "other VPN apps are doing it" is mostly not a
motivation for adding a nob. We're trying to aim with WireGuard as
close to a nob-less security model as possible. This is indeed a
substantially different goal from other projects, many of which love
to add features and choices. On the other hand, WireGuard aims to look
at the complete system and tries to determine what set of parameters
always provide security in the model we're going for. For example,
most other VPN apps let you choose your "cipher suite". DES? Blowfish?
AES? XTEA? This project has a bit of a different focus. I realize this
might be less exciting to watch, but I do believe this approach will
nudge us a tiny bit closer to having secure software.

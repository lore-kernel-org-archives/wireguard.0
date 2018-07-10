Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fae9d4b0
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:31:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47129ef7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:31:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91e9e4fc
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:30:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ec29246
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 18:30:00 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id r16-v6so44582699oie.3
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jul 2018 11:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <b9ab5d4d26c6fe7b@frisell.zx2c4.com>
 <20180710195436.357fb972@natsu>
 <CAHmME9peVZz_x2tQPGng68N1bphyYMHi4FxK9PV4Tt5XRLf4fQ@mail.gmail.com>
 <20180710205729.645bc734@natsu> <20180710233722.31d6b060@natsu>
In-Reply-To: <20180710233722.31d6b060@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Jul 2018 20:38:24 +0200
Message-ID: <CAHmME9r6perr5PFyF-M6Zcife3V0KZMN-XJ09gcUr-csVxmcBA@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180708` Available
To: Roman Mamedov <rm@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jul 10, 2018 at 8:37 PM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Tue, 10 Jul 2018 20:57:29 +0500
> Roman Mamedov <rm@romanrm.net> wrote:
>
> > I'll probably test again without simd_relax
>
> Somehow it's now noticeably worse without those. Even got some dips below
> 1 Gbit/s which I have never seen before, and the overall speed is lower.

I might not be understanding you correctly. Do you mean to suggest
that removing simd_relax() actually harms performance now? That having
it in there helps performance?

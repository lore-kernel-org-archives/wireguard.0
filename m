Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a676c5f1
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:06:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4db550a3
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:06:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 060f0386
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:06:32 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id n6so102445816qtd.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 06:09:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <67b97701-8286-039e-31bb-b7275ab338e8@eggiecode.org>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <CAHmME9rUEA7ZXjZj5Th45X-tHEZfTQB134M+ym0sqyK3a4a4og@mail.gmail.com>
 <67b97701-8286-039e-31bb-b7275ab338e8@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 15:09:20 +0100
Message-ID: <CAHmME9rPPxnKWDXYv7r=GjrAoSaMqPRhdALmGxHbRV9v5uC48A@mail.gmail.com>
To: Egbert Verhage <egbert@eggiecode.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Egbert,

On Wed, Nov 16, 2016 at 11:03 AM, Egbert Verhage <egbert@eggiecode.org> wrote:
> Going to update the PPA to remove my disable of AVX2.

Good. Can you remove this garbage immediately:
https://git.launchpad.net/wireguard/tree/debian/patches/update-hard-disable-patch-to-upstream
https://git.launchpad.net/wireguard/tree/debian/patches/0001-disable-hard-avx2

There are two principles I would like to see adamantly applied before
I'll endorse this PPA:

1. Stay as close to vanilla upstream snapshots as possible. Do not
have patches that differ from Debian's too much. If you need changes,
consult the very active and very willing upstream instead.
2. Only package snapshots. Do not choose your own git commits.

Are these two things you're willing to do?

Thanks,
Jason

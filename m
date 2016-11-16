Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d638f108
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:21:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9533a5b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:21:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a7a3733a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:21:46 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so176807857qka.3
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 06:24:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c5b6cb19-32b8-7f7c-f3f0-ac542579917a@eggiecode.org>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <87lgwj9b43.fsf@alice.fifthhorseman.net>
 <c5b6cb19-32b8-7f7c-f3f0-ac542579917a@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 15:24:35 +0100
Message-ID: <CAHmME9q7GX2CzYDxQC-W7nmjAeRkht+1hQxFRr22be5E244J+Q@mail.gmail.com>
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

Hey Egbert, Daniel,

On Wed, Nov 16, 2016 at 12:10 PM, Egbert Verhage <egbert@eggiecode.org> wrote:
> Git repo: https://git.launchpad.net/wireguard?h=master

Is there a good machine readable URL that I can check for getting the
latest package version?

For Debian I currently use this cludge, which is totally wrong and terrible:
curl -s https://anonscm.debian.org/git/collab-maint/wireguard.git/refs/
| sed -n 's/.*debian\/\([^ ]*\)-experimental[0-9]\+.*/\1/p' | head -n
1

Thanks,
Jason

Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c3a62d
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 22:49:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27a0c58b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 22:49:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14f45053
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 22:49:46 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g23so272769414wme.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 14:52:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87bmxf6pe8.fsf@alice.fifthhorseman.net>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <87lgwj9b43.fsf@alice.fifthhorseman.net>
 <c5b6cb19-32b8-7f7c-f3f0-ac542579917a@eggiecode.org>
 <CAHmME9q7GX2CzYDxQC-W7nmjAeRkht+1hQxFRr22be5E244J+Q@mail.gmail.com>
 <87bmxf6pe8.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 23:52:36 +0100
Message-ID: <CAHmME9r9+mKobBpTCEXtShaCGg_3q5bc0g5QUFKD0MtFwrqn0A@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Egbert Verhage <egbert@eggiecode.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Daniel,

On Wed, Nov 16, 2016 at 11:17 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
>    https://qa.debian.org/madison.php?package=wireguard

Perfect, thanks. I wound up using:
https://qa.debian.org/madison.php?package=wireguard&table=debian&a=&c=&g=on&s=&text=on
And then I just match on the capture group in:
    >= ([0-9.]+)-experimental[0-9]+

Jason

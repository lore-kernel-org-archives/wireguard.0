Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad24e395
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:58:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6361bb49
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:58:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ce255077
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:58:16 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id c13so36141977lfg.0
 for <wireguard@lists.zx2c4.com>; Sat, 12 Nov 2016 17:00:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1478998272.2299343.785875225.19237693@webmail.messagingengine.com>
References: <CAHmME9qi7_C7c=wsZg=EwBg3jzFzVmW1eiFGGXgcX8fCcOOZcA@mail.gmail.com>
 <31e050e2-0499-a77e-f698-86e58ad2fa6b@cumulusnetworks.com>
 <CAHmME9o_AM1Lms6CJSpbjfAgcyGuRx8yqwSaNWEbSnY7gGnt6w@mail.gmail.com>
 <CAHmME9oeAuBQJguTFivYsYw4fMoc4+sgxcdS4MArN474m7NjTQ@mail.gmail.com>
 <0dbf5deb-bffb-4878-a268-1adb17c47676@cumulusnetworks.com>
 <CAHmME9owJNvMfF9jHGW7i_jPMaxwPhxQE5W6cxjw14nL0HK0eQ@mail.gmail.com>
 <CAHmME9pMzcwjveOoa08-fVCnZTkaoMz8y9DEc7f6b-4PeWu4xQ@mail.gmail.com>
 <1478998272.2299343.785875225.19237693@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 13 Nov 2016 02:00:38 +0100
Message-ID: <CAHmME9qYYU-p5BhR0ReNSB+__wysuDK+eEk1SisCoyf4=2woxg@mail.gmail.com>
To: Hannes Frederic Sowa <hannes@stressinduktion.org>
Content-Type: text/plain; charset=UTF-8
Cc: David Ahern <dsa@cumulusnetworks.com>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>,
 LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>
Subject: Re: [WireGuard] Source address fib invalidation on IPv6
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Hannes,

On Sun, Nov 13, 2016 at 1:51 AM, Hannes Frederic Sowa
<hannes@stressinduktion.org> wrote:
> You probably need some combination of ipv6_chk_addr and/or
> ipv6_check_addr_and_flags (where dev can also be NULL). Be careful if a
> IFA_HOST or IFA_LINK address switches from one interface to another.

I can confirm this trick works beautifully:
https://git.zx2c4.com/WireGuard/commit/?id=eb65810fc6350c50b42abedd1291b12337d3dc3d

I'll see if I can fold this into the routing function so that it
behaves the same as v4, unless David gets there first.

Regards,
Jason

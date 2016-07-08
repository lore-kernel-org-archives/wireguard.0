Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e906e7f
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 00:55:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 487fb118
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 00:55:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7524e8e7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 00:55:19 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id l188so21929954lfe.2
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 17:55:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 02:55:31 +0200
Message-ID: <CAHmME9pwPPsanwxjwwpx+rgid1-K=fCuMtsw1GyY_Hy7ec5ZEQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 7, 2016 at 6:33 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 1. What should the payload be? Should it be a single fixed byte? Or
> should it be a zero length UDP packet?

Zero length.

> 2. What is an acceptable minimum interval? Every 5 seconds?

Every 10 seconds, so that we can only push the timer back on sending,
and then rely on the opportunistic keepalive for making things
coherent.

> 3. What is an acceptable maximum interval? 3600 seconds?

3600 seconds.

> 4. What is a good interval to show in documentation examples that will
> work for most people?

25 seconds, based on a massive survey of different routing equipment
in the wild.

> After this feature is ironed out, I'll be pushing a new experimental
> snapshot. This is currently the most visible headache of WireGuard and
> I'd like to get it ironed out sooner rather than later.

Ongoing work lives in this branch, which I'll merge soon:
https://git.zx2c4.com/WireGuard/log/?h=persistent-keepalive

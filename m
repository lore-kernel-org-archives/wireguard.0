Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 587f7c24
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 00:09:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf451bee
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 00:09:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4592716
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 00:09:22 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f82so35773376wmf.1
 for <wireguard@lists.zx2c4.com>; Tue, 15 Nov 2016 16:12:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 01:12:05 +0100
Message-ID: <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
To: Egbert Verhage <egbert@eggiecode.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Egbert,

Great to see! How much does this deviate from debian's? As far as I
can tell, you should be able to keep things basically the same.


> Testing it constantly on 4 of my servers and works it great!
Happy to hear that.

> Even added a patch for ifupdown to setup WireGuard in
> /etc/network/interfaces
Cool!


> The only downside is that I disabled AVX2 cpu extention in the code,
> because of kernel panics on VPS's by a hosting company
> (https://eggiecode.org/wg-kernel-panic.png).

This isn't okay. Downstream packages really shouldn't be applying
patches like that. If you revert that, I can list this as the primary
PPA for WireGuard. With that said, let's actually try to fix this
issue for good...

AVX2 is advertised through CPUID. Is it possible that your VPS passes
through the CPUID from the host while not supporting all instructions?
Or perhaps, rather, fakes a CPUID that isn't the host's, while only
supporting instructions of the host? Very mysterious. What hosting
company is this? Is there a chance I can poke around at this setup? Do
you know if it's KVM or Xen or VMWare or something else?

If it turns out that your VPS host just does something horrible, I'll
look for a way to globally disable kernel usage of AVX2, without
having to patch WireGuard like that. If it's particular to the host,
perhaps we can come up with either a particular kernel module to do
the disabling, or some ungodly hack to /dev/kmem... Are you compiling
your own kernel for this system, or just using stock Ubuntu kernel?

I'm pretty sure, by the way, that we're using the right detection
function within WireGuard, seeing as every other place in the tree
uses the same thing: https://paste.kde.org/pdljfawf7/79eh62 .

Thanks a bunch for helping out.

Jason

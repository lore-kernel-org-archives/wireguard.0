Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c836029
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:37:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 357c4ee8
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:37:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63e1295a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:37:49 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id o141so123565734lff.1
 for <wireguard@lists.zx2c4.com>; Thu, 10 Nov 2016 09:39:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1611101351260.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
 <alpine.DEB.2.20.1611100959040.3501@nanos>
 <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
 <alpine.DEB.2.20.1611101351260.3501@nanos>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Nov 2016 18:39:54 +0100
Message-ID: <CAHmME9rv8CfgY87S_HVN3njc2RnisjoxzfZxY=H=2FzZkrQqLg@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, linux-mm@kvack.org
Subject: Re: [WireGuard] Proposal: HAVE_SEPARATE_IRQ_STACK?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Thomas,

On Thu, Nov 10, 2016 at 2:00 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> Do not even think about going there. That's going to be a major
> mess.

Lol! Okay. Thank you for reigning in my clearly reckless
propensities... Sometimes playing in traffic is awfully tempting.

>
> As a short time workaround you can increase THREAD_SIZE_ORDER for now and
> then fix it proper with switching to seperate irq stacks.

Okay. I think in the end I'll kmalloc, accept the 16% slowdown [1],
and focus efforts on having a separate IRQ stack. Matt emailed in this
thread saying he was already looking into it, so I think by the time
that slowdown makes a difference, we'll have the right pieces in place
anyway.

Thanks for the guidance here.

Regards,
Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=cc3d7df096a88cdf96d016bdcb2f78fa03abb6f3

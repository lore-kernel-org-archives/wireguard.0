Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff086698
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 11:39:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f90ed49
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 11:39:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ed9d00da
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 11:39:01 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id t196so187779258lff.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 Nov 2016 03:41:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1611100959040.3501@nanos>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
 <alpine.DEB.2.20.1611100959040.3501@nanos>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Nov 2016 12:41:04 +0100
Message-ID: <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
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

On Thu, Nov 10, 2016 at 10:03 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> If you want to go with that config, then you need
> local_bh_disable()/enable() to fend softirqs off, which disables also
> preemption.

Thanks. Indeed this is what I want.

>
>> What clever tricks do I have at my disposal, then?
>
> Make MIPS use interrupt stacks.

Yea, maybe I'll just implement this. It clearly is the most correct solution.
@MIPS maintainers: would you merge something like this if done well?
Are there reasons other than man-power why it isn't currently that
way?

> Does the slowdown come from the kmalloc overhead or mostly from the less
> efficient code?
>
> If it's mainly kmalloc, then you can preallocate the buffer once for the
> kthread you're running in and be done with it. If it's the code, then bad
> luck.

I fear both. GCC can optimize stack variables in ways that it cannot
optimize various memory reads and writes.

Strangely, the solution that appeals to me most at the moment is to
kmalloc (or vmalloc?) a new stack, copy over thread_info, and fiddle
with the stack registers. I don't see any APIs, however, for a
platform independent way of doing this. And maybe this is a horrible
idea. But at least it'd allow me to keep my stack-based code the
same...

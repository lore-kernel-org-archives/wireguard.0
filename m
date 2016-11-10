Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09cc6ce3
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 01:45:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1cb89f19
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 01:45:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 975eff62
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 01:45:47 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id b14so178034673lfg.2
 for <wireguard@lists.zx2c4.com>; Wed, 09 Nov 2016 17:47:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5823BCA3.2020202@caviumnetworks.com>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <5823BCA3.2020202@caviumnetworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Nov 2016 02:47:47 +0100
Message-ID: <CAHmME9oXsRrABzCjCQ_+O+QJmMgWyoyj73igHLaJKNfbf-brDQ@mail.gmail.com>
To: David Daney <ddaney@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Proposal: HAVE_SEPARATE_IRQ_STACK?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 10, 2016 at 1:17 AM, David Daney <ddaney@caviumnetworks.com> wrote:
> Easiest thing to do would be to select 16K page size in your .config, I
> think that will give you a similar sized stack.

I didn't realize that was possible...

I'm mostly concerned about the best way to deal with systems that have
a limited stack size on architectures without support for separate irq
stacks. Part of this I assume involves actually detecting with a
processor definition that the current architecture has a deceptively
small stack.

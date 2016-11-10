Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f625368
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:35:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4fcab8e
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:35:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9513547b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Nov 2016 17:35:06 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so196158273lff.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 Nov 2016 09:37:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <db056fb5-82b3-c17e-46ce-263872ef7334@imgtec.com>
References: <CAHmME9oSUcAXVMhpLt0bqa9DKHE8rd3u+3JDb_wgviZnOpP7JA@mail.gmail.com>
 <alpine.DEB.2.20.1611092227200.3501@nanos>
 <CAHmME9pGoRogjHSSy-G-sB4-cHMGcjCeW9PSrNw1h5FsKzfWAw@mail.gmail.com>
 <alpine.DEB.2.20.1611100959040.3501@nanos>
 <CAHmME9pHYA82M3iDNfDtDE96gFaZORSsEAn_KnePd3rhFioqHQ@mail.gmail.com>
 <db056fb5-82b3-c17e-46ce-263872ef7334@imgtec.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Nov 2016 18:37:10 +0100
Message-ID: <CAHmME9ooeH2Qdu3zVS-_i_9_3AR0bDrEe_8+D3FS7E7NvMLG-Q@mail.gmail.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
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

Hi Matt,

On Thu, Nov 10, 2016 at 5:36 PM, Matt Redfearn <matt.redfearn@imgtec.com> wrote:
>
> I don't see a reason not to do this - I'm taking a look into it.

Great thanks! This is good to hear. If you go into the arch/ directory
and simply grep for "irq_stack", you can pretty easily base your
implementation on a variety of other architectures' implementations.

Jason

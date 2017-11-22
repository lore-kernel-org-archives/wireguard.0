Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3f42c16
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:15:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69efd3f5
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:15:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ec79b74
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:15:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e9ec6d8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:15:38 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id g139so2116909oic.5
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 15:20:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <878texyk9e.fsf@nemesis.taht.net>
References: <20171121092516.Horde.-KEs7jQ3bs1TXDF4g98Y3gQ@www.vdorst.com>
 <20171121094032.Horde.sBBE8SerNxaWD9b3BswUV6c@www.vdorst.com>
 <CAHmME9poJnG1DnxBEu3NLRQ3gYRsnBkGT=p0y1ugiOdm=0y4eg@mail.gmail.com>
 <878texyk9e.fsf@nemesis.taht.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 00:20:47 +0100
Message-ID: <CAHmME9o-K3j-cso8ZWDZNLJWW=a9=VkK23gw0mvXwdr-WFrosg@mail.gmail.com>
Subject: Re: ARM multitheaded?
To: Dave Taht <dave@taht.net>
Content-Type: text/plain; charset="UTF-8"
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 23, 2017 at 12:19 AM, Dave Taht <dave@taht.net> wrote:
> Not moi? :)

You too, of course!

>
> My take on things was basically not even try to do multicore on single
> flows but to start by divvying up things into tons of queues, and try to
> keep those flows entirely on the core they started with.

Yes, this is the traditional approach taken, but it doesn't work well
for accelerating the crypto of say, a single file downloading or
somebody watching youtube. I don't want these pegged to a single core.

Jason

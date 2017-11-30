Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67f7eb47
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:48:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d80b5359
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:48:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afbd81fc
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:48:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3dbc4a03
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 17:48:47 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id o23so6854686otd.1
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 09:54:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130152355.25387-1-gregkh@linuxfoundation.org>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Nov 2017 18:54:55 +0100
Message-ID: <CAHmME9rHLWigU82UoU380o0D3K6u1O5hnOUaqZ9m4TWFF7o5eA@mail.gmail.com>
Subject: Re: [PATCH 0/6] wireguard: add SPDX tags
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Greg,

Thanks for the patch set. I'll review and possibly merge if no
pressing concerns.

On Thu, Nov 30, 2017 at 4:23 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On a side note, the whole "All rights reserved" is cargo-cult crud.  As
> described by a developer who has done more license work than probably
> anyone else on the kernel mailing list today:
> So you can remove those from the files as well if you want to, but I'll
> let you do that :)

I've been told a million different things about this from a million
different "experts", and now I don't know what to believe, so for now
I'm just taking the path of least resistance and keeping it "just in
case." It's kind of like when you build a kernel and have no idea what
you're doing, you just enable everything and hope for the best... At
some point I'll talk to a real lawyer -- not a slashdot lawyer -- and
get some clarification and make deliberate decisions. For now we're
stuck on allyesconfig.

Jason

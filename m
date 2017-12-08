Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea53c2b8
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:16:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7136feb
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:16:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd7f0ce3
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:16:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a556c56
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 04:16:44 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 103so8263405otj.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 20:23:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 05:23:49 +0100
Message-ID: <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
Subject: Re: [patch] wg: add support for peer names using a file in userspace
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

Hi Lonnie,

Thanks for sending this to the mailing list. Indeed it got lost in the
fold of disorganized email filters when you sent it to me directly
twice earlier; sorry about that.

I'm not certain this is the right approach -- having wg(8) rely on
fixed filesystem paths, and splitting peer configuration information
across three places (original config file, peer data file, kernel).

I think the way forward for this kind of feature would be what I
proposed in an earlier thread, of attaching it to the kernel object,
just like ifalias does or netfilter's comment target. However, the
question I'm still faced with is -- is this really necessary? I
understand that it's _cool_, and adding bells and whistles is fun and
exciting, but I wonder if there a complete system that would actually
benefit form having this that wouldn't already have a better place to
do it?

Jason

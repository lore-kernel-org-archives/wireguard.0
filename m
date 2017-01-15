Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3532f79
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:51:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24f05fa5
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:51:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48971ba6
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:50:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fbfb5203
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:50:59 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id j15so86398761oih.2
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:01:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
 <20170108225732.GC9445@tuxmachine.polynome.dn42>
 <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:01:19 +0100
Message-ID: <CAHmME9rBgpNVFypk68SLNLiDqrjTp2Aq+FaVNd3o+Dd8FCjTWQ@mail.gmail.com>
Subject: Re: Multiple Endpoints
To: em12345 <em12345@web.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Em,

Circling back to this thread, indeed Baptiste was right. While the
existing situation will likely work fine with NAT, it won't work as
nicely with a strict stateful firewall, when the server IP is dynamic
and changing. So, there's some headway to be made with Baptiste's
multi-endpoint idea. But in the interim, it seems likely the best
mechanism to use would be some userspace solution to check
periodically if the dynamic IP has changed, and to update the
wireguard device accordingly. Hopefully I'll implement some kind of
userspace notification logic so this can be more fine grained than a
cronjob. I'll let you know how this progresses.

Jason

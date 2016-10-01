Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
 [209.85.220.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d4c6b83
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 15:30:08 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id t7so132130006qkh.2
 for <wireguard@lists.zx2c4.com>; Sat, 01 Oct 2016 08:41:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87twcw9tih.fsf@toke.dk>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 1 Oct 2016 08:40:59 -0700
Message-ID: <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: cake@lists.bufferbloat.net, make-wifi-fast@lists.bufferbloat.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [Cake] WireGuard Queuing, Bufferbloat, Performance,
 Latency, and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

My thought - given that at least on some platforms - encrypting 1000
packets at a time is a bad idea - would be something regulating the
amount of data being crypted at a time, an equivalent to byte queue
limits - BQL - BCL? byte crypto limits - to keep no more than, say,
1ms of data in that part of the subsystem.

... also pulling stuff out of order from an already encrypted thing
leads to the same IV problems we had in mac80211.

Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09235c6e
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 16:22:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff28605d
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 16:22:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0fdc015
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 16:22:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 02673d83
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 16:22:21 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id b126so183060679oia.2
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 08:29:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87fuli7itj.fsf@toke.dk>
References: <87fuli7itj.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 17:29:24 +0100
Message-ID: <CAHmME9o-0qccmg2zbM62fhi_KuEjtDoXZfBFPtf3yyhUKwtfiA@mail.gmail.com>
Subject: Re: Multicast over a wireguard link?
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

Hi Toke,

Right now, no, there's no multicast. But it wouldn't be that hard to
add the ability to add the same allowed-ips entry to multiple peers,
and have WireGuard duplicate the message to all of them.

It's not complicated in theory, but I wonder if this would be
genuinely useful, and whether or not it'd open up a wormhole of
potential issues.

Thoughts?

Jason

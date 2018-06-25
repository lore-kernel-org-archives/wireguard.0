Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86eb1e0d
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:50:06 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5e0ff5f
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:50:06 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Adrian Sevcenco <adrian.sev@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
In-Reply-To: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
Date: Mon, 25 Jun 2018 21:55:36 +0200
Message-ID: <8736xaod3b.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Adrian Sevcenco <adrian.sev@gmail.com> writes:

> Hi! It seems that AllowedIPs declaration gets erased when peers are 
> added with addconf

You can't have the same AllowedIPs for two different peers... :)

-Toke

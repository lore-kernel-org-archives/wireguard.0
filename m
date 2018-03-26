Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40dd654a
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 20:42:05 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96082c24
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 20:42:05 +0000 (UTC)
Date: Mon, 26 Mar 2018 22:53:57 +0200
From: Luis Ressel <aranea@aixah.de>
To: Saeid Akbari <saeidscorp@yahoo.com>
Subject: Re: Some potential bug in wg-quick re. fwmark and default route
Message-ID: <20180326225357.4520db1c@vega.skynet.aixah.de>
In-Reply-To: <4993616.ZASKD2KPVS@scorpbook>
References: <4993616.ZASKD2KPVS@scorpbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Saeid,

I'm sorry your inquiry has gone unanswered for two weeks; it was simply
drowned by all the user questions. I'm glad I found it now, since you
raise a few interesting points.

As you have discovered, wg-quick is very limited (being the wacky shell
script that it is) and behaves oddly in some corner cases.

I'm drawing a few diagrams right now to see if I can find a way to
improve the add_route/add_default and del_if parts of wg-quick without
increasing the overall complexity too much. Both of your suggestions are
good ideas; if you have further input, that'd be much appreciated!

Cheers,
Luis

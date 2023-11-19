Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED9C072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 14:54:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8271c71a;
	Sun, 19 Nov 2023 14:54:35 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f01dd2d7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Nov 2023 14:54:34 +0000 (UTC)
Received: janet.servers.dxld.at; Sun, 19 Nov 2023 15:54:33 +0100
Date: Sun, 19 Nov 2023 15:54:31 +0100
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Dave Mifsud <dave.mifsud@um.edu.mt>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Wireguard Windows keeps using lower priority interface (wifi)
 when a higher priority interface (wired) becomes available
Message-ID: <20231119145431.leefvef3r4wdseq2@House.clients.dxld.at>
References: <CALv0RtmmZyMUGeBjuU+hvDven23Ad6XYWqfL--h+m-sHt-+ZPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALv0RtmmZyMUGeBjuU+hvDven23Ad6XYWqfL--h+m-sHt-+ZPg@mail.gmail.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Dave,

On Thu, Oct 19, 2023 at 09:43:46AM +0200, Dave Mifsud wrote:
> Has anyone come across this issue? Can anything be done, apart from
> creating a trigger in windows such that whenever a wired connection
> becomes available Wireguard is restarted? We would like to avoid this,
> as the solution seems too drastic.

Sounds very similar to the behaviour I'm seeing with the Linux kernel
implementation. This is intentional as best I can tell, it's called "sticky
sockets".

See my lament thread "Wg source address is too sticky for multihomed
systems aka multiple endpoints redux"
https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html

It's safe to say many people have run into this and I think will continue
to do so as multihoming (aka wifi+ethernet) is pervasive.

I have a workaround for this on Linux without breaking connectivity by
completely restarting the interface. It involves setting fwmark which
invalidates the cached route, not sure a comparable codepath exists in the
windows impl.

--Daniel

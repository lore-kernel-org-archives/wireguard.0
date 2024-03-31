Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02940CD1284
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 31 Mar 2024 14:53:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10afbc3e;
	Sun, 31 Mar 2024 14:50:15 +0000 (UTC)
Received: from mail.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99f58ec3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Mar 2024 14:50:14 +0000 (UTC)
Received: mail.servers.dxld.at;
	Sun, 31 Mar 2024 16:50:13 +0200
Date: Sun, 31 Mar 2024 16:50:08 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Peter Lister <peter@bikeshed.quignogs.org.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WG on LXC
Message-ID: <20240331145008.dwkxa2iuviksnppv@darkboxed.org>
References: <7d701aaa-b9fd-4b59-b8db-ce360a94280e@bikeshed.quignogs.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d701aaa-b9fd-4b59-b8db-ce360a94280e@bikeshed.quignogs.org.uk>
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

Hi Peter,

On Fri, Mar 22, 2024 at 06:52:16PM +0000, Peter Lister wrote:
> I'm using wg on my home network, using a Linux router with OpenWRT and
> running services (e.g. IMAP) on LXC containers.
> 
> Having read how wg is intended to work within name spaces, I expected to
> easily create LXC containers with *only* a wg interface, 

This is a relatively new way of doing things, not every tool is going to
support it.

What exactly are you trying to accomplish by doing this? In my mind you can
simply have *one* wg tunnel on the LXC host machine and use routed veth
networking to connect the containers to this uplink, but I'm probably
missing something.

> It also seems odd that client hosts need each wg client to use per-server
> endpoint addresses when they are all hosted on one physical server's network
> interface.

I'm not sure I've understood your current setup. Could you make your
explaination a bit more concrete? Wg configs snippets from the Host and
container would be helpful.

> I'm sure it's possible to script a solution, but ideally I want to specify
> lxc.net.0.type as "wireguard", give it a key pair and that should be that,
> with all config living outside the container.

Sounds nice but you'll want to talk to the LXC project instead of WireGuard
if getting that supported is your goal.

--Daniel

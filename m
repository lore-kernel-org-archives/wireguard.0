Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6CFC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 14:56:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090C921479
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090C921479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf2fcd34;
	Mon, 18 Feb 2019 14:47:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f18dca0
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 14:47:40 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 947b9ca5
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 14:47:40 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 49DBC1E305A;
 Mon, 18 Feb 2019 09:56:05 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 09E651E3040;
 Mon, 18 Feb 2019 09:56:04 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: dynamic reload of configuration file
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CACOeLqLEo2mX3AXvEPcG6EAOdwQf+PW3BvfKvYFPzsu6vLp5GQ@mail.gmail.com>
Date: Mon, 18 Feb 2019 08:56:03 -0600
Message-Id: <3C0540CA-7490-48CA-8EF6-EDC95DC3E64B@lonnie.abelbeck.com>
References: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
 <1550417524.ondhfeso9t.astroid@morple.none>
 <CACOeLqLEo2mX3AXvEPcG6EAOdwQf+PW3BvfKvYFPzsu6vLp5GQ@mail.gmail.com>
To: Raffaele Spazzoli <rspazzol@redhat.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Raffaele, typing "wg help" should answer many of your questions:
--
# wg help
Usage: wg <cmd> [<args>]

Available subcommands:
  show: Shows the current configuration and device information
  showconf: Shows the current configuration of a given WireGuard interface, for use with `setconf'
  set: Change the current configuration, add peers, remove peers, or change peers
  setconf: Applies a configuration file to a WireGuard interface
  addconf: Appends a configuration file to a WireGuard interface
  genkey: Generates a new private key and writes it to stdout
  genpsk: Generates a new preshared key and writes it to stdout
  pubkey: Reads a private key from stdin and writes a public key to stdout
You may pass `--help' to any of these subcommands to view usage.
--

--
# wg set --help
Usage: wg set <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...
--

Lonnie


> On Feb 18, 2019, at 7:51 AM, Raffaele Spazzoli <rspazzol@redhat.com> wrote:
> 
> Samuel,
> 
> I read that section of the docs. it doesn't explain the behavior of those commands on an already "warm" wireguard device (i.e. while the device is in up state).
> 
> M. Dietrich,
> 
> the add conf may work when adding a node, but I also need something when removing a node of the mesh.
> 
> two questions:
> 1. If initialize a wireguard device with a configuration file and then update the file will the configuration be updated?
> 2. if I run the set-conf command on an already initialized wiredguard device, will the configuration be updated without losing the current (and still existing after the new configuration) connections?
> 
> Thanks,
> Raffaele
> 
> Raffaele Spazzoli
> Senior Architect - OpenShift, Containers and PaaS Practice
> Tel: +1 216-258-7717
> 
> 
> 
> 
> On Sun, Feb 17, 2019 at 12:38 PM M. Dietrich <mdt@emdete.de> wrote:
> Quotation from Raffaele Spazzoli at Februar 17, 2019 16:21:
> > I'm using wireguard to build a VPN mesh. The nodes of the mesh are dynamic
> > and can come and go at any time. Is there a way to reconfigure a wireguard
> > device without restarting it or losing the current connections?
> 
> yes.
> 
> > If yes, how can it be done?
> 
> other way around: configure wireguard with the `wg` command
> and  that is persisted to the configuration file.
> 
> on restart the file is read and your config applied.
> 
> M. Dietrich
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

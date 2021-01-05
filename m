Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3462CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 20:21:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F49222D5A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 20:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F49222D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=osk.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d44ce1d;
	Tue, 5 Jan 2021 20:15:27 +0000 (UTC)
Received: from mail.osk.ch (dynamic.wline.6rd.res.cust.swisscom.ch
 [2a02:1205:5052:8220:20f:feff:fe92:5373])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1ce095d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 20:15:25 +0000 (UTC)
Received: from server.osk.ch (localhost [127.0.0.1])
 by mail.osk.ch (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 105KFOeE031324;
 Tue, 5 Jan 2021 21:15:24 +0100
Received: (from osk@localhost)
 by server.osk.ch (8.14.4/8.14.4/Submit) id 105KFOUD031323;
 Tue, 5 Jan 2021 21:15:24 +0100
X-Authentication-Warning: server.osk.ch: osk set sender to wg@osk.ch using -f
Date: Tue, 5 Jan 2021 21:15:24 +0100
From: Chris Osicki <wg@osk.ch>
To: Henning Reich <henning.reich@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WG default routing
Message-ID: <20210105201524.GB31054@server>
References: <20210103215441.GA24251@server>
 <CAOAVeL3EodpJ9YS5TsPgq0vPhCGX-W1eueASTV+SPZ9NJA0TKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOAVeL3EodpJ9YS5TsPgq0vPhCGX-W1eueASTV+SPZ9NJA0TKQ@mail.gmail.com>
X-message-flag: Using Microsoft software might be a security risk
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: inspected by milter-greylist-4.5.11 (mail.osk.ch [127.0.0.1]);
 Tue, 05 Jan 2021 21:15:24 +0100 (CET) for IP:'127.0.0.1'
 DOMAIN:'localhost' HELO:'server.osk.ch' FROM:'wg@osk.ch' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.11
 (mail.osk.ch [127.0.0.1]); Tue, 05 Jan 2021 21:15:24 +0100 (CET)
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

On Mon, Jan 04, 2021 at 02:38:23PM +0100, Henning Reich wrote:
> Hi,
> you can control the traffic is routed with the AllowedIPs option. If
> you use 0.0.0.0/0, all traffic is routed through the wireguard tunnel.
> If you just allow for example 10.10.10.10/32 only 10.10.10.10 is
> allowed. 10.10.0.0/16,192.168.1.0/24 will allow
> 10.10.0.0-10.10.254.254 and 192.168.1.0-192.168.1.254 and so on...
> 
> I use
> [Peer]
> PublicKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
> AllowedIPs = 172.16.16.0/24,10.10.0.0/16,10.0.0.0/16
> Endpoint = 123.123.123.123:12346
> PersistentKeepalive=30
> 
> Am Mo., 4. Jan. 2021 um 13:40 Uhr schrieb Chris Osicki <wg@osk.ch>:
> >
> > Hi
> >
> > I am quite new to wireguard, moving after years of OpenVPN, and found it simple and _really good_.
> > One thing, however, makes me wonder. Why WG tries always to take over all my routing?
> > My first try was with wg-quick, and noticed all my traffic went through the WG-VPN connection.
> > It escapes me why. What is the idea behind this policy?
> >
> > On my Linux boxes it's not a problem, I don't have to use wg-quick and with few lines of bash in a script I have what I need. I have root.
> > On my Android devices I don't have root, and I cannot change anything in routing etc.
> > Why don't you provide an option to specify which net to route which way?
> >
> > Regards,
> > Chris

Hi,

As I wrote in another mail, AllowedIPs config file option has nothing to do with routing, IMHO.
It looks just like a filter.

Regards,
Chris

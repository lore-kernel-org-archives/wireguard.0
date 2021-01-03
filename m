Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C335C433E9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:40:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77AF20770
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 12:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77AF20770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=osk.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87ee343b;
	Mon, 4 Jan 2021 12:28:35 +0000 (UTC)
Received: from mail.osk.ch (dynamic.wline.6rd.res.cust.swisscom.ch
 [2a02:1205:5052:8220:20f:feff:fe92:5373])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31d04856
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 19:48:59 +0000 (UTC)
Received: from server.osk.ch (localhost [127.0.0.1])
 by mail.osk.ch (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 103JxgoT024058
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 20:59:42 +0100
Received: (from osk@localhost)
 by server.osk.ch (8.14.4/8.14.4/Submit) id 103JxgcF024057
 for wireguard@lists.zx2c4.com; Sun, 3 Jan 2021 20:59:42 +0100
X-Authentication-Warning: server.osk.ch: osk set sender to wg@osk.ch using -f
Date: Sun, 3 Jan 2021 20:59:42 +0100
From: Chris Osicki <wg@osk.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
Message-ID: <20210103195942.GA23975@server>
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
X-message-flag: Using Microsoft software might be a security risk
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: inspected by milter-greylist-4.5.11 (mail.osk.ch [127.0.0.1]);
 Sun, 03 Jan 2021 20:59:42 +0100 (CET) for IP:'127.0.0.1'
 DOMAIN:'localhost' HELO:'server.osk.ch' FROM:'wg@osk.ch' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.11
 (mail.osk.ch [127.0.0.1]); Sun, 03 Jan 2021 20:59:42 +0100 (CET)
X-Mailman-Approved-At: Mon, 04 Jan 2021 13:28:34 +0100
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

On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
> Hi,
> 
> I was thinking recently that most people have switched from a model of
> updating the runtime configuration and then reading that back into a
> config file, to editing the config file and then syncing that with the
> runtime config. In other words, people have moved from doing:
> 
> # wg set wg0 peer ... allowed-ips ...
> # wg-quick save wg0
> 
> To doing:
> 
> # vim /etc/wireguard/wg0.conf
> # wg syncconf wg0 <(wg-quick strip wg0)
> 
> I think this is mostly a positive change too in terms of reliability.
> Reading back the runtime configuration was always a bit hit or miss,
> and I suspect that more times than not people have been confused by
> SaveConfig=true.
> 
> That raises the question: are there good uses left for SaveConfig=true
> and `wg-quick save` that warrant keeping the feature around?
> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
> that?
> 
> I haven't thought too deeply about this in order to be wedded to one
> outcome over the other yet, but seeing some confusion today, again, in
> #wireguard over the feature made me wonder.
> 
> Any opinions on this? Any one on this list actively use this feature
> and see replacements for it (e.g. syncconf) as clearly inferior?
> 
> Jason

Hi Jason

Being an old fashioned Unix admin, ~30 years spent in this job, I vote for the traditional way of doing it:
change the config file and let the application reread it.
I think the KISS principle is still valid ;-)

Thanks for the excellent software, Jason!

Regards,
Chris

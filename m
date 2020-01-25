Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649E9C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD35E206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jikken.de header.i=@jikken.de header.b="BWP+OpUn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD35E206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=jikken.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 559925d1;
	Thu, 30 Jan 2020 01:53:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ad3cae9
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 23:36:25 +0000 (UTC)
Received: from shinsetsu.jikken.de (shinsetsu.jikken.de [92.60.39.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61c84068
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 23:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
 s=Mv0BmWWr5KBeokdR; t=1579919296;
 bh=OmhBPXsDcoTljprxaMFVPil1C70etIB0TsfDigXUwEo=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=BWP+OpUnaLNNKyVvDyrtUwqnW79uLAwym2uYpbWC9BU7W3ye6ZybDJcz747hdeWAO
 lUSBiK2TWkTTm3WPB62OczDPF2A4j3LNWZgWFyTvZzU9Quu6J3YqREKg54xKRM1Rb8
 zpc8XYC8DrkKg8vUxbeJAgyTpRKPzyIsLVfsrKcE=
Date: Sat, 25 Jan 2020 03:28:14 +0100
From: Inrin <inrin@jikken.de>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard-hosts file
Message-ID: <20200125022814.wnoxrqymgf447ib2@nisshoku>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Maybe instead of an external file, why not add an option like Alias/Nick/Displayname/Peername?
This would have the benefit of keeping the public key in display.

For the get going you might use (GNU) sed or similar to achieve this feature.
Create a file peernames as follows:

   s|<BASE64>|my nice peername|
   s|<BASE64>|my other peername|

and pipe wg through sed:
   wg | sed -f peernames

Of course you can get more creative. Maybe keep the public key there.
I'm not sure how to keep the colouring though.

PS:
I'm not sure if BSDs or others SED support changing / in substitutions.

On Fri, Jan 24, 2020 at 05:01:49PM +0100, jens wrote:
>i really would love to have a feature like wireguard-hosts file.
>whereas wg command would print given "name" instead of key - so the
>output would be more meaningfull
>We have some wireguard running in server like infrastructure, where one
>server serves dozens of "clients"
>
>so instead of
>peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=
>we would have something alike
>peer: superhero downtown
>
>some of you may be familar with batman-adv layer2 routing protocol,
>there they also have a batctl which is working pretty similar to wg tool.
>there you can add a bat-hosts file which is doing the job, which totaly
>works likes any hosts file
>a normal hosts file maps ip to name,
>a bat-hosts file maps mac addresses to name,
>a wg-hosts file would map keys to name.
>
>i found the sources for bat-hosts ( .c .h .sample ) here
>https://downloads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz
>
>is this something maybe usefull to other also?
>is there a chance to have this implemented by default?
>
>thx for answers.
>fuzzle
>
>--
>make the world nicer, please use PGP encryption


>_______________________________________________
>WireGuard mailing list
>WireGuard@lists.zx2c4.com
>https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

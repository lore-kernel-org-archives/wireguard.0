Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898F1C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96C5216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=trivini.no header.i=@trivini.no header.b="fEc9kjbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96C5216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trivini.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84eca94d;
	Thu, 12 Nov 2020 23:31:43 +0000 (UTC)
Received: from redskapet.trivini.no (redskapet.trivini.no [2001:67c:29f4::51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2308be3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=trivini.no; 
 s=20190719;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ndHUbxNIxNJwngUdX+mzo76y0yw0nbO7ofGYw31Gddw=; b=fEc9kjbu3k/2yf9XF0Z1WiGoqn
 LhmztfDdpZhNz8nUEOapxl/MpAAuVAyOQ5xpRzAqUxPAp1z47ORzpTQmAaaeX7IsQQYsU3qr1f0xl
 Ciw2zCZaQdXGq/JlpH5dcM1VYYlsSIoWcyg+2b65TBhpep6CLU6G9cjtyBBdg6F5V3I0=;
Received: from berge by redskapet.trivini.no with local (Exim 4.92)
 (envelope-from <berge@trivini.no>) id 1kd8Vd-0002uV-9E
 for wireguard@lists.zx2c4.com; Thu, 12 Nov 2020 10:03:13 +0100
Date: Thu, 12 Nov 2020 10:03:13 +0100
From: Berge Schwebs =?utf-8?Q?Bj=C3=B8rlo?= <berge@trivini.no>
To: wireguard@lists.zx2c4.com
Subject: Re: Should we sunset Windows 7 support?
Message-ID: <20201112090313.GB3500@trivini.no>
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: berge@trivini.no
X-SA-Exim-Scanned: No (on redskapet.trivini.no);
 SAEximRunCond expanded to false
X-Mailman-Approved-At: Fri, 13 Nov 2020 00:31:41 +0100
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

On Thu, Nov 12, 2020 at 09:46:32AM +0100, Phillip McMahon wrote:
> Take a look here
> 
> https://gs.statcounter.com/os-version-market-share/windows/desktop/worldwide
> 
> Would seem to suggest Windows 7 is in decline but still represents
> around 25% of OS footprint out there.

I read 16% from that graph, but that's still considerable.

The Wikimedia stats might also provide some insight:

https://analytics.wikimedia.org/dashboards/browsers/#desktop-site-by-os/os-family-and-major-hierarchical-view

The last 30 days, 8.5% of the Wikimedia "desktop sites" (ie. not mobile)
visits were from Windows 7, which in turn is 12% of their Windows clients
visits.

I imagine Wikimedia stats are pretty geographically biased, since its by far
biggest chunks of content is in either English or other European languages.

Cheers,
-Berge

-- 
Berge Schwebs Bjørlo
Try SCE to AUX.

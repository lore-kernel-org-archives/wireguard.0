Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710A9C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:26:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7652820719
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="nZ6AinKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7652820719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 031f64ad;
	Mon, 3 Aug 2020 16:01:41 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84dffc2a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596471952;
 s=strato-dkim-0002; d=noddingdog.org;
 h=References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:Message-ID:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BJUSKBwqsuyCvPWjJUMOafvmSbmsYZLrf7veTiSmYIc=;
 b=nZ6AinKki31HO1VNd+VB7iKP4Ssiyq+qiuhhjr9Oo/4w1AWFW1FwK1k8/sefoZQoiB
 tc75h+06J89d34/ZTQYP4uDoouPRiJpf9GAwoG4RNoAnQ0efrfDtbuqzMt1ORiJe88zx
 5DNvqpShZgrfe/Ooo3uHyIqgSoHywBnPIkvnQpVWboyzndPmZH9ej9U7G+Vll5Y3ZG3m
 w83DPphm5G+zDqHn4xgtLETWfkgkNjNNimCrxUtO9kHc7R73WKj2Rz24E1m2y/oCb5cK
 P6UhIgjDFBpv/uhTIXbV9qwtyBRx4qsEb2B0lvu144cW1Mk7DcwSQofMazOsrly0X+4x
 +l1g==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC99TG/RqMbkejJUmYQ=="
X-RZG-CLASS-ID: mo00
Received: from WN-XPS13.fritz.box by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id q00567w73GPp7xt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 18:25:51 +0200 (CEST)
Message-ID: <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
From: NoddingDog <lists@noddingdog.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, unit193@ubuntu.com, apw@canonical.com
Date: Mon, 03 Aug 2020 18:25:51 +0200
In-Reply-To: <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Reply-To: lists@noddingdog.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I'm sure I did apt update after removing the PPA, but just checked
again:
 
apt update
apt install wireguard

Same result - those gke kernels are included as dependencies and "will
be installed".

Maybe Dell need to fix their bionic-oem repositories?


On Mon, 2020-08-03 at 18:21 +0200, Jason A. Donenfeld wrote:
> On Mon, Aug 3, 2020 at 6:15 PM NoddingDog <lists@noddingdog.org>
> wrote:
> > 
> > Hello,
> > 
> > I'd like to report a serious problem.
> > 
> > I have a Dell XPS13 with Dell's OEM version of Ubuntu 18.04
> > 
> > I had previously added the wireguard PPA and removed it as
> > mentioned
> > below.
> > 
> > Now, when running sudo apt install wireguard, the system wants to
> > install the following packages:
> > 
> > linux-image-5.3.0-1032-gke
> > linux-image-gke-5.3
> > wireguard-tools
> > 
> > These kernel images are **completely wrong** for the laptop (they
> > are
> > Google Container Engine kernel images). I didn't notice and borked
> > my
> > system by installing them. I had to load an old kernel and purge
> > them
> > before my system would work properly again.
> > 
> > Maybe this needs fixing before too many other folks have the same
> > problem.
> 
> Try running `apt update` first, and please let me know if that fixes
> the issue.
> 
> IIRC, Andy (CC'd as apw@) initially ported WireGuard to 18.04 with a
> package bug, which he later rectified.
> 
> Jason


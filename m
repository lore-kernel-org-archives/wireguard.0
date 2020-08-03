Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C50C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:44:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A62207DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="lo+ZJHC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A62207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7c00889;
	Mon, 3 Aug 2020 16:19:15 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ab8d033
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596473006;
 s=strato-dkim-0002; d=noddingdog.org;
 h=References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:Message-ID:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=AznMCH+8NMT+Z3tygFRbh+dUEc9VNZm5WIBeLg7PyEc=;
 b=lo+ZJHC6adUCEv3nXdmOE5S0F3Gn/AyuI3NdHtjG8C2IlahwDySCZxAWluz/wovHwL
 Bt+cKyWnAMdTZgcHYtXinmFfPXRULSBXHyWpXbpcQZDfoyAJeMtAIVYwmnbbKS1+J8EK
 OJjX/A0AXkPCZKzRbdoPEibdyWsrDvDieeun7DpVkGT3WkSkRsi+5BRcxLWZTkxLD9zq
 QXVr9KR9qF4XHXBA6iebir5EfR9YGzCuWxkIkYRXCXb6aM0x68EDe4KiTZN1Tsfqbdp7
 QydqfTIMOZ1skWdQyQCm8pf1CPN/l3n0+LmgO2aok/ALDQl9PuBGIHWzh1zOxCIUJXK5
 JFkA==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC99TG/RqMbkejJUmYQ=="
X-RZG-CLASS-ID: mo00
Received: from WN-XPS13.fritz.box by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id q00567w73GhQ8Dw
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 18:43:26 +0200 (CEST)
Message-ID: <2bf53aa68644d0595c76db514a5aca769a13f25f.camel@noddingdog.org>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
From: NoddingDog <lists@noddingdog.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Mon, 03 Aug 2020 18:43:26 +0200
In-Reply-To: <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
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

Good you've found the issue.

That'll teach me to be an early adopter... ;-)

On Mon, 2020-08-03 at 18:30 +0200, Jason A. Donenfeld wrote:
> On Mon, Aug 3, 2020 at 6:28 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
> > 
> > On Mon, Aug 3, 2020 at 6:25 PM NoddingDog <lists@noddingdog.org>
> > wrote:
> > > 
> > > I'm sure I did apt update after removing the PPA, but just
> > > checked
> > > again:
> > > 
> > > apt update
> > > apt install wireguard
> > > 
> > > Same result - those gke kernels are included as dependencies and
> > > "will
> > > be installed".
> > > 
> > > Maybe Dell need to fix their bionic-oem repositories?
> > 
> > Ooof, that sounds disastrous. Hopefully Andy is reading these
> > emails
> > and will fix this issue, but I'll poke him on IRC too.
> > 
> > Could you send me the URLs for the repos your laptop is using? I'd
> > like to double check the Release files on there. Perhaps just the
> > contents of /etc/apt or similar, and the name of the kernel package
> > your system uses?
> 
> Bingo:
> 
> zx2c4@bionicman:~$ apt-cache show linux-image-oem | grep Provides
> zx2c4@bionicman:~$ apt-cache show linux-image-generic | grep Provides
> Provides: wireguard-modules (= 1.0.20200611-1ubuntu1~18.04.1),
> zfs-modules (= 0.7.5-1ubuntu16.9)
> 
> Indeed looks like maybe this was left out of linux-image-oem? That's
> surprising, especially given the trials and tribulations we went
> through initially to get this deployed to Dell customers.


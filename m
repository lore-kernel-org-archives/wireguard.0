Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47982C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:46:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A650F20637
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 12:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=frign.de header.i=@frign.de header.b="sNAiQNeW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A650F20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frign.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4bad41d;
	Tue, 10 Nov 2020 12:42:48 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c4af04d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605012387;
 s=strato-dkim-0002; d=frign.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=7x9jKlwelUgNCmZLBa3uubcFgqNqPJ1Q7PfzhD8FRvc=;
 b=sNAiQNeWiUSin9UHJrFqgWPQz8/C9y5EGG8eWgtjn7vGwZmSNX8PSu4d8YsvNuGcWl
 MPZK2coZS+GNJh7tTV7I42FCwdhbpi4/HyAt7t0LfBqohRYpnEmHwLdQ3JFM3ourfJ5K
 qxnmfFjNYzCIbdSEZ1VStwIvesgNh3n46fXLYBy/vSTkXW3hskrOEnBroagKP49RAJxk
 C2f3MSLIya+qkXAjwZAV3gy2GbLJ/dVwjtxpqIPTYIiSl0YrRbGTtu74q3aQtjuHtwNQ
 ftYNawq9/1++UTJLNDjGR6tC04UVnUecxx6j+eFqKqbKYrrTmW7kIcYBE2Oo+7e5PoYO
 fucg==
X-RZG-AUTH: ":KGkSVUa6cvg6QHOypuT/F+/ElAlFppyfIncvHffsptN49ixn09bzt6FCBhBjl7Pt"
X-RZG-CLASS-ID: mo00
Received: from localhost by smtp.strato.de (RZmta 47.3.4 AUTH)
 with ESMTPSA id j0a302wAACkQ0XW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:46:26 +0100 (CET)
Date: Tue, 10 Nov 2020 13:47:43 +0100
From: Laslo Hunhold <dev@frign.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Should we sunset Windows 7 support?
Message-ID: <20201110134743.1615fcf4@frign.de>
In-Reply-To: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, 10 Nov 2020 13:27:20 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Dear Jason,

> Windows 7 has been EOL'd by Microsoft since January of this year. It
> is no longer receiving security updates or fixes. This email is to get
> the conversation started about doing the same with WireGuard for
> Windows.
> [...] Do we really want to keep maintaining gross stuff like this? It
> makes me uncomfortable to have kludges like that sitting around in
> the code. Shouldn't I write an auto-downloader that then checks
> hashes? Shouldn't I build this into the installer? Shouldn't I....
> waste tons of time supporting Windows 7 better?
> 
> Probably not.
> 
> But I know so many users are still using Windows 7. I'd like to hear
> from you to understand why, in order to assess when is the right
> moment to sunset our Windows 7 support.
> 
> So, if you care for Windows 7, please pipe up! We're not going to
> remove support for it overnight, and we're not prepared yet to
> announce any sort of formal deprecation plan, but the world is moving
> on at some point.

this is a really difficult judgement to make, which comes up every time
Microsoft EOLs an operating system, because it really often is still
heavily used.

My stance is that we as open source developers don't owe anybody
anything, and if Windows 7 users really care about WireGuard they can
create, share and maintain a patchset that implements the fixes
themselves. You shouldn't be the one paying the price (i.e. time spent)
because people insist on using an EOL'd operating system, which
presents a security issue in many other aspects as well. If they can't
do it themselves, they could pay somebody to deal with such a patchset,
or just keep running the last supported version of WireGuard.

In an utilitarian sense, because you're losing time over Windows 7
support, everyone else is negatively affected, because it's time you
could spend on aspects of WireGuard everyone benefits from, and not
only those running an EOL'd operating system.

To put it shortly, I'm completely in support of sunsetting Windows 7
support, or even just keeping the Windows-7-changes in the next release
for one last time and then immediately dropping them right afterwards
in the git-master. I'm not sure what you exactly mean with sunsetting,
which is why I've given the above "drastic" proposal in case sunsetting
means dealing with this nonsense for another year or something.

With best regards

Laslo Hunhold

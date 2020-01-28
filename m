Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20802C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 11:03:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5E524684
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 11:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uJ3+bAQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5E524684
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddda21dc;
	Tue, 28 Jan 2020 11:02:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b89b7f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 11:02:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd998bfb
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 11:02:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79209ac0;
 Tue, 28 Jan 2020 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=ybZpJvU7b0ONndAI95/gRx8MeS0=; b=uJ3+bAQ
 Iqhh6gAyHwh4Glkba9J1OHvfUatw0PuC6Uc14aj1S7UZfZ2jppUVLdsOikgNQm3G
 7Ig/G19H/ichyzzJxA0/JqXnr6h9S4FilrPYojYT+S7UG/T7cSZkpYi5WWCJiKtg
 JTtFi6xXFHbBCDO2dtsUrtxGdnmp2HJLRnUgL5FR4+IVXyYVvzOcowkFbLz8dB0q
 unEMMHsXUKWJhb7t/orZdc6ED2h26ICbZSs3T7+XXAYVrEIFDvL2jtZsMo+XXCN1
 eKKQqO6ebXJ4UNrJWWlcZjwc93FGj4TuPDHjycnGeJMNaPGJckxAEAIyULknEaeP
 zbXJcS/OKjWVzZw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4795e9ce
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Tue, 28 Jan 2020 10:00:52 +0000 (UTC)
Date: Tue, 28 Jan 2020 12:02:40 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Elliot Saba <staticfloat@gmail.com>
Subject: Re: Automatically updating windows client
Message-ID: <20200128110240.GA17569@zx2c4.com>
References: <CAGGi21Y2pMuHhhCGH10Y44fQKLgTi9pL7-y9Tw3KZm=5R8B9hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGGi21Y2pMuHhhCGH10Y44fQKLgTi9pL7-y9Tw3KZm=5R8B9hQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
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

On Wed, Jan 22, 2020 at 03:55:10PM -0800, Elliot Saba wrote:
> I have wireguard deployed on quite a few windows servers.  I like the
> auto-update functionality builtin to the GUI, but it's a little cumbersome
> to login with RDP and click through the menus to perform the auto-update;
> it would be much more convenient if I could use the WireGuard CLI interface
> to check and auto-update directly, or even if it automatically updated with
> no intervention on my part.  This way I can script it with scheduled tasks
> or similar.
> 
> What do you all think?

I'd be interested to see a powershell script posted to this list that
handles that. For help getting started, here's what the procedure looks
like with linux tools:

mkdir /tmp/winupdate && cd /tmp/winupdate
curl -A "MagicMailingListScript/0.1" -L -o latest.sig https://download.wireguard.com/windows-client/latest.sig
echo -e 'untrusted comment: key.pub\nRWRNqGKtBXftKTKPpBPGDMe8jHLnFQ0EdRy8Wg0apV6vTDFLAODD83G4' > key.pub
signify -V -e -p key.pub -m latest || exit 1
ARCH=amd64 #TODO: grab from system type
while read -r hash msi; do [[ $msi =~ wireguard-$ARCH-([0-9.]+)\.msi ]] && break; done < latest
[[ -n ${BASH_REMATCH[0]} ]] || exit 0
CURRENT_VERSION=0.0.36 #TODO: grab from msi database
[[ $(printf '%s\n%s\n' "${BASH_REMATCH[1]}" "$CURRENT_VERSION" | sort -V -r | head -n 1) == "${BASH_REMATCH[1]}" ]] || exit 1
curl -A "MagicMailingListScript/0.1" -L -o "$msi" "https://download.wireguard.com/windows-client/$msi"
echo "$hash $msi" | b2sum -c || exit 1
msiexec.exe /qb!- /i $msi
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

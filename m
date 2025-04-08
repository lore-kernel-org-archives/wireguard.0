Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2A3C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1f7866f;
	Tue, 20 May 2025 19:44:04 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [2001:41d0:e:133a::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fb1e3a70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Apr 2025 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nwl.cc;
 s=mail2022; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iia0kfPBUQvS+5Z+gyHC8leiNmcwWDWI9SmtMPwlMLU=; b=QNXQ0E3KZhGYZpSEi7Vp2+VFBH
 AZRmRUlgotcH7pD7JGQG+xZHUrwfHQxfb+3JQkOt5CQr4QMBRTg4IiFK9+JsYe1ni9Y6ZfmLAD2Ls
 DGf5HbKBU0nmIbfvNIv9ldgNKXUeYOE0pCS4Ml9nAxQJF7x6TwSTExb5Sb4nepdAeJqQCVKRXQ9FW
 h2tVJvq6eo/skMkmt4rqpUcUnWTjd3rulLSAJLw308ZSxuyg84tqV9ZSVwEfMWl6X7wk9MsET78fi
 AbkrHuob8Is6vvbjHhi58Nd5w/fRz6Y71C7UHf1ELDClQfD9SfTnnJjqu3Bi41GDzRgpBqyw4Oo8a
 EhfVQshQ==;
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.97.1)
 (envelope-from <phil@nwl.cc>) id 1u26oa-000000005gr-03JS;
 Tue, 08 Apr 2025 13:08:24 +0200
Date: Tue, 8 Apr 2025 13:08:23 +0200
From: Phil Sutter <phil@nwl.cc>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 net-next 1/2] wireguard: selftests: convert iptables to
 nft
Message-ID: <Z_UDpyCvF_5kPdU7@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>,
 Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250408081652.1330-1-liuhangbin@gmail.com>
 <20250408081652.1330-2-liuhangbin@gmail.com>
 <Z_Tul3J4zLoNAkaF@orbyte.nwl.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Tul3J4zLoNAkaF@orbyte.nwl.cc>
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

On Tue, Apr 08, 2025 at 11:38:31AM +0200, Phil Sutter wrote:
> On Tue, Apr 08, 2025 at 08:16:51AM +0000, Hangbin Liu wrote:
> > Convert the selftest to nft as it is the replacement for iptables, which
> > is used by default in most releases.
> > 
> > Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> 
> What are the changes since v5, please?

Ah, nevermind - I missed the cover letter somehow.

Sorry for the noise!

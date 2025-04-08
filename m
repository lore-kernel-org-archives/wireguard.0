Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC69C54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f43c1fc;
	Tue, 20 May 2025 19:44:01 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [2001:41d0:e:133a::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a066d2b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Apr 2025 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nwl.cc;
 s=mail2022; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rwcIEfW9pJzdJoVCY6Sgo1trCmLuEW39Q/YDwIuECgI=; b=kibcLGqS4fCDjtX3aCt1TKqQaf
 3XAbVshHzHEUwJhHCVoqRkeoF5CH4PXIe+SY/sEe0TWH4sItMiMeOOwY8WMtXW4GxT4eNo+rIfYVn
 NUPniy4Jx8oAFGDDJIf6/pavA5lkrMPLuNPOp24yYWVeat0nC17Ev1L6kOUih12S6eO/uSVTl16P9
 yjDPmpBW4to8fKaUOqRLhPbPm8uEF4azPTbOevG7+ebKX/SsTqGWIDgo6xMkKOYujrDS5osOivw1i
 XOmkpI4TU2lNq/o5/m8IRxC/Hoheb6aN9SeiHAtyDMuoD5XGWnhW4xq3GR9awG7ng5lepYPmyV0bZ
 rt5m/0eg==;
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.97.1)
 (envelope-from <phil@nwl.cc>) id 1u25Pb-000000003jC-3mSr;
 Tue, 08 Apr 2025 11:38:31 +0200
Date: Tue, 8 Apr 2025 11:38:31 +0200
From: Phil Sutter <phil@nwl.cc>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 net-next 1/2] wireguard: selftests: convert iptables to
 nft
Message-ID: <Z_Tul3J4zLoNAkaF@orbyte.nwl.cc>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408081652.1330-2-liuhangbin@gmail.com>
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

Hi,

On Tue, Apr 08, 2025 at 08:16:51AM +0000, Hangbin Liu wrote:
> Convert the selftest to nft as it is the replacement for iptables, which
> is used by default in most releases.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>

What are the changes since v5, please?

Thanks, Phil

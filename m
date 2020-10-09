Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539EDC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:05:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD64022261
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD64022261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aea7c7e6;
	Fri, 9 Oct 2020 13:32:17 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4d2a210
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:32:13 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 5E7798F5;
 Fri,  9 Oct 2020 14:05:05 +0000 (UTC)
Date: Fri, 9 Oct 2020 19:05:05 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Rudi C <rudiwillalwaysloveyou@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
Message-ID: <20201009190505.18391a7d@natsu>
In-Reply-To: <CAE9z9A3wG8e8djm7Og=+y7QBW6oqunM1Ln+DKHLA5isyWS-88w@mail.gmail.com>
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
 <CAE9z9A2kWvroWG7v4iAxnVKxs8ev1eB28E+gMKdyXKBUM5Osdw@mail.gmail.com>
 <20201009183446.06f7fe0a@natsu>
 <CAE9z9A3wG8e8djm7Og=+y7QBW6oqunM1Ln+DKHLA5isyWS-88w@mail.gmail.com>
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

On Fri, 9 Oct 2020 17:16:18 +0330
Rudi C <rudiwillalwaysloveyou@gmail.com> wrote:

> > On Fri, Oct 9, 2020 at 5:04 PM Roman Mamedov <rm@romanrm.net> wrote:
> > Seems like you misunderstand what I mean. If you use the in-VPN (internal) IP
> > of your VPS, all communication with the SOCKS proxy installed on the VPS will
> > happen via the WireGuard tunnel. No DPI can look into that.
> 
> You're right! Some questions:
> 1. What should I do client-side so that wireguard only covers my VPS's
> IP (and does not otherwise route traffic)? Will `AllowedIPs =
> SERVER_IP/32` do it?

SERVER_IP should be the in-VPN IP here, otherwise yes, and remove .0.0.0/0
and ::/0 from AllowedIPs.

> 2. How do I get the in-VPN IP of the server? Is it `Address` in `[Interface]`?

Yes. You can confirm via "ip addr list dev wgX" on the server.

> 3. I use ufw for the firewall on the server. Will ufw block my local
> machine? If not, with what IP should I set ufw rules? (My local
> machine doesn't have a static IP.) Of course, I could alternatively
> expose the socks proxy to the world with a password; How secure will
> that be?

Sorry, not familiar with ufw; generally you need to allow only connections
from the WG interface, or from the internal IP range (or just the "Address ="
of the client), and block all others.

-- 
With respect,
Roman

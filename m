Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1A9C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:22:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D335D2158C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D335D2158C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1759cb10;
	Fri, 9 Oct 2020 12:49:27 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0da64ea2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 12:49:23 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 9E1E08F5;
 Fri,  9 Oct 2020 13:22:14 +0000 (UTC)
Date: Fri, 9 Oct 2020 18:22:14 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Rudi C <rudiwillalwaysloveyou@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
Message-ID: <20201009182214.0169140f@natsu>
In-Reply-To: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
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

On Sun, 4 Oct 2020 15:41:52 +0330
Rudi C <rudiwillalwaysloveyou@gmail.com> wrote:

> I use Wireguard to circumvent Iran's censorship. A major problem with
> it is that it's very hard to selectively proxy specific domains/apps
> through Wireguard, while leaving others alone. This is an essential
> feature for Iran's internet, as:
> 1. The connection is terrible, so avoiding using the proxy for
> uncensored sites helps a lot.
> 2. International traffic is 2x more expensive, so avoiding the proxy
> for internal traffic is very beneficial.
> 3. Some internal sites ban international IPs and need Iranian IPs.
> 
> The easiest way to solve this program, as far as I understand, is to
> add the ability to expose the tunnel as a socks5 proxy on the client
> side. This is the approach that shadowsocks, v2ray, etc have adopted.
> There are mature solutions to selectively routing traffic through a
> socks proxy.
> 
> I searched around, and there are docker containers that already do
> this wireguard-to-socks thing; But running docker is expensive on a
> non-Linux machine, so it'd be much appreciated if you could support
> exposing socks and HTTP proxy servers natively.

If you tunnel to a VPS abroad, just install a SOCKS proxy on the remote end.
A good one is [1]. Then set the remote end's in-VPN IP and proxy port in your
apps to use.

[1] https://socks-relay.sourceforge.io/

To separate which sites use which proxy (or no proxy) SwitchSharp for Chrome
and FoxyProxy for Firefox, but you probably already know about those.

In case you meant connecting to commercial "VPN" services, then yes it
becomes a bit more complex, but you can try srelay on the local machine and
use the "-J" option, "outbound interface name". But I'm not sure if that would
just work on its own, or also needs some help from ip(6)tables or ip-rule.

-- 
With respect,
Roman

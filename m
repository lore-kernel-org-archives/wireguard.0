Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03D5C00319
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:59:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCE22086A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="TVIU2bLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBCE22086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06cc4b6e;
	Thu, 21 Feb 2019 07:51:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e71b4a6
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 07:50:59 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [IPv6:2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1169d9e
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=9aTWUvQ5HNOtAYXEQJ6U07RdsX/8mbyHdjmJoJz0n3s=; b=TVIU2bLDMsvnG1I2ft0pw3Mge5
 aqIJYAUYfwbi7dCpodG0EqbWorgIC17jcxwmTIj+XXc5mhRU5cdLCoFAUr3Qa1zFPA7Qhk/aA7zj1
 mthE+LOFusXtjT4Q4zlYLJiZoELe0DnlLc0I1GacJ15QS9Xuv7BMpZUKAFFkvoWMOZLpDpLQQFfQe
 xuPE+3rd8hbA4RTRBv2pLMaO/25GX2c+Oms3zHX2N0sjn38cuLZ8rwYQauRPEd4Zp156u/Nb+BEpd
 eMIn/YMbcsa+HZAVRu8LXnk9GyLZoGUR0mzJjrjUGRBDq/1PxqCaTpXfmpdB+bpAuQfr0u2O8EJSQ
 8Qnh82Pm6OY8f2w8JdaTf5NnWM/CLqngGPOltm1SYmrnyg+tUTaG3lqnkIa0aO9epatZPVh3QCRDS
 mN1+UnApqcUcF5c/Ff8Ex+NqZJNcCukJs60c+ILLvhjr50m9OdPFRAZhQYVeJ7rpsWQLnFWI1432z
 niWNmmLECstwSAOwYxbhHz9zobKQDja4qoliL9qwIZO0+VCiXLmhAg9CR0mq0q7NG9XVVXsBIYQuA
 jdrjWo46P2Fh49l2v9J5mY3GRwzJ/eMeGQPCvBenbpbHeZ5K2Sx4zyxnAAjZ5DK4zJdGNKhzGGPKJ
 HvRmlvcr6TDDWtqpGigsmtyEcRMuQgyNGrcppaCFs=;
Received: from [2001:780:107:2:5::] by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1gwjGc-000GZt-QQ
 for wireguard@lists.zx2c4.com; Thu, 21 Feb 2019 08:59:39 +0100
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
 <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
 <dda16c02-171c-6b44-8258-fda8d65d0543@urlichs.de>
 <ce051517-9325-824c-3299-ba08138e7912@ironai.com>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ed8879bd-4a2e-662a-b908-6b31354e64c2@urlichs.de>
Date: Thu, 21 Feb 2019 08:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <ce051517-9325-824c-3299-ba08138e7912@ironai.com>
Content-Language: en-US
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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
Content-Type: multipart/mixed; boundary="===============1860586497871468053=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============1860586497871468053==
Content-Type: multipart/alternative;
 boundary="------------8DD70D81B17802AF90EA8630"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8DD70D81B17802AF90EA8630
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 19.02.19 16:45, Vincent Wiemann wrote:
> A kernel VPN module should not depend
> on a user space daemon for doing regular checks or a daemon running at
> all.

It doesn't. You only need userspace when the external IP address changes
*and* the other side either doesn't initiate a link to us, or can no
longer reach us due to firewall or NAT issues. This is already orders of
magnitude better than OpenVPN.

DNS is a complex protocol that's nontrivial to implement securely,
DNSSEC even more so. You do not want that in the kernel. I'd wager a
large chunk of money that neither does Linus Torvalds.

>     One could build up on
>     https://www.kernel.org/doc/Documentation/networking/dns_resolver.txt ,
>     but it's a lot of work and shouldn't be a goal before WireGuard becomes
>     an upstream kernel module.

    I'm pretty sure that's the way to go long-term.

Umm … you might want to read that. It specifies upcalling to userspace.
How is that better than running a WG daemon?

We'd also lose flexibility. I might want to teach that WG daemon to get
the new address from somewhere else, like a secure connection to a VPN
server (given that DNS timeouts might be too long), or to use that
netlink callback to trigger an alert or to activate a fallback connection.

-- 
-- Matthias Urlichs


--------------8DD70D81B17802AF90EA8630
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 19.02.19 16:45, Vincent Wiemann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ce051517-9325-824c-3299-ba08138e7912@ironai.com">
      <pre class="moz-quote-pre" wrap="">A kernel VPN module should not depend
on a user space daemon for doing regular checks or a daemon running at
all.</pre>
    </blockquote>
    <p>It doesn't. You only need userspace when the external IP address
      changes *and* the other side either doesn't initiate a link to us,
      or can no longer reach us due to firewall or NAT issues. This is
      already orders of magnitude better than OpenVPN.<br>
    </p>
    <p>DNS is a complex protocol that's nontrivial to implement
      securely, DNSSEC even more so. You do not want that in the kernel.
      I'd wager a large chunk of money that neither does Linus Torvalds.<br>
    </p>
    <blockquote>
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">One could build up on
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/Documentation/networking/dns_resolver.txt">https://www.kernel.org/doc/Documentation/networking/dns_resolver.txt</a> ,
but it's a lot of work and shouldn't be a goal before WireGuard becomes
an upstream kernel module.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I'm pretty sure that's the way to go long-term.
</pre>
    </blockquote>
    <p>Umm … you might want to read that. It specifies upcalling to
      userspace. How is that better than running a WG daemon?</p>
    <p>We'd also lose flexibility. I might want to teach that WG daemon
      to get the new address from somewhere else, like a secure
      connection to a VPN server (given that DNS timeouts might be too
      long), or to use that netlink callback to trigger an alert or to
      activate a fallback connection.<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
-- Matthias Urlichs</pre>
  </body>
</html>

--------------8DD70D81B17802AF90EA8630--

--===============1860586497871468053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1860586497871468053==--

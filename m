Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6A3C388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 01:26:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD9522254
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 01:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=molgaard.org header.i=@molgaard.org header.b="FmV/G0Zs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD9522254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=molgaard.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26aef7ab;
	Fri, 20 Nov 2020 01:21:15 +0000 (UTC)
Received: from mail3.molgaard.org (mail3.molgaard.org [2a01:4f8:c2c:dd63::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f3d3981e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 01:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.molgaard.org (Postfix) with ESMTP id C34523EE27
 for <wireguard@lists.zx2c4.com>; Fri, 20 Nov 2020 02:26:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail3.molgaard.org
Received: from mail3.molgaard.org ([127.0.0.1])
 by localhost (mail3.molgaard.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNzKakqKDhVX for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 02:26:05 +0100 (CET)
Received: from [192.168.1.2] (3e6b00d8.rev.stofanet.dk [62.107.0.216])
 by mail3.molgaard.org (Postfix) with ESMTPSA id A93D53EA8C
 for <wireguard@lists.zx2c4.com>; Fri, 20 Nov 2020 02:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=molgaard.org; s=mail;
 t=1605835565; bh=MIq9nga15HmXxecuImsYo0QKTXu50+/lp9HeOFj++uA=;
 h=To:From:Subject:Date:From;
 b=FmV/G0ZsuRonRFrP1vkDsHfCL6Pw9orqHyR/o5Y//mVxgob3J3M37E6szhp8A73HS
 WzceHykymY9AZmtLgl2Gvmu6njNZbNbLcGfTaNLg+KWLcyQu98FvF9Li+ui0H6Tay6
 GOpvHzfsuGSxq2KchmqC965HOuGA+arOIgwEMt1xFI7gl4VQ8+j9T7qn4SBrW68lyY
 lXdBoHnZdOYpXTkElzxBrnR4iVTtDkePgO3xlBwLI8oPjJWTTNWq4xJUEndYf/07Qn
 B1RRn7TwC+brQ5g5P5u4s7GEM3qrbV5sFR+PzMfRtq0TXjQF9HqbHghwf0/Elr3JAZ
 ikB9PiD5/qweQ==
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Sune_M=c3=b8lgaard?= <sune@molgaard.org>
Subject: MacOS DNS Search Domain
Message-ID: <d1e3a201-8fcd-3448-f958-5fd4518f0101@molgaard.org>
Date: Fri, 20 Nov 2020 02:26:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

Hi all,

Being in the process of deploying, and being very happy with both
answers to questions, and, generally, performance, ease of
administration etc., I seem to be facing a slight problem.

Using wg-quick, via SystemD, on Linux, I can have multiple, in my case
two, "DNS =" entries in my client config, one with an IP address of the
DNS server to utilise, and the second with a domain name, to be applied
as the "DNS Search Domain".

This works as expected.

Under MacOS, using the GUI client from the app store, "DNS =" entries
with domain names are not accepted (is this a bug or expected
behaviour?), but I have found suggestions to issue `networksetup
-setsearchdomain XX YOUR-SEARCH.DOMAIN`
(https://www.reddit.com/r/WireGuard/comments/dlh65m/resolving_search_domains_on_a_mac/).

Substituting the correct entries for XX and YOUR-SEARCH.DOMAIN with
correct values work, inasmuch as `networksetup -getsearchdomain XX`
indicates that the correct DNS Search Domain is set correctly for the
interface, but it does not, however, seem to work IRL, meaning that
requests to a mere hostname, as opposed to an FQDN, within the search
domain result in lookup failures.

First of all, I would like to know if anyone knows how to make DNS
Search Domain work in conjunction with MacOS.

Secondly, I would like to pose the question of whether there is a bug,
code- or documentation-wise regarding how to make it work, and, thirdly,
I would like to ask if the official, MacOS, GUI client could,
conceivably, be made to accept "DNS =" entries with domain names, making
them work like wg-quick on Linux, meaning setting those entries as DNS
Search Domains.

Best regards,

Sune Mølgaard

-- 
How many observe Christ's birthday! How few, his precepts! O! 'tis
easier to keep holidays than commandments.
- Benjamin Franklin

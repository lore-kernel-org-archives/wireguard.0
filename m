Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3A6C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 01:19:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE5A2245C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 01:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE5A2245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f16dc33b;
	Thu, 6 Aug 2020 00:54:24 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64703fc7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Aug 2020 00:54:15 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000042AC8.000000005F2B5A4D.000022C9; Wed, 05 Aug 2020 18:18:03 -0700
Subject: Re: wg-lla
To: wireguard@lists.zx2c4.com
References: <CAMaqUZ2UxEC+Fz4a=dp7R=6Ca=+TRH_u1cqhEEH0q1PA6hLvBg@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <2e14d61e-07ac-ac6c-d6a0-30aa250abae4@pallas.us>
Date: Wed, 5 Aug 2020 18:17:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMaqUZ2UxEC+Fz4a=dp7R=6Ca=+TRH_u1cqhEEH0q1PA6hLvBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Thanks for updating!

FYI, I just added this LLA algorithm to the PublicKey class in [1] with 
three caveats:

  * it allows for injection into an arbitrary IPv6 or IPv4 address space 
(default is the LLA/10 that wg-lla uses)
  * it fails if the generated address is the network address or 
broadcast address of the provided address space
  * it allows for an optional blake2b key, to mix the addresses if 
desired (default is no secret, which produces the same addresses as wg-lla)

~Derrick

[1] https://github.com/ArgosyLabs/wgnlpy/


On 8/1/20 9:31 PM, Reid Rankin wrote:
> A while ago, I included a link to a Gist containing `wg-lla.sh`, a
> utility for calculating and assigning IPv6 Link-Local Addresses to
> WireGuard peers based on a hash of their public key, which was based
> on a shell-script implementation of Blake2s. At the time it was
> intended as a proof-of-concept sort of thing, but I've had some
> interested parties contact me about using it -- since I neglected to
> stick on a license.
> 
> So I've rectified that error, and promoted it to a proper repo. Now
> people can hopefully find it, as well as raise issues and make PRs.
> Hope it's useful!
> 
> https://github.com/reidrankin/wg-lla
> 
> --Reid
> 

Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C2C64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39FB221FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D39FB221FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=astro.ucla.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98b02255;
	Wed, 2 Dec 2020 13:31:52 +0000 (UTC)
Received: from smtp.pa.ucla.edu (smtp.pa.ucla.edu [169.232.151.248])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d5f45c8
 for <wireguard@lists.zx2c4.com>; Tue, 1 Dec 2020 19:33:33 +0000 (UTC)
Received: from plutonium.local (cpe-172-117-222-85.socal.res.rr.com
 [172.117.222.85]) (Authenticated sender: johnsonc@astro.ucla.edu)
 by smtp.pa.ucla.edu (Postfix) with ESMTPSA id 6245623B98;
 Tue,  1 Dec 2020 11:23:48 -0800 (PST)
Subject: Re: MacOS: DNS setting has no effect if the tunnel is not the default
 gw
To: wireguard@lists.zx2c4.com
References: <9f61c27c-3cae-3283-30e0-ce99fe73a305@al2klimov.de>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
From: Chris Johnson <johnsonc@astro.ucla.edu>
Message-ID: <1d429a71-415e-2623-e0b5-34cca394ae9c@astro.ucla.edu>
Date: Tue, 1 Dec 2020 11:39:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9f61c27c-3cae-3283-30e0-ce99fe73a305@al2klimov.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Dec 2020 14:31:49 +0100
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

I am now running into this problem. I'm still running Mojave (10.14.6), 
if that makes any difference.

If AllowedIPs is everything, then /etc/resolv.conf is modified with the 
remote DNS server.
If AllowedIPs is a remote private network(s), then /etc/resolv.conf 
remains untouched, and DNS is local ISP.

Did you ever find a solution or workaround? I do not want all of my 
traffic to go through this tunnel, but I *do* want DNS to resolve for 
those private subnet hosts.

Cheers,

Chris

On 2020/10/31 07:38, Alexander A. Klimov wrote:
> Hello there!
> 
> I have two almost identical tunnels. The only difference:
> 
> -AllowedIPs=0.0.0.0/0, ::/0
> +AllowedIPs=192.168.234.153/32, 64:ff9b::192.168.234.153/128, 
> 192.168.234.186/32, 64:ff9b::192.168.234.186/128
> 
> The first one's setting DNS=192.168.234.153 has an effect, the second 
> one's not.
> 
> Has anyone seen this problem, too?
> Does anyone even know how to workaround it?
> 
> Best,
> AK

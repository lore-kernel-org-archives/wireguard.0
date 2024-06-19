Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9491AC27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jun 2024 10:24:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e86a49d0;
	Wed, 19 Jun 2024 10:18:00 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a7f80249
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2024 10:17:58 +0000 (UTC)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
 by wilbur.contactoffice.com (Postfix) with ESMTP id EE51EE05;
 Wed, 19 Jun 2024 12:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718792277; 
 s=20220809-q8oc; d=unstable.cc; i=a@unstable.cc;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=NgS3Q7kEJ56vMRuFu200i+eUCpmc7AxvRD+L0/JlFgU=;
 b=WpEpb2kJWhXIe2FOFd3Ppe78QRz4IyQ+wwqV4unRMqSFPPa2VZl5VH283FK6IsjN
 MMuKXAqu/5yWs/LnALcn/+HQS4ORYsfcdJkLAbn34VQwnm7z8a1+SaqZyy3l0Crp8Uy
 ky7vZxmKcwJmX1c3XYLMPx+C8ItKNtJhnhA7UOQVdueXWebRPnxFfHf1D6IkQww2sKi
 v+ZvR90+Deytq3abS6lkxUa3iy0qYhA4PnB9IEV8Mr3wf83w58sV1tgxaD4q358LlGN
 dLe8C7yaIBt175ptbSuWR6RFA+yDl+ProBHbzPC0kbrKxvTRkcz8Mom1abeDHkv3jzr
 8XK+TejbGg==
Received: by smtp.mailfence.com with ESMTPSA ;
 Wed, 19 Jun 2024 12:17:54 +0200 (CEST)
Message-ID: <bf5d4e97-806b-4c30-a7b2-554b74b3a51b@unstable.cc>
Date: Wed, 19 Jun 2024 12:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wireguard broken with ip rule due to missing address binding
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <87h6dpi7zp.fsf@ungleich.ch>
 <9e91adb2-b155-4eef-8604-a2f762a98d4d@unstable.cc>
 <87cyodi6la.fsf@ungleich.ch>
Content-Language: en-US
From: Antonio Quartulli <a@unstable.cc>
In-Reply-To: <87cyodi6la.fsf@ungleich.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:375058688
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

Hi Nico,

On 19/06/2024 12:12, Nico Schottelius wrote:
> However it does not fix the issue of selecting the right ip address on
> systems with multiple IP addresses ("Originating / initial ip address
> wrong").

you're right.
I looked at this from a pure "server" perspective, where you always wait 
for somebody else to originate the connection.

Regards,

-- 
Antonio Quartulli

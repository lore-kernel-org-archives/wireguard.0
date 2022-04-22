Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 06:17:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 63b528a7;
	Fri, 22 Apr 2022 06:17:11 +0000 (UTC)
Received: from m204-227.eu.mailgun.net (m204-227.eu.mailgun.net
 [161.38.204.227])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 08de4867
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 06:17:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=oern.de; q=dns/txt;
 s=mta; 
 t=1650608229; h=Content-Transfer-Encoding: Content-Type: In-Reply-To:
 From: From: References: To: To: Subject: Subject: MIME-Version: Date:
 Message-ID: Sender: Sender;
 bh=mvkqCDsAX3eQRcj55fCilevfK55JPQtBne5ptyMTmUc=;
 b=riVce0rh5nt3auRI5+WZf4tvs4NfzZGQba7cLDoC2YWiPTjtE6gxbDXOR6tAeJuEAxi6n1FF
 CURRA62gqUtT8D/HQ/mMso1fYovU0Yna15DRsDPFxAbe4K+OMQklRRfDhmrk/uWNfhOGGESy
 B2pYF1kn6AEnluhfEojIjo8XrZDt5UKPlLiNE5Na6Np+ds434ze+ohUIO50HWbXKNELz8PRm
 v8H5kRzlKVtww3Zpcc33sPmNkBvU0v9AT0eGoj1hCwueMuhl0mrlJKabCkH0j51V208i1Are
 WIF+Nrp5O1RBAe344++YOxViWf7UbiidH2IV/AbBW6syw2E2b/PODg==
X-Mailgun-Sending-Ip: 161.38.204.227
X-Mailgun-Sid: WyI5YWZmYiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgImUwNzRkIl0=
Received: from mail.7lb.de (mail.7lb.de [2.56.212.54]) by
 smtp-out-n03.prod.eu-central-1.postgun.com with SMTP id
 626248647e6ccf794350b21d (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 22 Apr 2022 06:17:08 GMT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E658480F9D
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 08:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oern.de; s=laniv9ai;
 t=1650608225; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mvkqCDsAX3eQRcj55fCilevfK55JPQtBne5ptyMTmUc=;
 b=IQYeAP5/f2sQxMxtVpZ+ROqHBKPJVo1u7u7UTgmxoPRTLiJe2smOR8VFgmHyJgbnd7be/P
 nsSzJ3MAD7zV/GbzC0Psuk+cCI7u586blSg1n/RsGz2dv0paE9ndij+5Mis+/spOxyp/ZY
 n7AYB0XQ1gZCWlw1K10UMWKSK0fglpg=
Message-ID: <fd11943c-99e1-d0a0-b28b-de7d5c617eb3@oern.de>
Date: Fri, 22 Apr 2022 08:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
From: =?UTF-8?Q?Bj=c3=b6rn_Fries?= <ml-wireguard@oern.de>
In-Reply-To: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

Am 18.04.22 um 04:12 schrieb Nohk Two:
> This 
> server allows the clients to access my LAN (e.g. 192.168.87.0/24) and 
[..]
> But when the phones connect to the Wi-Fi of my home's router, the DHCP 
> assigns the IP addresses as 192.168.87.0/24, it's my LAN, to the phones. 
[...]
> Or do you have better ideas ?

the way I solve this is that I use a slightly larger /23-subnet in the
AllowedIPs=192.168.87.0/23

and when I get a local IP inside 192.168.87.0/24 at home, the kernel 
automatically uses the more specific route.

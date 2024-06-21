Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D73FC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 10:39:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b37daec;
	Fri, 21 Jun 2024 10:39:23 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1ebd12f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 10:39:19 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f700e4cb92so16728065ad.2
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718966357; x=1719571157; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aoRYaAoBbOCfun8nR8wpgPv5npmOmw40V42NrQAtVs8=;
 b=cZhMu5/58IWEGjUnnVQonQH+mNGOjaRLJm6QqIFZqgbU/VENW3nuTrAI1mlidfN5PT
 DWF6XdHNEvA2cprNaGwhyLI1YyO2uAGtNjAdSzRca1QHpqq6NBY/wGMWeq52ecKknBSE
 VOrSblIebqVCHlOyt837mUDYCJGLcgQKKYpNFOZxVsYtl6g+8NLany/jXRCy8etK/Km9
 AT5B24DHEDEbWa8W6auC+oSsgCsxdSuLNAoOPDXnlZBJL7rkibcoNbMlE7CQjvEr2zuQ
 lknNtkWhsjhc1xbzEtKTDZo0vTVd9KCejTOG+zOzGCXOrC75rJvHaYGOBcvdTFu+3jbM
 TAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718966357; x=1719571157;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoRYaAoBbOCfun8nR8wpgPv5npmOmw40V42NrQAtVs8=;
 b=FbpMfr3vOBmuQjCxxwqqtYRat/kSueSragDvxYR2cHR/FFkTGqS4MzZi9lPBcZEXDE
 nLEGM7zA2AK+uBqgubnIpcjvx4O9EG6BL27x3pVTWPmSnx1N96wM9y5RbUqWGNjBL5Ot
 Z/PvFjLJHFUM0Y7V7uqJgIT3fxQXQAD0lr3lKTIuBbKWzRe9AtNreLCKPhmoFKORMkx5
 YDKFQD0F0eaisoP+SMy/sCS0VDGsdZfXyXs7f83WuiRkUQqGz1neoI9SeDWXxzu9LSox
 152E5v2RJg9MfLhPzQIcHhwfsGo5lkkuDl3ZyMI2bNhS0R+p/8mmVUDmZbYGcTFGeIKW
 QYvg==
X-Gm-Message-State: AOJu0YwQOtxuZPQOoopIeaCndmlaevaxusxdHnqY8bC1WD++f8oE1MBm
 G8uK/+lbBtRB+FqlWZCUibYmUnXUGDctPpJMDe8qSqq+krs5xB6i15BKPg==
X-Google-Smtp-Source: AGHT+IEWCSvISScLZO343/jj0bFUeYFql2mmE6oHLQaX73GVqUTiPND9oltcziXmKh6hQ2h/7w6XNw==
X-Received: by 2002:a17:902:ec88:b0:1f9:d6cc:e504 with SMTP id
 d9443c01a7336-1f9d6cce83amr40671565ad.24.1718966357150; 
 Fri, 21 Jun 2024 03:39:17 -0700 (PDT)
Received: from 1-169-135-157.dynamic-ip.hinet.net
 (1-169-135-157.dynamic-ip.hinet.net. [1.169.135.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f03desm11210875ad.1.2024.06.21.03.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 03:39:16 -0700 (PDT)
Received: from [192.168.50.10] (blum-vo.family.era [192.168.50.10])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.family.era (Postfix) with ESMTPSA id 70C591406BF;
 Fri, 21 Jun 2024 18:39:14 +0800 (CST)
Message-ID: <1f7f4177-86b1-4a33-876b-06bf4e4f1cbd@gmail.com>
Date: Fri, 21 Jun 2024 18:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to detect the IP CAM on LAN from WG tunnel ?
To: Mark Lawrence <mark@rekudos.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <384d1fdd-a32f-4839-bb8b-2761be363b50@gmail.com>
 <ZnVFefPIvg5DFNnl@d.rekudos.net>
From: Nohk Two <nohktwo@gmail.com>
Autocrypt: addr=nohktwo@gmail.com; keydata=
 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
In-Reply-To: <ZnVFefPIvg5DFNnl@d.rekudos.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2024/6/21 17:18, Mark Lawrence wrote:
>> How do you solve this problem ?
> 
> Iterative fact checking, from the lowest levels of the network stack to the highest.
> 
>      - Are the devices actually connected where you think they are?
>          - With the tunnel disconnected, does your phone connect to the           camera?
I use wireguard VPN while my phone is using mobile data (4G LTE). With the tunnel disconnected my phone can't connect to the camera since it scanned and cannot find the camera.

>      - Is your Wireguard tunnel set up properly?
>          - Can your phone ping the wg0 address with the tunnel active?
>          - Can your phone ping other .100 devices with the tunnel           active?
I don't know how to ping from my phone. But the phone, with the wireguard tunnel connected, can visit my LAN website which is in the network 192.168.100.0/24.

>      - Does your eth0/wg0 machine have IP forwarding enabled?
>          - sysctl net.ipv4.ip_forward=1
Yes.
$ sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 1

>      - What does packet tracing show?
>          - I.e. `ngrep -d wg0 .\* icmp` or the tcpdump equivalent, also           against eth0 for the wireguard UDP port.
I use `ngrep -d wg0 .\* icmp`, but nothing dump. However while I open my phone's browser to visit my LAN site, it did dump something.

>      - Does the mobile App actually support remote (routed) cameras or       just on the local network?
> 
This is the point I said in my original mail that I think my phone and the camera are in different networks. I believe this App is for LAN network.

For this scenario, are there solutions ?

Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5781DC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4761221A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pcfreak.de header.i=@pcfreak.de header.b="YynmODoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4761221A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pcfreak.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3b41ad5;
	Sun, 17 Feb 2019 01:11:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b99047f7
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 11:45:27 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2d33d6e
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 11:45:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v13so26992836wrw.5
 for <wireguard@lists.zx2c4.com>; Tue, 22 Jan 2019 03:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pcfreak.de; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=Y3kz22bi/XCP+dBvyMDfNOGt/3Ag5msk0E8tljuhiC8=;
 b=YynmODoErsdZYQgVeuxktLIdTa8Cbq1jBrPRQXSvVtTsRPFlMiycJMoj1VWFZMcnwo
 MWaAb+rVRGmgd8OvBe+MGCaD4meRobkjKU5g4h1HpacO89kdRZcNAtopv7jr4m77tVq4
 3ykqUVcplWOn3F/VMzEry7u66KYM5L7KlyXWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=Y3kz22bi/XCP+dBvyMDfNOGt/3Ag5msk0E8tljuhiC8=;
 b=hdUY3j+5byj5w4xG4trHzrK90GH5zInrEl6dqKJXgPJmc40eIljidgm62xBRsHsRwS
 E5hVIJGFDt4gqaB1ulZgAiQQR/NsN32toi3I6qYnbhtVAQDSVZFrJKudhYi82OXdWZlI
 uq3md9VINQxCYsnznBgFkkFhoUAFd85lbU9QEPdOQ16ZQ1BAsQwYhOfJftNDmtCx/eRY
 x7DFbjJnzkyTaPEGGUjGzvVVhvvlCjlKHKp2NtJz1h3W+iWDeNK2K6i/a0w4UHU2BB9N
 fyYCemFmu0um3fmMEJ35quoG+I76e+ZfBGZxv+ceqNzEk2TXXSgIKdljlDdqAMo2E7gq
 NGYA==
X-Gm-Message-State: AJcUukcNfBfN4M90KyjC+oYKkUKVRuwqtZ1lpkHVVfnynOmhAvuMLuj9
 khnu3AnH/Ftp1cSavv6g6rs2lYM/moc=
X-Google-Smtp-Source: ALg8bN7dTDdqR6dPRw6dBMWHnZKAP+GMJeYZfyl5KaptHzAK9wC4pJ05QpQSDPmpR/HPtjflMnThxw==
X-Received: by 2002:adf:b595:: with SMTP id c21mr31250928wre.125.1548157820652; 
 Tue, 22 Jan 2019 03:50:20 -0800 (PST)
Received: from [10.110.180.53] (inetpop1.witron.de. [195.243.201.20])
 by smtp.googlemail.com with ESMTPSA id
 u204sm85340758wmu.30.2019.01.22.03.50.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jan 2019 03:50:20 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: Der PCFreak <mailinglists@pcfreak.de>
Subject: Peer names in configuration file possible?
Message-ID: <ba2eee20-4dcd-2601-ffb7-bd1915230b0e@pcfreak.de>
Date: Tue, 22 Jan 2019 12:50:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: de-DE
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:11:47 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

this is my first post to this list, so hopefully I don't get anything 
wrong. Excuse me if so.

I don't know if this has ever been mentioned but I am asking myself how 
should I keep track of let's say 1000 Peers in the configuration file of 
a WireGuard server when the config file just shows me the public key of 
the peers to identify them?

Would it be possible to add something like 'identifier' which might or 
might not be unique:

Sample '/etc/wireguard/wg0-server.conf'

[Interface]
...
...

[Peer]
identifier=computer01
...
...

[Peer]
identifier=computer02
...
...

For example the command 'wg show wg0-server dump' could then maybe show 
the 'identifier' as column to make things easier?

I am thinking of possibly replacing/migrating a large OpenVPN server 
instance to WireGuard and I am currently thinking about the management of
the peers which on OpenVPN I do do with username/password + OTP. Just 
the public key in the config is not enough in my opinion, a descriptive 
field should be possible.

Also I assume when 'SaveConfig = true' is set in the servers 
configuration file any saves to the file currently remove manually added 
comments so doing it with comments is not a good option.

Regards

Peter aka PCFreak



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

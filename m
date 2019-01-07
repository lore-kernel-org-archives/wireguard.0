Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030C3C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:25:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888822089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL6uZMCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888822089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b6d5685;
	Tue, 8 Jan 2019 02:21:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fb6d6b3
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jan 2019 06:06:49 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa11d952
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jan 2019 06:06:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g67so6300384wmd.2
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jan 2019 22:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=ss7PmjaGGeLtCrt00XW+tHYSOJM+bTAP4ojVincZFrE=;
 b=RL6uZMCoy2K5ykSeF5lRfHR5JucSKOoe3BNjKlIztc0Aav788Vu+KjMicD6keLBRUV
 wl+ag2x1mBRoEZIiThNPQrR+w2LQqLLXZrqyhHoMFxdJCQCcyP6z19mgFBexiQ7QgQeJ
 evoxKrqeohtMwMvO7ADuJFkbvYtraPaT89gRTB9see4wyCPRonso0bhuWW4/2RkDFw/h
 plHeOnVZzfmi3/BmHUy3rOJcFFwIRYLDIv3/T0E21GL9FAIu0zIfnmN2suDtsceCDkUt
 BFilFepPf0sfQ/YdwdJY5qMeDSsCtJVJpPgOEYCDHljNyrTE2/mWvXibhqL5er+S4qBy
 gOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=ss7PmjaGGeLtCrt00XW+tHYSOJM+bTAP4ojVincZFrE=;
 b=Wknud5iIQVdmd69tLVgecq58a3bgJzlKXasMIfIaA/IJmbb9NgL7JIEAa9htpGd3Me
 AfnZ7AXvO3jnn05VqfqLpEsbKk6msQbimAFlwBMc5ATIwPu8bByJuzihu3ifDcGKPVlr
 zTmTDq+eIeKNhkOBikbqo1vJaDKwAGFwkfd4V1PAGckWFoT5uhQwNBiL9YFO6eLA3xSp
 mUvF/gFhx4KigbYMjZhimE9sUeLC5A7t/MOjouXM2Opvef5y9YfhWNPVtdermv58Y+lH
 CLRmhqdlAvA1ADLU6tLSd0VeBLIzs4bnrsmOiLtTxBdpiHT54UQ3YQEuxcKERvDdlxfp
 4ziQ==
X-Gm-Message-State: AJcUukeBOMLNdkhJoE1DTfKFD/r5YSIl99C2P5t7klMvEj5N/NIJdvTt
 VN0iwsTpIUqQyP6WxPSVSKQliIga
X-Google-Smtp-Source: ALg8bN4cbS936SHOV0PUiJWLFt19Z/7mAkXYDIh5SngVSmhss+gVDSBZdaxkhul3kNCNBYVAKaOfmg==
X-Received: by 2002:a1c:8acf:: with SMTP id m198mr8250970wmd.143.1546841385815; 
 Sun, 06 Jan 2019 22:09:45 -0800 (PST)
Received: from [192.168.1.15] (static.108.234.213.82.ibercom.com.
 [82.213.234.108])
 by smtp.gmail.com with ESMTPSA id a6sm5959240wmh.10.2019.01.06.22.09.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Jan 2019 22:09:45 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Mario_Garc=c3=ada?= <mariogdlt@gmail.com>
Subject: DNS tunneling only
Message-ID: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
Date: Mon, 7 Jan 2019 07:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: es-ES
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:21:54 +0100
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


Is it possible to tunnel DNS requests only from the client to the 
wireguard server?

There are a lot of OpenVPN projects that use this feature to have a 
"clean internet" without ads in the devices (android, pc,...) like DNS66 
app.

I use a OpenVPN server in a free tier Google Cloud VPN but it is laggy 
and a battery killer so I would like to move to wireguard instead of IPSec.


Thanks in advance

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

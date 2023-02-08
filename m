Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97150C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 06:30:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aff78b67;
	Wed, 8 Feb 2023 06:30:28 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4b727be
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 06:30:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p9so2730240ejj.1
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=za5/mK2R9sVRog8rSWauZWIHIMmJ4pHlct8YMpK9zVM=;
 b=GHt0stW951p8Mf1zB8Ofp6D4H0J89Bbcg2LqKCPmpVYqog+qx6qfeKXMooFdZKHABW
 ElVCP/fbGJ8MqjNGEk3NINu9m75C4nprqi6sAzVWIW1DdAkmnZJ6eAiZETp53ucOAo+M
 rLB6dkVL8GEChVZzvRIiLgK38wthLuwqYY/q9SI4Eg/xguRdE30o8vxZG4o3sBmWROQd
 Y+2gXriWRpZyyfi1zSDET7PAruk8dJAbtinKT5SRG/08EmMoPEMkFOat69u9W/TzQTFt
 8PZDZh0c4pz+eKNc/hLch+IjYMXx9BNSjy14m3Ec1x45PdYHgfa8PA7pAEHsqTBVsiwl
 ZXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=za5/mK2R9sVRog8rSWauZWIHIMmJ4pHlct8YMpK9zVM=;
 b=ycQl/zonNSw7L1k/9DovPMfTrP/D1LFk7WG5raSmgHkTbli9eba/Y/ZUJUN77sDKCm
 X7RMRaDpq8VOHDUTx8ClOQaqP+j87e7baC7l3nO1p/2lZY0zWcX2qlEUjJytEdV6zwOO
 vh2rwYWbg+bEdbkGvEoou3LwCEmLBAwKH8CECLA4jJdj2R22Hw1cIS2BHYWDKxYm7hR7
 a/F5fhCbaGXlDuBwXaAVF+y457dmdkjeaMX4Wwz92kPx9nJYl13oEM80Lgh3eV+PFcuk
 ow5muFXKwB5iQBBPTj0vpogsfGq6Pn2CgvQ4CjXzSWv7v/biTq2ED56gu3m6PYOz/q8R
 +cdg==
X-Gm-Message-State: AO0yUKWVV8K91SRh2FIBq2zoo/Itzq0IYUNwuN3NfOY93Mj+2DBmv2tI
 ABwyrvU/s6do8tErSBhYYZZBgLADIIRvxZU4
X-Google-Smtp-Source: AK7set+YkCIbm1Db5xfcONGppPJlmefTCJ1GDTrrR3FtQxsNeQIATwWMkSZCtqWMzBD9uCM5N86y/w==
X-Received: by 2002:a17:906:2b0e:b0:7d3:c516:6ef4 with SMTP id
 a14-20020a1709062b0e00b007d3c5166ef4mr7139871ejg.20.1675837826226; 
 Tue, 07 Feb 2023 22:30:26 -0800 (PST)
Received: from localhost ([45.9.46.147]) by smtp.gmail.com with ESMTPSA id
 ot17-20020a170906ccd100b0088272bac7c5sm7802428ejb.121.2023.02.07.22.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 22:30:25 -0800 (PST)
Message-ID: <2166b145-1508-b407-da27-93393989d209@gmail.com>
Date: Wed, 8 Feb 2023 09:30:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] wg: Fix show all endpoints output
Content-Language: ru, en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <11c3d877-2d92-8593-0a9f-e2c918a791c3@gmail.com>
 <CAHmME9o-TTYatnRfPGOviU4++T-yxLzNN+tytTs+oZBT7qF_nQ@mail.gmail.com>
From: Dmitry Selivanov <dseliv@gmail.com>
In-Reply-To: <CAHmME9o-TTYatnRfPGOviU4++T-yxLzNN+tytTs+oZBT7qF_nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Currently "wg show all endpoints" prints interface name only once
while other "show all" commands print it on each line as man says.

Signed-off-by: Dmitry Selivanov <dseliv@gmail.com>
---
 src/show.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/show.c b/src/show.c
index 3fd3d9e..13777cf 100644
--- a/src/show.c
+++ b/src/show.c
@@ -312,9 +312,9 @@ static bool ugly_print(struct wgdevice *device, const char *param, bool with_int
 		else
 			printf("off\n");
 	} else if (!strcmp(param, "endpoints")) {
-		if (with_interface)
-			printf("%s\t", device->name);
 		for_each_wgpeer(device, peer) {
+			if (with_interface)
+				printf("%s\t", device->name);
 			printf("%s\t", key(peer->public_key));
 			if (peer->endpoint.addr.sa_family == AF_INET || peer->endpoint.addr.sa_family == AF_INET6)
 				printf("%s\n", endpoint(&peer->endpoint.addr));
-- 
2.30.2

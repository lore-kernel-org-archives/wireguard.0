Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C56C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b5b3a2;
	Tue, 7 Feb 2023 04:29:48 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d8918bf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Jan 2023 08:47:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bk15so24043234ejb.9
 for <wireguard@lists.zx2c4.com>; Sun, 29 Jan 2023 00:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/vpICy22Nw9BufwdXouLEuwNCouOEKcWOvbPIbM61A0=;
 b=iMelO1SvK89l2/dG8XhOK/imc9hzKJqTGvBDMUb2Ww1Ax68F8/90fWnBLwXq91I5Jh
 otILCyZIUjt/gWdsgUF8i/TzToGQ2Ho55M8t7NKEnPZmbk0SWtDWGUZsBeRQMVLIDdyn
 MRAnNqljQU4JAeb9kHZAaA/SbCsbOw6Z9I5hN+QAUkRZoBMxRCNnPAPoQvGMWMRZAnA9
 DIcWomeji/ih7aLPEX3oPDbz0rFVHobSGMu6EyrAReefazMNMVzQphIbo1bIiaku+V4k
 fGkRB3WCveSJ2YRs/e4bm4X6KtoMtZ42FBjJyVdnGWgiabdF9gqeesW5oHpaPZ0TP5Uv
 vrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/vpICy22Nw9BufwdXouLEuwNCouOEKcWOvbPIbM61A0=;
 b=vlOaUiyyUiCqQXen8PbibG2HLXRseWtaZHwD1f9Nnt70bFxy9aQv4Tp0AQgj/6QnF8
 aTXAWyrRNCl/KJerT+OSWBwcZPQJ5ZG4feSZC5ukD5iHKGYHu1nHLcuVsX6Oz18jVsUc
 lKH7bgnmvpYoe3uAK9f9eRgXJ/iRakFKdIXyEtylCnCUQVjNdr9gLiFcEgIA4czZy+YR
 d0tSXG2kuLth8VWqz5ahcgV5tRlEuNKqkoKJiR7WuLKgUWmu8lruLzmEpNpJ31Xsc+D7
 oLigveVUXLwmi8/xvjlCUaSSM1lfJWuWkC7x6DvSMzVJIXy3IeKTv/Q3WdLWKA1vHlxB
 B6gQ==
X-Gm-Message-State: AFqh2kqHppN0Uq6xwFZWGL6m4JmBAuvLL4rQIpTTr1no3RSBCN6z+i+5
 HrlmsW1fITZJ9m8Gr47UcDv9DpuuuDs=
X-Google-Smtp-Source: AMrXdXtZBRrlp8YAw3ESur+gv2cXVjb+h49dbE2BY3uZtZntjHs2X9myg92sXLNDhsvfLaqmfFlKNg==
X-Received: by 2002:a17:907:c618:b0:868:b2b6:ee71 with SMTP id
 ud24-20020a170907c61800b00868b2b6ee71mr47299758ejc.6.1674982042110; 
 Sun, 29 Jan 2023 00:47:22 -0800 (PST)
Received: from localhost ([45.9.46.147]) by smtp.gmail.com with ESMTPSA id
 ss2-20020a170907c00200b0084d381d0528sm4964711ejc.180.2023.01.29.00.47.21
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 00:47:21 -0800 (PST)
Message-ID: <11c3d877-2d92-8593-0a9f-e2c918a791c3@gmail.com>
Date: Sun, 29 Jan 2023 11:46:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Dmitry Selivanov <dseliv@gmail.com>
Subject: [PATCH] wg: Fix show all endpoints output
To: wireguard@lists.zx2c4.com
Content-Language: ru, en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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


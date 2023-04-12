Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71763C7618E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:14:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30b66584;
	Sat, 22 Apr 2023 11:14:33 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3350d90a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Apr 2023 12:39:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id xi5so28455711ejb.13
 for <wireguard@lists.zx2c4.com>; Wed, 12 Apr 2023 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1681303168; x=1683895168;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXTLEzpHfbOKryrtmH5cPvKRUcr+pR3BU5nZjDRi1qI=;
 b=YPbBWPIYg6y0hTbpyRGBLEoIKAWgF4RKGNnH5uwQn32/Wc3P6wEWG5AkZleBzETq/8
 pFKwwj/4f2DOMY+04sntVANUtJpwXDS0p+ZHXRGGYM+4W0qkIZDRtFYXNo5ZV7qHsI8e
 UJh5aXkUhBFUGyQfNY7yfQQiYTaC50xzlpZ5fcobYJG6Wzp93Kle2ErtqaU7KeS5SjoT
 pZwS3HQCALdHlpAy41iuzXlk6Zf8naHq05Uh/1t/ARcv6lqysEMR8XPqhOP3B9ODECIF
 Se8OUYoFB7DtNnUMySkWTlcYfQocHH/d0jFPu4j953Z4NR/oV9OLRHlRdybOt9OS7sR2
 ajPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303168; x=1683895168;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXTLEzpHfbOKryrtmH5cPvKRUcr+pR3BU5nZjDRi1qI=;
 b=awU2AD5LmOhyy/J5nRKk7rcIQlbdzKnUp1OqAW2pj3l6gRqnO0aYZquZREp3h1C77A
 1O5RKgOg1Sgrt0lm4yb9u7vv98qNu9HFlRW+/HtBaSUWdIxQY71OiNJW1ExlW6JR3l+t
 pjMWFhv4QieG8jPGKBv8PV30nmCEWNO8RHwtRBIJX3YDg3VIAHaSI9uKOaVM0fOPikjL
 2ZIRtC52gWS/pQ3/9QIc8Ho2YgDci6LCqfziNkuJYORvjlUm3VGLf7AAgrrtUUc4t2Qa
 2jzSLMCAg7fcp3M3MPO4eGvv6fYBUOX0CG4PqknTR6eyKyic5DjS1DxgrY36bZdIDvjR
 lZ1w==
X-Gm-Message-State: AAQBX9efEuBTawGfn0crWj84yyxIx7UEPPiiqpJp3mJHruZ2ilFjWuyb
 NqxasqBn6NtVBRZcFn2bs1q3BmVCTna80AYqZBDTq3eDe3xAXw==
X-Google-Smtp-Source: AKy350Z6vVRcU9lUI0SkaLr+vDTAuo2dRRVTjndPGfkyew0+dtCl/QGBoENsv5Q1YKrXKNm4tQOrBiQd6nszMiXlcXk=
X-Received: by 2002:a17:906:6a22:b0:932:1bdf:be3e with SMTP id
 qw34-20020a1709066a2200b009321bdfbe3emr1192540ejc.0.1681303168271; Wed, 12
 Apr 2023 05:39:28 -0700 (PDT)
MIME-Version: 1.0
From: Anton <jnashicq@googlemail.com>
Date: Wed, 12 Apr 2023 16:39:00 +0400
Message-ID: <CAG_zMNJto2a5Et3-8MDLuDUon1W=Y4_em8vtP3vzg6Okb+uJ+A@mail.gmail.com>
Subject: Wireguard-go on Android 11+
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 22 Apr 2023 11:14:31 +0000
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

I'm porting a Golang-based program [1] to Android11+ (API level 30)
and I've faced a problem,as the getifaddrs function is not available
for apps and other restrictions.

From Android developer documentation [2]:
>
> In addition, non-privileged apps can't access the device's MAC address; o=
nly network interfaces with an IP address are visible. This impacts the get=
ifaddrs() and   NetworkInterface.getHardwareAddress() methods, as well as s=
ending RTM_GETLINK Netlink messages.
>   The following is a list of the ways that apps are affected by this chan=
ge:
>   NetworkInterface.getHardwareAddress() returns null for every interface.
>   Apps cannot use the bind() function on NETLINK_ROUTE sockets.
>   The ip command does not return information about interfaces.
>   Apps cannot send RTM_GETLINK messages.
>

I came up with a workaround [3], and now my app works OK.

External references:
https://github.com/mysteriumnetwork/node
https://developer.android.com/training/articles/user-data-ids#mac-11-plus
https://github.com/mysteriumnetwork/wireguard-go/pull/5/files

--
best regards,
  Anton

Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13970C55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C862064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=xored-com.20150623.gappssmtp.com header.i=@xored-com.20150623.gappssmtp.com header.b="wsT9ezil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C862064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xored.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7422b83;
	Tue, 10 Nov 2020 12:59:01 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7033b84
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Nov 2020 04:25:53 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 2so17494415ljj.13
 for <wireguard@lists.zx2c4.com>; Mon, 02 Nov 2020 20:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xored-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=9WUt0b7+Sm0dtYWZyjjIOXK2bX1RULcpS0uDwG1hVTI=;
 b=wsT9eziljmHGCc+S+vQtqh3DYyBEkymxwefWd5zQMwd01rEUS0plrjNFj39dkJRQ+v
 GCMz9ekRG3f4Z/wBK0WyOJzp0wq8eCgBoz9mv31LmmWrzdJmgxieGtaNtS3Ycnd0To9R
 F4GLKeRuauKPdYboFFDnzo9LP7jktJH+BwwbZCc0M7oZL4D3pNkTtPfCqUWeZipm/CKn
 +3hpYGdXmrTitzFlNKo5f49Aiv2Zzv7rGj/Bn+MBwjhTKVlmcA5wGK50kBMoZf6QOqDq
 CZ9A2nRq4pTTWZPUHhxNWq8AS8Kw0umIcZY/am/uVIzeDIvd6vK+kpswmErtQioEDVlH
 8lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=9WUt0b7+Sm0dtYWZyjjIOXK2bX1RULcpS0uDwG1hVTI=;
 b=kvB6b/Zzs7FMnl572mKP1dPfOoOI6NkXoFTyObWjFBelc5eibpE33tuy2jc1aag95V
 kUySf4acijVF05xsemFcSHvWyW2ZwCuQgohl7spL+tJZ5wxX3gyOcoCJVcmVp0NBGN09
 DHRKvwaLIwnHfaY6G1zTo5aT7811/e4bfx1TXPjc4NeeH4KePk5Q6RfO+DlwZKdWjrnV
 d+e8D+cXZBpNtC+3ZRnUXlWO6x9+parQu88ID9XK5hJdAyMqXh7vMOQ4sh0oONuz7d1I
 mntFeD8ODo51v8RfKx7iz7mazGQ6QHoBTKiKBnFd5b9KuDUZSIRB5ZuN0WIqWzCkkamZ
 qG/A==
X-Gm-Message-State: AOAM533MJBFyWTBMwVR4EohNUtIZasN1LNKd2TVxTMFyulM5c7bTnIP2
 6vXfmp7X6GMEUs0eu7P9rCfaY0tOWnWTQw==
X-Google-Smtp-Source: ABdhPJzu2tpZ844FtA3Nmz36S3bOlSnzEW/Uh+0w3RF52rlO1Rv0H4yq4zKcG+X+8KrmRoTqymSBXw==
X-Received: by 2002:a2e:87d2:: with SMTP id v18mr7395663ljj.371.1604377717020; 
 Mon, 02 Nov 2020 20:28:37 -0800 (PST)
Received: from [192.168.1.108] ([212.164.64.8])
 by smtp.gmail.com with ESMTPSA id j2sm3174255lfe.23.2020.11.02.20.28.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 20:28:36 -0800 (PST)
From: Denis Tingajkin <denis.tingajkin@xored.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Wireguard-go: How fast wireguard-go devices startup?
Message-Id: <A8D281C9-DC58-407F-9A10-8EB8BBD9F2CA@xored.com>
Date: Tue, 3 Nov 2020 11:28:35 +0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Hello,=20

During testing wireguard-go device between two k8s clusters, we found =
that sometimes devices could long start (~30 sec) (we expected < ~15s)=20=

Question: Do you have any benchmarks on the startup of wireguard device? =
(if yes, what is the duration expected?)=20


Logs:=20

DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
decryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
encryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
decryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
encryption worker - started
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
handshake worker - started
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
decryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
decryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
encryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
handshake worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: TUN =
reader - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
handshake worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
encryption worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
event worker - started=20
INFO: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Interface set =
up=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
handshake worker - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
receive incoming IPv6 - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
receive incoming IPv4 - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 UDP bind has =
been updated=20
INFO: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Interface set =
down=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Received =
message with unknown type=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
receive incoming IPv6 - stopped=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:42 Routine: =
receive incoming IPv4 - stopped=20
INFO: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:43 Interface set =
up
 DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:43 Routine: =
receive incoming IPv6 - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:43 Routine: =
receive incoming IPv4 - started=20
DEBUG: Wireguard Device (nsmuXYqpJH5I): 2020/09/30 07:22:43 UDP bind has =
been updated=20
<---sleep here=E2=80=94>=20
Time=3D"2020-09-30T07:23:02Z" level=3Dinfo msg=3D">><<-- =
GRPC->/forwarder.Forwarder/Request()=3D\"\" =
span=3D43fba74bac35dba6:2e78b16ec532cd52:551cd27633276554:1"=

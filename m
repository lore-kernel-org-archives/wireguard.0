Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEEFC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAD020989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIHPH8O4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAD020989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56bc0a6a;
	Thu, 6 Dec 2018 23:05:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d641a903
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Nov 2018 09:04:09 +0000 (UTC)
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebd8e5f5
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Nov 2018 09:04:08 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id g27so12483638oth.6
 for <wireguard@lists.zx2c4.com>; Sat, 24 Nov 2018 01:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ccxqC8suQZfYEjRq47mX35Cz2ZHlH+FN9W+pcrzbPWA=;
 b=tIHPH8O4vVh4YdxIVHIFszl9KM90cRL2Qwihj6sfqx62Yr9bnvglz/N5DzuM5MiPoz
 DIDEqpCaIJwz79VJI1FMx9PFLlbtFG83y0OSRnurXybLMP6klrPXxuafblbW9Tuzx5nC
 UPWJiV6FgAQahTXORjb7IcRvWuPT6grDcPUlDx6B0XwpqLDoT7+ll8coAzCHW7UBRUz8
 hmaY5PdMpyeGTL/3VnGGuVgVMfD3AtbQ7dqRuttgoTrSVIDUyqZOMTevB8NFmZVnc+lH
 VqtZZF45Vsu2r/LTZ/LA/2oJWmgCN2IZU7qAh7dO3ozmByLvlSD+3zabCp2ZP7zIdBeD
 TwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ccxqC8suQZfYEjRq47mX35Cz2ZHlH+FN9W+pcrzbPWA=;
 b=FZAndQmHkAswEqvLrebGw8xFm3GIieDFH3TK1JxIVRleZDwdK5Yi1mM8qX6aQUyoou
 oeKXMwlFbQ+dBCJXJuICRVUTBAqlmWDkOXKZzIvHMWeoLtSqs+qRpbfcHlWegEh53Edr
 MAgoCpccOta70rBPDQOxXiTXfc8CD24NyUF3uhjPNAsr38wuAz1pbFtIVbHe2eIBtjKA
 kBqMtm2Ul//C7yj5QF58zpkW3hOlSbzzWGHtAvWeR9m6+bFHMLVN5VKtEA8NCJdHQaUi
 VOrV8Dm18jafnS4hqBMlEj72tI7UE9gcwQQ/zQfRS1qfs1VRc7MucVqM1foUriAUX9Fr
 UZbg==
X-Gm-Message-State: AA+aEWaWGBkqTGM7qC5wNJYSJ89wLlDRfUn6nIdH7dyyT/jbHPZjcjUi
 XwXs9A+Cd+76m9RR6QmlmeuuzUd/5r5TdY4QtIFl1G2H
X-Google-Smtp-Source: AFSGD/UjSlcWj92H4sDuzM+estIEmxTDAeEFA9RO34+0B6ySnVAowCCWmqzt94aDbWiqMGtOwuB5U3gnXpA6rbJjKmI=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr10005339otp.86.1543050644245; 
 Sat, 24 Nov 2018 01:10:44 -0800 (PST)
MIME-Version: 1.0
From: Jaseem Abid <jaseemabid@gmail.com>
Date: Sat, 24 Nov 2018 09:10:08 +0000
Message-ID: <CAH-tXsAsoyn+ye8cyC5Y5RGKBoExLGGY6NFKpG8GSGpHtkdDmw@mail.gmail.com>
Subject: Minor differences in config parsing, wg-quick and Android
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:18 +0100
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
Content-Type: multipart/mixed; boundary="===============6114697436049989672=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6114697436049989672==
Content-Type: multipart/alternative; boundary="0000000000008551d9057b65792b"

--0000000000008551d9057b65792b
Content-Type: text/plain; charset="UTF-8"

Hello list,

I noticed that the config keys like Endpoint, AllowedIPS etc are case
insensitive in the C implementation because of strncasecmp but it's not the
case with the android app. The keys are silently ignored while the
configuration is imported in android while it works as expected with
wg-quick.

Is this intended behaviour? If not, which behaviour is preferred?

-- 
Regards,

Jaseem Abid
https://twitter.com/jaseemabid

--0000000000008551d9057b65792b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello list, <br></div><div><br></div=
><div>I noticed that the config keys like Endpoint, AllowedIPS etc are case=
 insensitive in the C implementation because of strncasecmp but it&#39;s no=
t the case with the android app. The keys are silently ignored while the co=
nfiguration is imported in android while it works as expected with wg-quick=
. <br></div><div><br></div><div>Is this intended behaviour? If not, which b=
ehaviour is preferred? <br></div><div><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Regards, <br><br>Jaseem Abid<br><a href=3D"https://twitter=
.com/jaseemabid" target=3D"_blank">https://twitter.com/jaseemabid</a><br></=
div></div></div></div>

--0000000000008551d9057b65792b--

--===============6114697436049989672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6114697436049989672==--

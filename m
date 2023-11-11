Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C1C5AE5B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:45:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85276655;
	Sun, 19 Nov 2023 13:34:47 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 169140d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2023 11:03:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50970c2115eso3853567e87.1
 for <wireguard@lists.zx2c4.com>; Sat, 11 Nov 2023 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699700635; x=1700305435; darn=lists.zx2c4.com;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PfbRirZh7sz0ZjjlYqSB2GodiSK3hGl0+j4vvlG1nzQ=;
 b=CFIoAkjN+57uL3vfMjhZ98/ZPCSsxbygfoD/O66TBkA5Qt31V2/zsy7Jv5k/d1Q+th
 Z4RZYddcXz1sQNxBXsUasu7c8PgHN/vZHO1jjjbEp4E036xbhGDrWQ/kjTq1zm3xSpRT
 wZUO88XM0xoaMb/3tEqlMqkCZGMO3DWlq0b2lqS+PnBfy9vgxycTro/OEYvkKIEF/csq
 c2dsilfDR+rl8do7GwVW/F93ek7M2Tht48VL3UQWsZU8ji5lT3x4wCGHicRq1dhWkD70
 8egqoUa7vQ3LzauwVQk5hORcnl4rl0xMMh1apkn2MqKsa9s6khD2pdSSN7P6mL/F8F99
 qTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699700635; x=1700305435;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfbRirZh7sz0ZjjlYqSB2GodiSK3hGl0+j4vvlG1nzQ=;
 b=iQgW+coGKjaHJTXp9FVRV+2funnOmRPJ1oUYjGyIR86f3i9Y31OoUK7iccJGfPV/GD
 Lf1KygfNwS/ondmIylHQXxImAG6lmD5S5cdmYs1r9mjmArejz1A3lHkUmNb7fVcqwWCC
 ifhx9LcSboALNTjyWkdHH0QhiuaZjPFbhjNCRPn8wBSq4nwWC78bwEV4WwQXaW9Q7oeK
 D2BxnTjn3BdclBIwRgBwx4eL+VewCCvi/tG9sqtYyCvdIWV4Oht2nwVRHU2BjT2R8gEA
 +EyX+kPDiMJt4PPfHnGb82FfGk5rV2iu50B5FOIgr3yHZ2DT9DqW8JO+Nw+qFZisLt2Y
 Q0Gg==
X-Gm-Message-State: AOJu0YzdO89u1Tqukrn1F8pkqRXEHsd9kwnLAY+PmPvhO008mTnNvjMa
 goerbmGi6QkqJZgxeUVgKGpZuHNFvHBegg==
X-Google-Smtp-Source: AGHT+IGFtDuwxyvKfjnRuRzc1yyuhf7RFqIwC3wZ/DA4/pDU8NbABmNPHe4/RnGl6BCTT+fGYCCWrg==
X-Received: by 2002:a05:6512:3190:b0:507:9f51:acee with SMTP id
 i16-20020a056512319000b005079f51aceemr1341681lfe.22.1699700635062; 
 Sat, 11 Nov 2023 03:03:55 -0800 (PST)
Received: from smtpclient.apple ([188.227.48.129])
 by smtp.gmail.com with ESMTPSA id
 er19-20020a05651248d300b00507a387c4c4sm238056lfb.229.2023.11.11.03.03.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Nov 2023 03:03:54 -0800 (PST)
From: Gregory Klyushnikov <grishka93@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Wireguard Android app sometimes shows its UI instead of just toggling
 the VPN
Message-Id: <2E6A421F-50FF-44BA-B0A6-FA1F2F421ABB@gmail.com>
Date: Sat, 11 Nov 2023 14:03:54 +0300
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3731.700.6)
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

Hi,

I haven't found a proper bug tracker to report this in =
(wireguard-android github repo has issues off) so... I have a Wireguard =
tile in my quick settings. Sometimes, when I tap it, instead of toggling =
the VPN, the app's activity starts and the VPN state remains unchanged. =
My device is a Pixel 4a running Android 13, the app version is =
1.0.20231018, installed from Google Play. I'm not able to reproduce this =
on purpose but it's always annoying when it happens. If logcat logs =
would be helpful, I'll try to get some next time I run into this issue.

Regards,
Gregory


Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2CCEF06EA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48004807;
	Sun, 8 Feb 2026 17:10:47 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 596343e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jan 2026 20:47:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-382f9930e54so20985831fa.1
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jan 2026 12:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769719629; cv=none;
 d=google.com; s=arc-20240605;
 b=byEU1zBFiM8YHkppijy4Akl4+Xau371+l+FAPaGMpEybOd2KKvRnKgFFLIrlhKtOav
 XviCf2g0HAcbFUgDeoIaouVSa2mpJBy001qD4HUShpc43113XILdgF8hEMbh7LM9FBPF
 e4SsPQLLUEGUCT8ElK9ocsgghCbDIhbIUhRxjyIORV+tU43RYdZlzkU4QcXvoUXvwYaj
 +9vlAOjaQkQ4hTRMolbti5giAHqVbfHRJElTaUoG+KhESvtZ81yqTKhEB6SoRmGQ2cie
 SXVCPNdamB6wXuUa9VIuByydsGMbylaurqjuD54KRS/2ykiFH0mBopMYGWsRDCNXPUV9
 LYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=PLr1BdtK7MvtNOgdtAKD1SUqVScPFvJN5Ge+ccTot4o=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=P2W13BhbizRDLJm+6SGr1z+ZtABwY7dNI3NFlP43lEzVR7f9xYA2CoQRLPaL6vU0Ru
 ZFlVQvKay3uT+xcsF0nkQAqpXxQqfPUjuJGH+0UQD8Ugj0fHc5T4Ia1IMpDouP+f8vnO
 9HBT0Z0ZukQFpiPFJuySUiOBMpAHW/em4PYaAjJiM3JqKNIBqsUfiO4NmwmXSuNhwH+S
 ihsSX1MGofMqLF2eZ0B2U6xyW8iJzSnY6g3j2+RdcCIv2rWaaa1c32bR6DT+Is5OL+zi
 JXARfwCmISVtUZamHbOStc33sHc5eIzCJjZtYgxusOeBRSXobHfh6RZaRPV/yrffrLM6
 rpLg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769719628; x=1770324428; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PLr1BdtK7MvtNOgdtAKD1SUqVScPFvJN5Ge+ccTot4o=;
 b=ZrucqA2yVEDDMuVCvrhP0yK8BCFVhQTcnqemrYakjUZPLheVAqym9XBTmTufoAcc+K
 8BvwmynZAAjZQq96fWqkB6mRCGeQeN632i89efXinbK4qZielAb0u32D/PLy4c76Yk75
 wJ/x1sd+fP6R1jGry/0kA1RtlXJRYLqQQjQmiKGAY+NTW817DY/LBWpDHPFSJf/G9Cmq
 dYnUmUy2Cj+AMd3ALRBUh2SvI5Xyqdjb6w7oLCu+C6DIphfQI3NTopLikb2G0zfqtXYs
 oXWPq5x4jToldoK3zNEq3Gp4fLzJWJMl6WdxJOCdOIpf5csfOwAgRVBa3MGeVq2XEenq
 3+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769719629; x=1770324429;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PLr1BdtK7MvtNOgdtAKD1SUqVScPFvJN5Ge+ccTot4o=;
 b=SuiSPvy9FE1OOb0d0Xr+WetQHqisR8/5UAkB5aBlm/AxMnTsuWC6NkUWfbr/LMbevt
 HHHaiUQpD9vrNBvYSz7YY5+RG7OLHgN378WEb6saIodq6YFkKUAIUCJ7iDZO2NXbfw+T
 dyxAh7P6tNaU4nAqxmj6ZKQ9v4mAK5TvsoQUP0Hz0neAgu3vPyx7qa/oVqpLbl88dA5q
 rYmLfj6seZxgtIho1ugJjnIHd+v3ptjrpog8GIslfg42dB9jXG8Xtg7P3WraY7Y0YLwt
 y5Thd8vchfOkd8r1MdTPFf1GlzClU1ItdYnPPPamRP1X9/yG7mrKB94j6oaVlmKkINCE
 N+Jg==
X-Gm-Message-State: AOJu0YxZDDDJkqpLRKv5Ij9bAjwKsHOxbeYNZSlmc7lv1++3U4i+yRSR
 q+3PdKWz1Ffw4opfMU0iP/CJdDh59HY2cJPF8IuU8nzz6Rligk0vYcUx00sCcntL2rgxvu1lMoB
 hg3HzEg2VgLf9V161naRj2dfSGXNpRwNH1jUF
X-Gm-Gg: AZuq6aIePbYbU8rjijjqxUZn/a1FYARoO14mufLYIRLGWhNM6s5nrMTGEoctDbILU+f
 TIA8FkhifP6Y3VbPYIfJdksNxWnZjZBS8pie9BTrZRh28Czsgcm9Ri4WmD1SQyO5thfSLONb9QV
 nI2YixsukThAfVBcLK3T8ckPCcI0dpzM77jT+HeMqGbQZss34TmkOUH42Y9ir+rK+Td0h+WNQAD
 R3wuXL2ADEzKY4vcH+TtKmkwgZy++8AEqqPA9FNPSxM2dTaUelEqVdnmZq64f043ifR7+c=
X-Received: by 2002:a05:6512:3986:b0:59b:6a9c:530b with SMTP id
 2adb3069b0e04-59e16416e96mr167804e87.26.1769719628392; Thu, 29 Jan 2026
 12:47:08 -0800 (PST)
MIME-Version: 1.0
From: Alan Matthews <emustrich@gmail.com>
Date: Thu, 29 Jan 2026 14:47:05 -0600
X-Gm-Features: AZwV_QgpBdIpP3fM_BooIF32MgbYALb-9yGkzEXalY8rXn-RV4oQI2wgE5P5PdU
Message-ID: <CADrPR12g-qXpwK0qPeB9Ljj_-afOuGUQJG3D4pEmBkgUrgJUpQ@mail.gmail.com>
Subject: Unable to import files in newer versions of Android TV app
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

Attempting to import a client config file results in the message
"Please install a file management utility to browse files" on my
device running Fire OS 8 (Android TV 11 based).

This is likely due to commit 67db72a (TvMainActivity: use OpenDocument
instead of GetContent), as it occurs with v1.0.20260102, but not with
v1.0.20250515.

According to the documentation[1]: "Third-party apps can't respond to
an intent with the ACTION_OPEN_DOCUMENT action. Instead, the system
receives this
intent and displays all the files available from various apps in a
unified user interface."

My device does not appear to have a first-party file picker, which
would explain why OpenDocument does not work.

The commit mentions that the change was necessary for Android TV 14
(is it actually?), but regardless there should be a fallback to
GetContent if OpenDocument fails.

[1] https://developer.android.com/guide/components/intents-common#OpenFile

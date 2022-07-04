Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE69FC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jul 2022 07:32:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ea096deb;
	Mon, 4 Jul 2022 07:32:50 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 629c2add
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2022 07:32:48 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id h7so8179508vsr.11
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2022 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=i2vkyY6DzCVILgYZXgnBc6sgtboTZ0FO+x/5cljbRkI=;
 b=Gr1W5hDGxvn+hSY4i33gblFg4ii7NiGOgjiL5Ls25cXgAZVVNlyH9IRIZJ0ZhQAl+i
 Zc4aAFE3PZfuEQlVE5O7/S8Qcodwl3aKuOJ97nXH2++CDIyOU9I4HbN8DJxe7LH7dER8
 bufBqyb/K52oZwAxoHnokN4CtziiVz1nT3Rt1PlXrtP2OXazmKtbuhcviMDOHNu7ezSM
 E80rWu3tW2S0AdWmXSXXhIOGlGMt96Q97n8UAkYgrngtXH2tHOzknrrD6xmcVNx1rdhB
 rGiF8sy5t0xnkC0Ua7/TvM0Z431RVcHor4P4Bb133jhjoxdqMnO/C3ykPUpH1elGbulx
 WF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=i2vkyY6DzCVILgYZXgnBc6sgtboTZ0FO+x/5cljbRkI=;
 b=RZ16GcygleyIstlHZ1pFJ12igCyoYA4CIRl0iMeOEwdJ1ug/nqVC4IhyUqpBJKzfvo
 VQD74/Z6xNAbO2L3mOIEpS1T4ac9edkWg2XZl5aTMr5D20rWV2Nu4JjCInJ/fwY7GRFs
 qcrypHyTZFWb7VqDTLwFfG3xUri4ubKnSefBsV/an/b7KuAO4T8mG9CUK7lzgJFRlcuH
 9B87chCQ9lYURJMXXYavayvLRVlLl9RU6H4S6kSERrTpox1YnXSYHnSKMkeI7dwPZADp
 BkKW+KR6ez9Tqan02VjZJVRlktXWMmbKq83E9+etxm8qUInmPDKbTjsJoMf/kFMUhrop
 KdvQ==
X-Gm-Message-State: AJIora9D3nNdP6YB8KhY4DNelpwaV9zll6PI0zMFQpT9aItT8EU+q2FZ
 iCC0R+V69EfyOcymGQ7WW3nxwCKGFm5S1+qU2xDv0YAvswE=
X-Google-Smtp-Source: AGRyM1vGwNhndhecJS0C3Kibm5M27pcknby23JJD3CzW/aqLkWJot1QF0KcI8yVCWgbxcRxOJCuyMVSeKP3XcTRR04w=
X-Received: by 2002:a67:c113:0:b0:354:3ef9:3f79 with SMTP id
 d19-20020a67c113000000b003543ef93f79mr16616435vsj.3.1656919967192; Mon, 04
 Jul 2022 00:32:47 -0700 (PDT)
MIME-Version: 1.0
From: Alexey Ponkin <alexey.ponkin@gmail.com>
Date: Mon, 4 Jul 2022 09:32:37 +0200
Message-ID: <CA+QYBN=7FjHRVk+wox36iaG1i3-ZSF59qv_-yQ6UOdZ9WPLuKw@mail.gmail.com>
Subject: wireguard-apple: Unaligned pointer(s) for architecture arm64
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi guys,

I'm trying to use wireguard-apple in my app.
Following this guide -
https://git.zx2c4.com/wireguard-apple/about/#wireguardkit-integration
with small changes.
WireGuardBridgeiOS seems to be compiling but when I tried to run my
app(on physical device) I have lots of warnings like this - "
Pointer not aligned at address 0x1001F8A97 ('_type.*' + 232087 from
/Users/aponkin/Library/Developer/Xcode/DerivedData/MyApp-ffqwdheqjdaauedstuhrauhjkdcb/Build/Products/Debug-iphoneos/libwg-go.a(go.o))"
And the build is failed with - 'Unaligned pointer(s) for architecture
arm64' error message

Using XCode 14 Beta
go version go1.18.3 darwin/arm64
Any clues on how to fix that?

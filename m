Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F08C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:17:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C4160EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06C4160EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df3ba111;
	Wed, 22 Sep 2021 04:14:39 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb44599c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Sep 2021 10:55:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id co2so26262769edb.8
 for <wireguard@lists.zx2c4.com>; Tue, 21 Sep 2021 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=uZh101CpNtSl5byhLd0JvRoR4i7Ew2cCvh9txEuyEeA=;
 b=h7BRvaH/Ymk5gju19gR/Q5Jo3UGVQv977sJWcyllliy4diy8Kn1Eu8DunC2C5ffuSm
 TEnK0tbi0HtwiCdpLjnIQmcSMs3uq9j0De/m7+fVhtLS/vq4EddfjaC/Ui1hSESlqluq
 k0uOX2lfkyQ6e1kSblcGOGXxsglICW64lkuxEQ6Gg17zibThyS0931WYY791kCynWiGs
 H1yaNo2Q+rgmw5M/ea9VxwJOwCE0imcPxJvMi6+Ja/ET90rp4PfwXiWpzBBEuvxMQUCi
 CWMNDPnW1RBMYIjoQd40/Oo57cM9LTbLQseMoEMInabJJX9V4XvdJS2NBv+DD/ihlnf2
 BE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=uZh101CpNtSl5byhLd0JvRoR4i7Ew2cCvh9txEuyEeA=;
 b=8DC1ay9YEb/A//0JgGFsoPUpRGZQ0QoJtiNwYzCrifoIiWu2kX+Ph2mpxL32lL1FJs
 MwTnWqngSqodS73n49eIpJibd8QQ1uQG7sJnMbo959USh3jD+wDBL1HriBC+hEDYJ9MO
 pQhyq0As9StDbfy625KdJXYH4VLF+C5coMI6MD8AII1dWYku3nqYZyCofa6nx8Per1RS
 YiXs6EdHjs8LwQ637JMWnrCA6ZlF1PuoAN5aIytC+099ykraLfnVk6T0exhXM7krADSS
 7hvIu/iNV8KtfCXo+DOIy/+zi7QIwET/Es7rEgnPpCxvEcPGZi0ryxRmWea+CxbpZZG9
 /o1Q==
X-Gm-Message-State: AOAM531zOcHHWxW0mCwGOjUPPr/KLANIzkUwm+sEabcMRMYHNfaYCnCk
 uYJX/E8GIuqduIJmsn3lvr1Y0eGp0f0O6Q==
X-Google-Smtp-Source: ABdhPJx+/ORA2tw41qtkLwIbu6ElhcyfG7MPnUoClCda67ifeYUfmMRn/rAD4sxhOaQNK7+9wLNxaw==
X-Received: by 2002:a05:6402:21da:: with SMTP id
 bi26mr26074194edb.252.1632221711794; 
 Tue, 21 Sep 2021 03:55:11 -0700 (PDT)
Received: from smtpclient.apple ([188.252.198.230])
 by smtp.gmail.com with ESMTPSA id w9sm8193885edr.20.2021.09.21.03.55.11
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Sep 2021 03:55:11 -0700 (PDT)
From: Juraj Hilje <juraj.hilje@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
Message-Id: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
Date: Tue, 21 Sep 2021 12:55:09 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Wed, 22 Sep 2021 04:14:37 +0000
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

If NETunnelProviderProtocol is configured with includeAllNetworks=3Dtrue =
(Kill Switch), when network change is detected the device connectivity =
goes offline instead of routing VPN tunnel traffic through a new =
network.

Here are some logs from the moment of this event:
2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing backend.
2021-09-20 12:07:26.736732: [NET] Device closing
2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - stopped
2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - stopped
2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - Stopping
2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential receiver - stopped
2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential sender - stopped
2021-09-20 12:07:26.753433: [NET] Device closed
2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - stopped

Tested on devices: iOS 14.8, iPadOS 15
WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4

More info on includeAllNetworks option:
=
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks

Can someone confirm this issue or point to a possible workaround?
Thanks!

Juraj H.=

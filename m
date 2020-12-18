Return-Path: <SRS0=2ZxM=FW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD57C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 16:19:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8F12071E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 16:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8F12071E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7924c4b3;
	Fri, 18 Dec 2020 16:10:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 814b6b62
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 16:10:41 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78f07e4e
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=SxejW99UT6zonr0YX4YYCwv+k9s=; b=sRyUpg
 xykt4VzHXt3kn40ZYnMpxwcFXg4O675voUmjwQ7vmuPNnJSYG67fWpPRsyvmY9QK
 LdI3+OBhEe/vu/REfR/n9tgYps4wQXBCrM1AYH/xwYJcbg3CqjzxTlOGUqMMfvH4
 eDQK9S32BhIOHvdh6eQw8TaccyKtNMjlQNeViWgcz4T+5KKZWFYR50SNDPH5JeLq
 pzLbGTg1mYJ6erAZwW0VR+0ohujeXTDuufHFcZc9cfDLoTTuetJmakgJGrOHomT6
 vSA8es8z60NsJrhajOCU1PyaBjb4g/cnBC9BmcD6NhIlvjc/qFr91U9dUuexKSwP
 eEwYXluLLvY8KoQQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 31166423
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 16:11:26 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id u203so2409935ybb.2
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 08:19:20 -0800 (PST)
X-Gm-Message-State: AOAM5300uI2vDCcXM0iA/B5Yl93kwhhsy0JrhNTBQ0/wJ0pNcxgSWlEU
 UONYCOlc9FkGBEeUBEcHsjyxCvP+6fF0tiW9RJI=
X-Google-Smtp-Source: ABdhPJyzBV+x8i6u1bPWN6jgI5KiQuazd1CXrD5QXOIUiYYE9opgo+HchgfD4n2evLTWchyc5UeVQ2Gle/igPP90jLE=
X-Received: by 2002:a25:4744:: with SMTP id u65mr7362779yba.239.1608308360208; 
 Fri, 18 Dec 2020 08:19:20 -0800 (PST)
MIME-Version: 1.0
References: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
In-Reply-To: <CAA6-MF-fXL58SWcr6ct+iKLutObvM7xNoRTUW=iwfXUjcPsUGQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Dec 2020 17:19:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
Message-ID: <CAHmME9offZGOgySFGF-uzKCQ_NFwGQAy06HCE4=3iuwqprMc=A@mail.gmail.com>
Subject: Re: MacOS and wg 1.0.11 issues (for me)
To: Janne Johansson <icepic.dz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Tentative patch is here:
https://git.zx2c4.com/wireguard-go/commit/?id=54b5f7d7173d56508daa768e96a9f7d85de951dc

I'm unable to repro this problem on any of my systems, however, in
order to test that patch. And Apple's signing restrictions make it
impossible for me to send a test build to Janne, because
NetworkExtension is mac-app-store-only. So if anyone else experiences
what he's described AND has an apple developer account, please get in
touch.

Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA6BC10F29
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D0E205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm+jNcrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D0E205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b4fd861;
	Mon, 16 Mar 2020 00:14:25 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f0d311f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 14:46:13 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o10so13764212ljc.8
 for <wireguard@lists.zx2c4.com>; Sat, 14 Mar 2020 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to; bh=IdJhei3kCPrYdXbNMM1UDgTg6XT8qdJ3iWzKreJVbXU=;
 b=Rm+jNcrWYbr5GmP7lhf02T+R66tTwR3+UZDtOe9/A24Ikcbymy/zYaDbmDggHXOnJJ
 jm3eFe12oK8CYv8u5Djcs8P86DtiMpt7dx41m3iaBoE7dL7/AV4p+ftlpat32lYyYzCb
 nNpoV75YDs37mQBBSx4oUcEUqtWhcATa3iMlmdOyYjTQz/cK6hHw9Zs3MlAYzUIJ/0T4
 /Ak847PAFj9BLjNVoLXqOtmEOJlPGVRWUuSeHQj3OD+HqN4iF4h+0Ma4KD4E3gUPXOzh
 vr2LCBwnCHcM7FMP67lkvUnsg2ewVGDyfNd9dqpGOGxrinOsnOmpV4zYcLEBDQjYj7mn
 JebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=IdJhei3kCPrYdXbNMM1UDgTg6XT8qdJ3iWzKreJVbXU=;
 b=KOabUa8qMqT/iOJDUvmqprfnCJ6zJ5OcqyPViPvtRLgLuHNy+N0yiLfWX5+5Xq56Wm
 3DIELeGrlVm1kjDpRhSJ2WUbgTLnfPLRAxCzs7S/aWWEKmmAovN8q1ImkSBVeJbFgxXb
 pmAyVXvQGVRphny6fDrY9Y+D6nQ14VfNdrLej5GkwijfjxBsAdlCUwi1z7H5L/KvYTcn
 Y3pP5aINI5va4cmt11PywKsamKyGLyCJ8jxh5MVYc1ggOUuQUKNMnIl871TD/blw4x9/
 qDF9RV22zppj6bFx3EssDbj5R2NOAp/U57f5+NXyeB348DUs4OU7fPSOwxPE6/FCWp/A
 JT5Q==
X-Gm-Message-State: ANhLgQ1tEJ2v1cj9rqrePYfX5+pk8GUOaivSlACf5/CA2nDzzp6szQ4I
 U7BAd1nh9vd0mZm7kOUC8N8NGXLAbim/zjaxuG7XhL8+
X-Google-Smtp-Source: ADFU+vu/vfDPOpAEv2byatr5RXoKy3Lz3l96Tmz/cvs3nB58jncJuOtiAuJScZFsh8PobEjObou8VmDIgh34+LzzmbI=
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr11463172ljp.150.1584197521730; 
 Sat, 14 Mar 2020 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
 <CAADpXXY7ajNwRoF1sivACxUfFj-SpWf6o6+1Uq2N0XzEp3bvTw@mail.gmail.com>
In-Reply-To: <CAADpXXY7ajNwRoF1sivACxUfFj-SpWf6o6+1Uq2N0XzEp3bvTw@mail.gmail.com>
From: Torsten Krah <krah.tm@gmail.com>
Date: Sat, 14 Mar 2020 15:51:51 +0100
Message-ID: <CAN2Hv7DZgokROQeeacjhYAgBYrV57nk7Oh_japjuLT1=dOu5Xg@mail.gmail.com>
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Mar 2020 01:14:22 +0100
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
Reply-To: krah.tm@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

resend to the list:

Hm, sorry I don't get the message. Imho its down to the user. I can
choose to use ping or ping6 or tell e.g. java via a system property to
prefer IPv4 if dual stack is available.

In wireguard I can force ipv6 only by writing an ipv6 address in the
endpoint, but via dns ... how to choose which one I prefer?

kind regards

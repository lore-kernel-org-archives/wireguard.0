Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B417C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E908B205CB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFbqK+MW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E908B205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cfbf023;
	Tue, 18 Aug 2020 11:10:58 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb8070cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Aug 2020 08:24:54 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i26so14617012edv.4
 for <wireguard@lists.zx2c4.com>; Tue, 18 Aug 2020 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=msubi59q7gcednrRKsyO1+hlCuvCdOQy40syi25xej8=;
 b=MFbqK+MWM0E6zdAe6D/pt2+Itrkxnd6LizKM0fLmfgDoRCE4rxoGWDX4rFrk7UfYtL
 CDv+DmTzofqgyc3a3nzTHz9N0N+MeWMX7zvpkqAynla1emlUKSW6xJbK0cAP4r/z5t4c
 GtZoWVLBRisM/s7Z5HNt5guEBylSHJCRPg0RVWrUVc6QJcVCEb6X0PZFPWZFNeBZSMRS
 SWLO0y+4bC02p2V7jV4Rcd1qReEtFe9AWed+athGoKXr1u9Z9Uq0dHyL32whTKZ8O4Ri
 edcc/Ynhc5/FgpQ3auUTCwV7MOzUoNYPo4+ZfV8A8SfE44X5m2pj4UI3Hg11mtVSb3vP
 pE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=msubi59q7gcednrRKsyO1+hlCuvCdOQy40syi25xej8=;
 b=eY6sxQXJQdRN290h4yZ8V7O5sWzsQKh3/AFh5k4vQ0i75zAgyOlJOL+DnlEJbjgVoU
 2c4mRf0N77QtQysAPzpE4zSA8cXgRVFXQu9qwBdaY19AnN5Kf/DBNde4qN0Mm50rx55k
 6hMqz1A7lsQFHN/Lgr3Qk1fJnveOXa1I6d0HWeuHWVGQiGXQEGUITPNCMl4RoDQfEQ2N
 TsVtbA083xsIdrYMZqTfOycLsWqITDdpGtGhIfdi1+SJb+8KVbrFAGwaOEga057yFt1N
 jAytcbByO42vrmPxGsKlu2UYv0xVx1Itk/R12KlKAtvGy6RFZB2ZDj3uVzdq+FopWpF7
 91Hw==
X-Gm-Message-State: AOAM533ONk/K8UqkJaMK+Vbot1uJOYI7NiN9BgGeIIWZthXFsGABx4EG
 fWucdBxgHAS1dcP6Lx7RveLvX+V5DSEs4a48+bM=
X-Google-Smtp-Source: ABdhPJzPE/kz1NoVvBudL0l4QiXD5j6GWC+HR848YmIEHwsyBzXP5Xm+ykku0snrQuMrmOq1IfahkpH6xsZhkdsCujs=
X-Received: by 2002:a50:fb94:: with SMTP id e20mr19101852edq.103.1597740661755; 
 Tue, 18 Aug 2020 01:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
 <CAHmME9qobq9ZhyOGm5WaTTXA0i=k=_w0L+7LWCPcjUye5idJYA@mail.gmail.com>
In-Reply-To: <CAHmME9qobq9ZhyOGm5WaTTXA0i=k=_w0L+7LWCPcjUye5idJYA@mail.gmail.com>
From: Ferad Zyulkyarov <feradz@gmail.com>
Date: Tue, 18 Aug 2020 10:50:49 +0200
Message-ID: <CAARAvpLXrRummZrkG8g2xS97SeiBDC_ZC9+iygX0V8P_kokpUQ@mail.gmail.com>
Subject: Re: WireGuard on Windows: Unable to create Wintun interface: Error
 registering rings: Error listing NDIS interfaces: no interfaces found
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Aug 2020 13:10:55 +0200
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

Jason and Simon, thanks for the reply.

I tried Jason's recommendation and added Tcpip as a dependence to the
WireGuard service. This doesn't seem to solve the problem.

I added the dependency by executing the following command:
sc config WireGuardTunnel$wg0 depend=3D nsi/Tcpip

After executing this command I verified that noth NSI and TCPIP are
listed as dependencies.

I restarted the machine few times but still WireGuard does not start
automatically when the machine starts.There is the same error in the
WireGuard log file: [tun] [wg0] Unable to create Wintun interface:
Error registering
rings: Error listing NDIS interfaces: no interfaces found

I need to start WireGuard manually.

I tried the recommendation from Simon to set startup type to
"Automatic (delayed start)" for the WireGuard service. Unfortunately,
this also does not solve the problem. WireGuard does not start. I
check the logs and I see

[MGR] Removing Wintun interface =E2=80=98wg0=E2=80=99 because its service i=
s stopped

It looks like the WireGuard manager removes the service and installs
again. As a result the dependency to TCPIP disappears.

In my first email I explained, but worth mentioning again. There are
other Windows machines same OS, where WireGuard starts automatically
at startup. This is very strange that in some machines it starts and
in others it does not. If you guide me I can try to help debug this
issue and address.

Regards,
Ferad


On Tue, Aug 18, 2020 at 9:43 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hopefully this addresses your issue:
> https://git.zx2c4.com/wireguard-windows/commit/?id=3D86cf5c84384bde2b4147=
fc5eedee24937729a101

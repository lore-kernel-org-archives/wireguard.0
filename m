Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E2DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 23:58:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B368020771
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 23:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XHra5b71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B368020771
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a14c740;
	Thu, 18 Jun 2020 23:40:00 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7902d135
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:39:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df016425
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Ku3TNAkaZcVOkYWYzuDMQfnNUcE=; b=XHra5b
 71ugf4rUxQqO6Au+3/4bpPRPCGrOr8oTBNiqmSVx92daqXprvaB4b4900tf50PKV
 XoyKRF0nX1j26O4P1hLhCBR5E2YjW/v8HWtWQJJ8WGI2lNI52iYb3Bt4IdI4VcZ9
 RSrQOGv0CNOdO4z85GL0K8/I5X5LgsC0FTCMpnEkDMENqL4mYk2Ajzl6A4ZJDQQx
 v/jts6lsgnKo9WL+kIrFb/5e4K78NabYz8mkopMtAfxjwij6uOdj1YZN5dX2Rhc4
 fwFaLuefVQyvKcvDZ/FNPWxv4mxArj0xK8RxxBaQQRGXz9AJAR4a2oAc2YGlb5FU
 dYtFhD4VArmLZHGg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e65e68e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:39:56 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j19so7667579ilk.9
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 16:58:13 -0700 (PDT)
X-Gm-Message-State: AOAM532iog0sBG333o1bF1EjZ+wHJAlFXX9IWRm6cB+MScc7ZZoOMdn/
 +K0wDT9doVBxp6inx9anZfSa+GLId2rUflm1cNg=
X-Google-Smtp-Source: ABdhPJyYdyROGfAtZ0EHCrApKE0WwbNlk9ayBtc0bPDhNZEjpMNXRwWqKbsfhJsrujZHWGu3dlaO1tN8cgr7yJwj6bk=
X-Received: by 2002:a92:2515:: with SMTP id l21mr1039747ill.64.1592524692514; 
 Thu, 18 Jun 2020 16:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
 <CAHmME9p51XvLEZ7QbDreEXym34S4XZZaRotAv4aRiT5D4Pz3XA@mail.gmail.com>
 <20200617204510.GA396261@zx2c4.com> <20200617205443.GA403252@zx2c4.com>
 <CAHmME9qX2dVBf-23g1ASW1EFaX_4VLUH5QZBCM71NVfe6rtaxA@mail.gmail.com>
 <CALjTZvYnH_xQ45LLZ3Mp_oxatjWons4JFFpf3F_01F20s3SwVQ@mail.gmail.com>
In-Reply-To: <CALjTZvYnH_xQ45LLZ3Mp_oxatjWons4JFFpf3F_01F20s3SwVQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jun 2020 17:58:01 -0600
X-Gmail-Original-Message-ID: <CAHmME9q6KRAHQQ5oEVDPsZUqmaShAvoobfXmSRFSnzXJ=ngYNQ@mail.gmail.com>
Message-ID: <CAHmME9q6KRAHQQ5oEVDPsZUqmaShAvoobfXmSRFSnzXJ=ngYNQ@mail.gmail.com>
Subject: Re: Any progress on R_ARM_THM_JUMP11 issues?
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Looks as though in the end this is a binutils bug with
-fvisibility=hidden. Details on
https://sourceware.org/bugzilla/show_bug.cgi?id=12532#c9

Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A244BC54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:02:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E9D20781
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wLCfxkP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E9D20781
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf43ff6a;
	Fri, 24 Apr 2020 21:51:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72fca444
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 21:51:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 007192f7
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=v9AI4n2p4hM1
 IYjARA8QAG0QXNY=; b=wLCfxkP+1SOkooOkb3X/lbqOyZy1XjokcysO/ba3KKMW
 Yf/TS21VKiWe3ujPG/DX7myurTt3BnhEk02x69gdeTn3bm5BzbvyGIj3gBeqZVkG
 4gsCyMGUszjfYlhPWiPgJiMR3m4U/EfOvd6Ag87Iuh8VOk68ngdrOcIuo528TVMa
 MoU08v3BilS2wQJ5p4JuiKJu2UQhw2h2P6Wf4chcV3x68LDWPKqHlviDq+aa5I9z
 sfSUM7PQ/icKYl4ni+2RAj+dPJoBt/odm4tp9q9jngQmPFp1qBchjH34u9zvGiUB
 hbfU0zazdpHlq8AfLjf68pkMSnfyuws4K+90RFJ5UA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d39dc79
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 21:51:42 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id f3so12075862ioj.1
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 15:02:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuZeFtJ8rDV5EZCEi9mIiXTwI+GFrI2s/KtYBb5F1aaxOPfvjp/L
 6EiJAtQXRoEtLC5pYqXw3dol0bjGE7o8uMzlBAg=
X-Google-Smtp-Source: APiQypJp1T4GQkb6HIVsE2FYW4RQ8XNmjWhoeezXlVLBXd1IeZrNObjoLo3QK/RtDSzgTJWmaNLTirqduAJzeGkjcgw=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr10329159ioj.80.1587765771721; 
 Fri, 24 Apr 2020 15:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <M5WzVK5--3-2@tuta.io>
 <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
 <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
 <87a73035qd.fsf@toke.dk>
In-Reply-To: <87a73035qd.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Apr 2020 16:02:40 -0600
X-Gmail-Original-Message-ID: <CAHmME9rssE6_0hT3nS5703YTS0EG_Pug6vGonx9_tU6yLC2UUg@mail.gmail.com>
Message-ID: <CAHmME9rssE6_0hT3nS5703YTS0EG_Pug6vGonx9_tU6yLC2UUg@mail.gmail.com>
Subject: Re: Attaching XDP program into wireguard interface
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Adhipati Blambangan <adhipati@tuta.io>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 24, 2020 at 3:59 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
>
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>
> > Oh. Set XDP_FLAGS_SKB_MODE.
>
> Yeah, you'd definitely need to run this in skb/generic XDP mode.
>
> -Toke

It looks like the code in question is likely:

        bpf_op =3D bpf_chk =3D ops->ndo_bpf;
       if (!bpf_op && (flags & (XDP_FLAGS_DRV_MODE | XDP_FLAGS_HW_MODE))) {
               NL_SET_ERR_MSG(extack, "underlying driver does not
support XDP in native mode");
               return -EOPNOTSUPP;
       }
       if (!bpf_op || (flags & XDP_FLAGS_SKB_MODE))
               bpf_op =3D generic_xdp_install;
       if (bpf_op =3D=3D bpf_chk)
               bpf_chk =3D generic_xdp_install;

It looks like bpf_op =3D=3D generic_xdp_install is the case when neither
XDP_FLAGS_DRV_MODE or XDP_FLAGS_HW_MODE is set. Setting
XDP_FLAGS_SKB_MODE explicitly will force it on all drivers, but not
specifying it will fallback to it if the driver doesn't have hardware
support, which is WireGuard's case, unless either XDP_FLAGS_DRV_MODE
or XDP_FLAGS_HW_MODE are set.

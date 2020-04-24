Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A75C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:25:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF0420736
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="T69PPE2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF0420736
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0db5214;
	Fri, 24 Apr 2020 22:14:10 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8e6a154
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 22:14:05 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1587767113; bh=H3LQe0OtSEjJ7mST7p3Z25dzzrLA9BqgG0HgSChWa/4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T69PPE2YdtXg8SrdXK2u/NY+pBSBqGXpytCj20gSq7GyKyQtHSlvzDPXwJPsJxXyA
 jsQ5O0X2jFe2oHcNFqtDh3RS8xo+d1tC20TppaX7mJzgQTHJnxpdA8rP9jz+KJ4V4C
 RjKmGHWu7hO4VFLfJFwglWGHGWAWjbxvwjMTlKbVcEFVD2BOvZOSjMn5sZaarrphz6
 1G1ISsz8o6pZ8eza6jp6Ll1OzKUlWwwZ/WY1sDxGQfNw25HnbPXRJ+NERkA+YGsPdU
 i+/O1eXqe7msy4jw56Zq7oVTAttDLoShxg50PyHoIKqDJKPvM+znXFTU/uEDb/v2gs
 k7biaTTwF+SHQ==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Adhipati Blambangan <adhipati@tuta.io>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Attaching XDP program into wireguard interface
In-Reply-To: <CAHmME9rssE6_0hT3nS5703YTS0EG_Pug6vGonx9_tU6yLC2UUg@mail.gmail.com>
References: <M5WzVK5--3-2@tuta.io>
 <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
 <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
 <87a73035qd.fsf@toke.dk>
 <CAHmME9rssE6_0hT3nS5703YTS0EG_Pug6vGonx9_tU6yLC2UUg@mail.gmail.com>
Date: Sat, 25 Apr 2020 00:25:12 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <877dy434jb.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Fri, Apr 24, 2020 at 3:59 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>>
>> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>>
>> > Oh. Set XDP_FLAGS_SKB_MODE.
>>
>> Yeah, you'd definitely need to run this in skb/generic XDP mode.
>>
>> -Toke
>
> It looks like the code in question is likely:
>
>         bpf_op =3D bpf_chk =3D ops->ndo_bpf;
>        if (!bpf_op && (flags & (XDP_FLAGS_DRV_MODE | XDP_FLAGS_HW_MODE)))=
 {
>                NL_SET_ERR_MSG(extack, "underlying driver does not
> support XDP in native mode");
>                return -EOPNOTSUPP;
>        }
>        if (!bpf_op || (flags & XDP_FLAGS_SKB_MODE))
>                bpf_op =3D generic_xdp_install;
>        if (bpf_op =3D=3D bpf_chk)
>                bpf_chk =3D generic_xdp_install;
>
> It looks like bpf_op =3D=3D generic_xdp_install is the case when neither
> XDP_FLAGS_DRV_MODE or XDP_FLAGS_HW_MODE is set. Setting
> XDP_FLAGS_SKB_MODE explicitly will force it on all drivers, but not
> specifying it will fallback to it if the driver doesn't have hardware
> support, which is WireGuard's case, unless either XDP_FLAGS_DRV_MODE
> or XDP_FLAGS_HW_MODE are set.

Yup, that sounds right :)

-Toke

Return-Path: <SRS0=hzHk=FA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0160C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 09:55:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDC91208CA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 09:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgoIX0QJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDC91208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24f26266;
	Thu, 26 Nov 2020 09:48:47 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ab4e4ce
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 06:58:48 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l206so1216598oif.12
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 23:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:references:to:date;
 bh=UDVWOO3dcJw2gS3mP5d/Mc5z2FiWVb3eL7ltNaHxx5E=;
 b=AgoIX0QJC3qyrmbkkKitrZtKi8X5uj46BMwHQP/cVwUkLIb+Z109RkoQ8v3m0OniGA
 RQr9UsC38/kOaNxhWcPF2HxUg3hBe59kr8qHGjJyXuXom3ezh6fXv7Wqh8owPTMB0zRk
 c5DDlDD8UgpUFF54OOVbnJue22TrbVYbMJhoJ9e5j52H+n74VCU0w4i0HO0d+WdrZzLO
 i/UI2tQtkaXfbhsjV+D5c7Pbf9JCwr+YM2RBIlyELh9mswB37OaUjPxMxpLUIGAn1iJg
 EtmUk58yCcuVyAAm49JuOO8ffj02GVZ4eNLLg8rerKYGh1SV+RA2VgATClIUT2wUP6np
 0FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:references
 :to:date;
 bh=UDVWOO3dcJw2gS3mP5d/Mc5z2FiWVb3eL7ltNaHxx5E=;
 b=YFWukfFK1PG81h9HRJqbAmGXQAUwe88Jg7lvU09SzPpSKzFvly8YAjy3lRVwZPKDQd
 iQyevJzfLADmdodLtgdqvs+xVBUBCBlCopA8i/eY9nihFbco0zdK3S8n6/mUn5UdAwn0
 joZGSv6ctSj+GqX/X1z7j9Pn8OXNL3zhx8zxSgRH4BZaR1hx/cE+OTrAepw7LIzWnFJ3
 vaDxVPhu3WKqWDMHoiGzf3e3GtMgrY2Ytef8HjGVxdZe9/KY2KuEbCHmk2vWX5xey4FV
 qZ+C/SctuMJk4H3DxpKH8+aTV/ib5HK4McHE17NO9C5Yj1bImP0caXNcOsmLKgFNl7/w
 bfwA==
X-Gm-Message-State: AOAM531TC7jsB+uMgpjFKhKsZgRfIgK4Zyhn/mev26uYw/zgkbmbguaR
 iSk9T07tJTLDFd76562e5KmrMtCE5xo=
X-Google-Smtp-Source: ABdhPJy2US5RquPZj7V8UqS3f7us9zwkU3bKVNaaMC8io0m7Gq/eXuLJ4vPEvhSzrStNQzAFhNIXhA==
X-Received: by 2002:aca:f03:: with SMTP id 3mr1252535oip.92.1606374272376;
 Wed, 25 Nov 2020 23:04:32 -0800 (PST)
Received: from t0111.attlocal.net
 (108-206-116-173.lightspeed.frokca.sbcglobal.net. [108.206.116.173])
 by smtp.gmail.com with ESMTPSA id c21sm2465204otf.20.2020.11.25.23.04.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 23:04:31 -0800 (PST)
From: Andrii Petrenko <aplsms@gmail.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_E82E8E2B-26E0-4A6B-85E3-0721FE4D3AD8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Fwd: WireGuard on iPhone6 is unable to connect.
Message-Id: <D75A6A7C-B01F-4B4C-B6BA-CE7081D5A240@gmail.com>
References: <B42AB7E6-EF87-4CF6-86F6-8DA0AD7A35D3@gmail.com>
To: wireguard@lists.zx2c4.com
Date: Wed, 25 Nov 2020 23:04:29 -0800
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Mailman-Approved-At: Thu, 26 Nov 2020 10:48:44 +0100
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


--Apple-Mail=_E82E8E2B-26E0-4A6B-85E3-0721FE4D3AD8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Hello All, I have a problem run WireGuard client on my iPhone

WireGuard for iOS 0.0.20200127
WireGuard Go 0.0.20200121

iOS 12.4.9

Error is:

2020-11-25 22:54:12.013646: [NET] peer(CDay=E2=80=A615xQ) - Sending =
handshake initiation
2020-11-25 22:54:12.019886: [NET] peer(CDay=E2=80=A615xQ) - Failed to =
send handshake initiation write udp4 =
0.0.0.0:54027->184.23.214.176:48060: sendto: network is unreachable
2020-11-25 22:54:17.152228: [NET] peer(CDay=E2=80=A615xQ) - Handshake =
did not complete after 5 seconds, retrying (try 2)


I=E2=80=99ve tried different ports, hosts, providers, configs, via LTE =
and Wifi =E2=80=94 result the same.

Please help.

Thank you,

Andrii Petrenko
aplsms@gmail.com



--Apple-Mail=_E82E8E2B-26E0-4A6B-85E3-0721FE4D3AD8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQmiKcaJSwgSVjGF5z4hQ0+jiDacFAl+/U30ACgkQz4hQ0+ji
DadrVg/+NOHsN6l65lwyFu7YZEE4ke+X3dyPd3mqEQNEb5oD+cP0txiPwI96BsQO
XQu1UQqb/IBdSjXQc63zC9xTATAUpDN7mJuIP+ZU01PgJtkgS5NyPR7vHDeaDRsd
r6Au/GDvYkLVJ0Bv8fEuBiGWwAVKLQFuTlXGw+URXPhW+Yn3J2jLb7I8xLv8xil/
9L9mu7P0C4s+DPBvk2btz7lm5k58k2PH9IYWutV1Yo59m/6OrEQX+Xfl68aS7pYc
Ke8Qfh8KGaqfBYvFvdL6w2wP4IcmhlnvMlx+9Vt71NpjkINCJqBkczatrYApun6h
U31nIJBCMbGOXLBtW9eUB48wFLiPdkKrHfzHct/lpFFme+pOaU5U13fXg+KFzofR
mKfeLPMTTDqKe21gTIOWm45k/1yn9imUFn5FL7OlBzJ1Txc0Azb222GP//sDIIuj
zbQP4YmeDqzbN+o4LD+DpN9OCgTjLEcUo/M6kbjjhOOaoDa4RhRMwdt4VBYuLPIB
BrT4l5tT332d1rFKWcAYTfsYGgkVIjVO279Z9y+2RkexQnAx+OWf0qXHExUCy1Jn
41uuufW7sLlAG8A87sWH2z7Vd5R4DoMoMSQaBh0RgMHthDBhu/H7zJBy07ElWr4+
TtvMMEsMFxO6sVU8CXvrcdYFPgoNmdbIYfD0TwMhck07rGKTqDg=
=Lz/3
-----END PGP SIGNATURE-----

--Apple-Mail=_E82E8E2B-26E0-4A6B-85E3-0721FE4D3AD8--

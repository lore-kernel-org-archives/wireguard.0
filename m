Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F3CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 17:02:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB89255A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 17:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u/yiYYrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB89255A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 757ceab5;
	Mon, 29 Jun 2020 16:42:17 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3afc2b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 16:42:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t74so9523731lff.2
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Hn1enTQs89rEBQoeTot9Y3EnG6RsmxkKDMsHN95HhZs=;
 b=u/yiYYrAO5QpWiBsizV/TZdKO8VENIlD5Lm5ScsbBPsPw0QfYteKBGvh38otuc0IkL
 lkkF0MONkrPS1OsYuV/euVSw4y2foUMTvtznWH2pPZIIYLQfUtJi/yfHHxYkzcCF1Egr
 JiaxeOxICPZYEvhbayDAo+/Pv7tcS7qxLgVROkVxAjFKwh9EldVFuhqZFFzU1vgIUk6E
 Q2w2EBy2nTUHEfTClVxEWF1lStBq/x1F3+dUYMi/ZzI+Z1GPyG+GRKi/JfLYBak+7Ojm
 S9kJOCNPsfPOkuNsJneoidXvZRzrACfdPowCBvP8knojxmdz2swQlbPTmR8meuCeyUet
 wJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Hn1enTQs89rEBQoeTot9Y3EnG6RsmxkKDMsHN95HhZs=;
 b=Whf0NZMfzwWmjznQNxvoCh2jN1QQ786hV1MdhhVwP0XRdBn52iFfx65Ohpkk5YyT5q
 j7hy1MdtHjO23/TtuF25aoNCJCdX/ECGPhpNDcUiLoR15rAfWAFK1iGm4dShdj45jfa8
 hcGJUJVWVbMWhdjFm6Q12z34DzyveZ85daOZdrbiYh0OOhqXUgOR6JkzzHnHqWtpfQk+
 Kwh7rGqaaGkpkdbd6BJwVMIVqSEV5yfqC814Mz7xtz0yAZtHMrlqttmstcPdOxUXVXWZ
 2SgaeQdSFI2N2TQmQqq98KSO2WHv1YoQw383ECw5rCZPGBnXR0FR2gpQZtgqGP/JPkb/
 KW+Q==
X-Gm-Message-State: AOAM530bC9bfv+WcUcHQWYVU+7HEfSy25mnxQQBT56Ak2Mbj2SvhYES1
 rpiq/dKmPEmwecgiaEsBU+Q=
X-Google-Smtp-Source: ABdhPJxWsJoZ6wmb+bGP1tp/Z6AbkjbvdL3HqMmSqSH7ELbxUE8fcVUgnDpVA0Yab3FGryIIBQmsaw==
X-Received: by 2002:a05:6512:328d:: with SMTP id
 p13mr9457612lfe.139.1593450113699; 
 Mon, 29 Jun 2020 10:01:53 -0700 (PDT)
Received: from mammut (8637-c174-83c6-02de-fe80-8327-07d0-2001.dyn.estpak.ee.
 [2001:7d0:8327:fe80:2de:83c6:c174:8637])
 by smtp.gmail.com with ESMTPSA id 23sm48570lff.91.2020.06.29.10.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:01:52 -0700 (PDT)
Message-ID: <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
From: Arti Zirk <arti.zirk@gmail.com>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Roman
 Mamedov <rm@romanrm.net>
Cc: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Mon, 29 Jun 2020 20:01:51 +0300
In-Reply-To: <87lfk6gjax.fsf@toke.dk>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk> <20200629163851.41d6d755@natsu>
 <87lfk6gjax.fsf@toke.dk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On E, 2020-06-29 at 14:15 +0200, Toke Høiland-Jørgensen wrote:
> In general I'd say that deviating from the RFC needs a good reason.
> Expanding the number of bits we can use for the identifier may be a
> good reason to expand the LL interface ID width (although I'm not
> actually too worried about collisions even if we only use 64 bits).

Few more counter arguments against expanding identifier length:

1. There is a rejected errata 4406 that wants to do this
https://www.rfc-editor.org/errata/eid4406

2. FreeBSD and probably other *BSD/macOS use those unused 56 bits to
store the link scope_id. And support nonstandard fe80:1::30/64 notation
instead of fe80::30%1/64 to specify the scope.
https://stackoverflow.com/a/5891805/2303328
https://github.com/freebsd/freebsd/blob/76f9308e3e2b80e95630efcdd994f3c133806bf4/share/doc/IPv6/IMPLEMENTATION#L427
https://github.com/freebsd/freebsd/blob/e9a39e0c3c22543812afd4de74d1d0ad6782100b/sys/netinet6/scope6.c#L363


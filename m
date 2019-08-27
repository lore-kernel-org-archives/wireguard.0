Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA2FC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47844214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lg21GYFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47844214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 672e9d4c;
	Wed, 28 Aug 2019 02:25:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8942d8dc
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 23:02:09 +0000 (UTC)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b879fc60
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 23:02:09 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id gn20so263990plb.2
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 16:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C0Td/4Oqey7Pni9TnkPaH9H7AypgHHVWWkjvZTvMeg4=;
 b=Lg21GYFp1H+2muK2kvoOPKKNTxpp+hkxepRiFXgRRx+iggojJgoybSOLgOgY2jR7N2
 iUdhxOE7IX6QPXB1T4ZYjyU4ZTHy8reFkyl0JC3b4UXhU7FKprlocyYcMPzSAejsvVDP
 oa6oHv8gYcGdvFFSY+Kzltpav2X3pKMOzkZXqz4yOLXY5qwoOx1hvma89BiwCKmAqsYY
 qQAobO4Ig2syTg78H1Uj7LZtiFtNhOqufjYFXzBTIbCjJqUHS6wWxx6Pq3p1kMbslgyj
 ERbuLk8WcuOTg3x04leuMIbbR7RURickSYwBaCtFWIqeY+MzxKB1u8bV85cag+ZLAeSl
 pA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0Td/4Oqey7Pni9TnkPaH9H7AypgHHVWWkjvZTvMeg4=;
 b=KXkIzdBUb3kR6/8H4E9pB0E28Vr+SPVR104fYNv2Scz5EKxLx7lL3A/7VxKsMmOFw9
 0SCm5fA6J3Y2dx7alU9Iql8VOqKJgbRUTajRRVfo8p6xrw9vJTYHyJkvkzK5Lc1DJXuE
 15XEf/d5YbNs6SKWbPZ5/E90oDVi1U35EGHSWcwLflw7C6jW5e8LaujzPBZLVMesqDHq
 81zEGkRiWsWKW2X5pahV/8M9BvnGieqCdsewq7w039f+eDmNyre5FehSnoDobtYjTOft
 9GEbDQIob1oKH1E6+dNy3AiuCZPCp7VDG1NClMuZgRnsF8OIZEeQWkYFNppsqz+zZeP6
 /jdQ==
X-Gm-Message-State: APjAAAV486jR3ggIw6cR3YZY8itA2DHt7t1Wy5OauMcAxa6htsm/tpdl
 Dg0v0PWRmbX0ywflrpltUYjTTf/RwAjOX4TY51L0hN/S
X-Google-Smtp-Source: APXvYqxU2O5caf83w+lw/9GErFdq3y6hyL297b765rpdqWHCS3aKVAjY2RQV7hCw09bppwzYC4One9KqGrnoeEPfSgg=
X-Received: by 2002:a17:902:b094:: with SMTP id
 p20mr1354189plr.320.1566946928876; 
 Tue, 27 Aug 2019 16:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <5d41995d.1c69fb81.35aae.ce0c@mx.google.com>
 <CAHmME9pDABPALZ+P+3TO20FTcwu1Gni3ZumP-Y+nB6aHjBPO1w@mail.gmail.com>
In-Reply-To: <CAHmME9pDABPALZ+P+3TO20FTcwu1Gni3ZumP-Y+nB6aHjBPO1w@mail.gmail.com>
From: Neven Sajko <nsajko@gmail.com>
Date: Tue, 27 Aug 2019 23:02:46 +0000
Message-ID: <CAL+bK4O=BV4AjmGpUvpAjOJ6SjpZf4QGSYiubfmjcxZfxr=2=A@mail.gmail.com>
Subject: Re: [PATCH] device: in setZero, keep arr alive after being written to
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 28 Aug 2019 04:25:08 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

> But this doesn't prevent the runtime from copying things to places we
> can't control, right?

Correct.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

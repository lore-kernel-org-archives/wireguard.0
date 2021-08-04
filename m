Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD92C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 11:20:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3340F60FC4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 11:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3340F60FC4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 253b28ce;
	Wed, 4 Aug 2021 11:17:48 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2fb04aae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628075863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=56oBiaPH6GB7wkjkTdc3Ra+pLBPIp1g7LQ9xlzcWOyc=;
 b=HlnyW88av0IgRxul44Dae9IG6K0kKNWYB7BaotSBCrK/VrwsKEtIHKns36OoUSt8XzgnoZ
 bs3m/HRuhhSmlcg085cQWT5yOs8huOGI9Gm47txIjWX2wOD0V0UlDmPk9ZB4m7JRqRrKBF
 LTx4j398Za70r+qafxRSH07bnXHOKio=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db585c39
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 11:17:42 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id z128so3400161ybc.10
 for <wireguard@lists.zx2c4.com>; Wed, 04 Aug 2021 04:17:42 -0700 (PDT)
X-Gm-Message-State: AOAM530az3nMfgWa+YwjVrYS3cKFN0lzPH2tyCZuGq7Td+4Oy/TNTsqP
 m1jfWlaMahlTO8bFaI34xyX12NExxkx8qEU8c00=
X-Google-Smtp-Source: ABdhPJxJt7m45TlNWcXdz5ezyDY+KWQIA0U/lEt+27+6FyFnMpMDAE8HoCORQ/vHBbvCq40eWmOcEpnwTBi6c5OqcyI=
X-Received: by 2002:a25:a109:: with SMTP id z9mr2945583ybh.279.1628075862101; 
 Wed, 04 Aug 2021 04:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5RCdEyyeGdeBrviTTjF3EyrfNWrCsUXqFbW+RUgqjKeDUrNQ@mail.gmail.com>
 <8282408d-8910-3e8d-2274-ac438380d90b@gmail.com>
In-Reply-To: <8282408d-8910-3e8d-2274-ac438380d90b@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Aug 2021 13:17:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9p5gyCssAvxPjvheJGQokgQ_uUHCnt-NVnTnCH7PRGeXg@mail.gmail.com>
Message-ID: <CAHmME9p5gyCssAvxPjvheJGQokgQ_uUHCnt-NVnTnCH7PRGeXg@mail.gmail.com>
Subject: Re: WireGuardNT BSOD Windows 10 21H1 Mullvad
To: Peter Whisker <peter.whisker@gmail.com>
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

On Wed, Aug 4, 2021 at 12:05 PM Peter Whisker <peter.whisker@gmail.com> wrote:
> Yes, I saw similar BSOD on a workstation I run yesterday but as it is
> remote it's a nuisance if I have to go and restart it in safe mode to
> disable the kernel flag. I may get to re-try it later in the week.

Can you confirm that the BSOD was on 0.4 and not on 0.4.1? It's
important for me to know whether this is a new bug or just a
non-contributing "me too" for the old one. If this is a crash on
0.4.1, can you send me C:\windows\memory.dmp or
C:\windows\minidump\*.dmp ?

Thanks,
Jason

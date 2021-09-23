Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB3EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:23:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86C7260FE6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86C7260FE6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a27d54a9;
	Thu, 23 Sep 2021 03:22:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8204f518
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:22:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9DBF61050
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 03:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Ubwkp/Dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632367348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3xEf+KC2XzuxGhkTNOkKJ2o+8AGt955oraWkJSQWzo=;
 b=Ubwkp/DwH7Fd2+eO1DHdhj8yKxkv2WSBxteBRWz+ZACylmpj0UNGFodTT7bbJObGtMvHm6
 eiw54xqiJYs+dJ+PRbnSVrVXljAKcvUuzH6B5j8988kfWG5u9wIP7EekOAmnwywdcne+CF
 WaW3abIk0xidMqQ6a7Nnk33qNe3bmIY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fec9cdc2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:22:28 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id m7so524486qke.8
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 20:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM530rd899wPYkFhGjoeIkXGaA0+cSLQPBoo3KnAJ35xNlJLKglH88
 Gq8dCcTi+pbmpAnWV1cCDoEYlvUkSnC1VLd9TFA=
X-Google-Smtp-Source: ABdhPJzaQWwMXpy+7CjqNrmOzuKtcgpyP9K9yRScNYI9WdxI7rW72EP8Q0BlFQv/xenVgarvFCkgGCPnoZdw865OchU=
X-Received: by 2002:a25:61c8:: with SMTP id v191mr2940493ybb.472.1632367347470; 
 Wed, 22 Sep 2021 20:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
 <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
 <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
 <1B181919-09C0-4908-82F2-DD5661C53FD0@gmail.com>
In-Reply-To: <1B181919-09C0-4908-82F2-DD5661C53FD0@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 21:22:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9r5HX6qYNQRarK0Mbv+Vf5dyyWwH-RjLmsjWHSy-YBEUQ@mail.gmail.com>
Message-ID: <CAHmME9r5HX6qYNQRarK0Mbv+Vf5dyyWwH-RjLmsjWHSy-YBEUQ@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Miguel Arroz <miguel.arroz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, 
 Anatoli <me@anatoli.ws>, Roopesh Chander S <roop@roopc.net>,
 Alan Graham <alan@meshify.app>, oss@jacobwilder.org
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

Hi Miguel,

On Wed, Sep 22, 2021 at 9:19 PM Miguel Arroz <miguel.arroz@gmail.com> wrote=
:
>   Yeah, I=E2=80=99m 100% sure they were working fine after the update but=
 before I launched the app and touched the on/off switch there.

Interesting... Alright then, new theory: the keychain references are
accessible in the old 12-byte format, but are presented when iterating
in the new 20-byte format. The deleteReferences(except: refs) function
iterates through all, removes everything in the except list, and then
deletes what remains. If the iteration reference doesn't match with
the except reference, despite pointing to the same object, then it'll
delete them incorrectly. ...restoring to iOS 14 now to test that
theory.

Jason

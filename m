Return-Path: <SRS0=0+k7=45=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABC7C10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 07:29:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77E1206F7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Mar 2020 07:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="grf/0ZDW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77E1206F7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef7c5b85;
	Thu, 12 Mar 2020 07:23:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47fa6ca5
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2020 07:23:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6106054
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2020 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iq8Q02VLyunspNjpi70fp10RYGU=; b=grf/0Z
 DWEzJHVWqDBaCcN88muGI6VrBNdoXxaMO3AuM4b/39KtAw+o0LVWIaK/N8qBix2S
 P4fUsZhpJb0BaVrr3E7fmYnt0gfB9Fongp/mhcE1boSjsGE5U7/G4QicdAv1R+nB
 cGGFXCkX5VlpKR2bjtgZ0dkDIjvng898p1fxHUpCtGb/heb+fcxRrZPY2chtQgQn
 iov/3PKzx5ryqcnRZzRcBphcxZYx/9X2Ns+Sd+0/mzD668xm/iyWZEFae19DmlZ2
 r9v7AE/IXwBExMOmnjru2IEFqy//aEI769IVwKQ1I7F7xSgvu00HUpRb5ohubEza
 Liq9QtNyfU13CQng==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f33926b9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Mar 2020 07:23:03 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id c8so4578113ilm.1
 for <wireguard@lists.zx2c4.com>; Thu, 12 Mar 2020 00:28:36 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2e3UQn5FPPLjlPgFFVwRhys6GQDuuaZpTOGobQ6QXoxGgvmr1j
 bNy2jbi74to1Seq1BKhTQGQeBWm/AzrWD17RZm4=
X-Google-Smtp-Source: ADFU+vtDWUjN+4NEIhmwQPv6qHgWAErXH6253Olk0J6q/MuxoORFobGSLUq1iPw/oT0RLzoiwATkGLruBYM5KvogaE4=
X-Received: by 2002:a92:9603:: with SMTP id g3mr7053994ilh.231.1583998115785; 
 Thu, 12 Mar 2020 00:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200312063622.82015-1-tanioka404@gmail.com>
In-Reply-To: <20200312063622.82015-1-tanioka404@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Mar 2020 01:28:25 -0600
X-Gmail-Original-Message-ID: <CAHmME9o2MzNK=E=tZpknRDEdMMovyWqMSJTtuLkT4_tB-xxXgA@mail.gmail.com>
Message-ID: <CAHmME9o2MzNK=E=tZpknRDEdMMovyWqMSJTtuLkT4_tB-xxXgA@mail.gmail.com>
Subject: Re: [PATCH] strings: update Japanese translation
To: Eiji Tanioka <tanioka404@gmail.com>
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

Thanks for the patch!

zx2c4@thinkpad ~/Projects/wireguard-android $ git lore -a -s -c
20200312063622.82015-1-tanioka404@gmail.com
Looking up https://lore.kernel.org/r/20200312063622.82015-1-tanioka404@gmail.com
Grabbing thread from lore.kernel.org
Checking for newer revisions on https://lore.kernel.org/wireguard/
Analyzing 1 messages in the thread
---
Writing ./20200312_tanioka404_gmail_com.mbx
 [PATCH] strings: update Japanese translation
   Added: Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Total patches: 1
---
Link: https://lore.kernel.org/r/20200312063622.82015-1-tanioka404@gmail.com
Base: not found, sorry
      git checkout -b 20200312_tanioka404_gmail_com master
      git am ./20200312_tanioka404_gmail_com.mbx

zx2c4@thinkpad ~/Projects/wireguard-android $ git am
./20200312_tanioka404_gmail_com.mbx
Applying: strings: update Japanese translation

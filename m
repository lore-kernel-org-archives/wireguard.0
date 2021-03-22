Return-Path: <SRS0=HpKU=IU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C16C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 18:15:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0AC60201
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Mar 2021 18:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E0AC60201
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c70187a9;
	Mon, 22 Mar 2021 18:15:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da966496
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Mar 2021 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616436903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0q3ODfFXwK47hnjTbtDyo7ZIgd3/Rahv7OfNMiPJ58=;
 b=m7irnUwxj9gq4yvndTnH0ucN7zOx6SEOML0qS0MYizHUkpYF9yljebg0AFdua9bfb9+eF4
 jlTZcxrb7jx4NfGQREyVHf/KaxwLHLgcjIybKM7SiD9/Msq2BBYzOMPWmQzUHlMNKvYFcB
 HDc4/VEeWR2IP9o1GiGfqOqLuzsGaKQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a1826a8b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Mar 2021 18:15:03 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id w8so7550389ybt.3
 for <wireguard@lists.zx2c4.com>; Mon, 22 Mar 2021 11:15:03 -0700 (PDT)
X-Gm-Message-State: AOAM532jOkxMOWEbpeRYGDtrcIaeAA37/p/wvHA5K5FEaU0POqldqiPT
 UN05Tg+Y7CdezVmzJceAMao66mK76lAottWhM2s=
X-Google-Smtp-Source: ABdhPJx7gWb7OcbliEzfntnIGEdnWV57vEdDFocvxTag2X2x2sr+/HY9FPnYTr0rql8cJbgX25YUtYVaijS48HpsM3o=
X-Received: by 2002:a25:3cd:: with SMTP id 196mr1118415ybd.456.1616436903047; 
 Mon, 22 Mar 2021 11:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
 <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
In-Reply-To: <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Mar 2021 12:14:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
Message-ID: <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Mar 2021 18:15:13 +0000
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

Applied to git with some small modifications:

https://git.zx2c4.com/wireguard-freebsd/commit/?id=0a5c6abdfaa1f4f09269a222c1720e2ff3b8aa02

This will be in the next snapshot. And feel free to push other stuff
up to the repo as you feel is useful.

Jason

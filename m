Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9692EC433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAFD56192A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAFD56192A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d181c642;
	Fri, 19 Mar 2021 17:38:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2ebe70f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616175344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8BbOybg0wDqq73oNtkQYeu8UDUnkPv8v6Ntov3tXI5c=;
 b=IYEPIWiit/USdaJ9YNUZmMbv9h7o1/0pC0E9t+NgHfxQSStH7+obmySSk/05MCoqZgcheA
 BrF7M69IpTWGoYhrjhl/OTNbu5vawYfGyWM64MoievPSF5ZURtecPBp3Gu6P/04Q4j5+Zc
 sGUDdQ3ihy2Q44z5SY6K0yXgvEkKOOM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6cdebab2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 17:35:44 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id h82so7032884ybc.13
 for <wireguard@lists.zx2c4.com>; Fri, 19 Mar 2021 10:35:44 -0700 (PDT)
X-Gm-Message-State: AOAM532e0ENJ24E15KgulY86r7tEEybXWcLW65H0P0001Ug1F0WiDNy4
 Azc1z815jx1YeDzTZ8X6T+CLTRnHxgp5KO2spfs=
X-Google-Smtp-Source: ABdhPJzx+Z8/aBwwi2ZsaCKpeaXpjVl7pzSlaf3Q/5Xx9OkDQUnRw62DkqXqpG871skP9L7JsHdThIWQeB5nONXCx1w=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr7397040ybb.49.1616175344031;
 Fri, 19 Mar 2021 10:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
In-Reply-To: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Mar 2021 11:35:33 -0600
X-Gmail-Original-Message-ID: <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
Message-ID: <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: Frank Behrens <frank@harz.behrens.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 19 Mar 2021 17:38:42 +0000
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

Hey Frank,

Thanks for the patch. That looks terrific. One question, though:

Right now we have the `wg set wg0 fwmark ...` mapped to
SO_USER_COOKIE, as I'm sure you saw there. But maybe FIB would be a
better thing to use for that? We could adjust wireguard-go to do the
same with the tuntap ioctl.

Jason

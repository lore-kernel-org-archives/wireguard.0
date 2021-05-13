Return-Path: <SRS0=hD3P=KI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C82C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 May 2021 23:18:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50AD613E9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 May 2021 23:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E50AD613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc70f5b4;
	Thu, 13 May 2021 23:18:17 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b2e01f9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 May 2021 23:18:14 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id o21so26116946iow.13
 for <wireguard@lists.zx2c4.com>; Thu, 13 May 2021 16:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JjgTiaE/2GmT4fkf/D62K7Wlynj+BsnacjFdsJp47tg=;
 b=LSw3CcMIT07RvBvE+4jKyaW8lw2Cv0h0sEYqUkdehRROdbFsdXSZBQP+ymSRFSNwT5
 Y8ktl+NvxhNhns/Is/1PnKzcjiYwDEwV4vG+4qE4ILbR27e2MHw8NwhzGxNHhShePXe2
 z5KB4BW/2KJI2j7WWCaGf4QWAAJg+hZBTm8YeGjnP3LO4yjdQUDu4sWwYBj172Jqf+ne
 OxHerO/M9QTIgw8UtQtyeIikS6N7GWt/d9c0rja5oIkroZgjenf7G1r7hrRlzil0NMYI
 x+rRlFSlgzvxZ/evv0lZgqGE4GeTpUY16uHmn9TpUuDnk9FfEFVC2ORJOrsMwPU5/cWN
 Y/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JjgTiaE/2GmT4fkf/D62K7Wlynj+BsnacjFdsJp47tg=;
 b=L+GrS86cjzT9lNofgsyXjjTpn487W+JexeG4wYCQIUpg8Of8jBbwRa1QYc98diIHBf
 TfmClXWiCOPwctrRtAJAoZ93dZ+Mh5CglptN59LnylQTqt5XykUB4pK/2dwBuHTAAnLI
 BynlUEVv3EcBD0Nr+qBY1IhMm5uW9YObFMR5liIjWqn4dKqF/Zgdp64ZnMdPMQ6mH1J6
 NnYOCCaWAw3JUkLqA1KGfHAGwM9js4v0kdvRFXEiFtxOinz8Ff7AsYjuPLsS1P+8JNgc
 FrID7Jk1BjoLJgREVQZWWEqsaXUh5bSJRyAuXytA8+HSsZtlZ3QUIp4uWWRFCnaggqHy
 qFNQ==
X-Gm-Message-State: AOAM530NtvCgjzjBcsWjxBqfKfNChG7yRyogsA5JLuyRx42GlYUsjmDU
 zTTWbdhoFNOj4U9nY9OVwj9EYfgs16XMhSDuVyJ4v11ge0CGLQ==
X-Google-Smtp-Source: ABdhPJzRIuXOq/UNos9DfKGu/nMSHZNJfYSrsKkSLF8JyWLwS1BqXuVI2JoxY+D/b/HgTe59ZMRjOk3wG87YQjlAq3Y=
X-Received: by 2002:a02:83c2:: with SMTP id j2mr32144794jah.6.1620947892953;
 Thu, 13 May 2021 16:18:12 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Burkett <burkett.andrew@gmail.com>
Date: Thu, 13 May 2021 16:18:01 -0700
Message-ID: <CAONL4-+8aiE3tKUn04rp8Zjc=j8vRO56OxLk5k0MoE5aqtURbA@mail.gmail.com>
Subject: wireguard.exe no MessageBox option?
To: wireguard@lists.zx2c4.com
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

Would it be possible to add an option to wireguard.exe to output the
return message for the /install* and /uninstall* commands either to
stdout/stderr or a logfile? It would make it a bit easier to script
installation/management to not have to worry about a MessageBox
popping up with an error.

Thanks for the great software.

Andrew

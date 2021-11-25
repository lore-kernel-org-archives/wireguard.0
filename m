Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Nov 2021 16:27:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d219598b;
	Thu, 25 Nov 2021 16:27:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7c41fe9b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 16:27:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D85D604D1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 16:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lR5cfeTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637857663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U2kKtwKk5FAeiHCY5/6X2fUb7foFvi3+YLMNW8MtksE=;
 b=lR5cfeTpS1wd13olbrFY8CFt5KLLjEa7JCVvePRBPJ/X4ciI5wv29Fqgg/3qtah1SxdhHs
 bI6KgQo+Hhl4d2Nue7AW+mpwjLfk/FjC2rErEcfzrmFB52iNejTeuigTPs8GrSR7NIQypq
 cn6EkiF49n5nlaR59Ss2mEZvflUVf5E=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 69be8286
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 16:27:42 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id q74so13124274ybq.11
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 08:27:42 -0800 (PST)
X-Gm-Message-State: AOAM532G9RdV7ahosmY2xqN0jNz3HOy0RCvv/ObBBAqgDed2o+ZqYvk1
 unVva5tm10N27Ruoi8x8xvjvRlmp8XbwH33HpGA=
X-Google-Smtp-Source: ABdhPJzb8ub3whmRPlPU5m4S1UK8c/FEqQiwzRG5YFQc4H2tyQl8EiKfOe5YxSyaEqBGVKh33dC2eIT1gnB9pg1z45c=
X-Received: by 2002:a25:acd4:: with SMTP id x20mr8059275ybd.416.1637857661505; 
 Thu, 25 Nov 2021 08:27:41 -0800 (PST)
MIME-Version: 1.0
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
 <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
 <ccf4971633fdd62807ff51ddf7de1299@purelymail.com>
 <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
In-Reply-To: <406a9568-8f70-b222-4e08-23fc5884847e@ut1.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Nov 2021 17:27:30 +0100
X-Gmail-Original-Message-ID: <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
Message-ID: <CAHmME9roq+Qp7TFA4h3KZDuTd6DYJ68y2j9__MrX3+FDdtwVbA@mail.gmail.com>
Subject: Re: [Windows Client] Out of date Title scare my users
To: Bruno UT1 <bandry@ut1.org>
Cc: Diab Neiroukh <lazerl0rd@thezest.dev>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

> nothing in the title just the update tab.

If you find that an acceptable compromise, it's fine with me.

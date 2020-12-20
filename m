Return-Path: <SRS0=TH/E=FY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEC0C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 18:19:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8928622D5B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 18:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8928622D5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db380bb7;
	Sun, 20 Dec 2020 18:09:46 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b9af7eb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 18:09:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u19so7524950edx.2
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rf/pRRkMpJWC8MipXHM02tfkIdM14rKeYlFz0Jd74A=;
 b=pTMCABNsL2enmpp5MwKMPc8UWw5Wb9EZYXsJLHzVMq102duym7kINlewsBTGgFxi71
 7x6XMHCspq7r0bUKxpkCfF1miNVayTCVQO0Q4EXgFNhGC3VBPpJNb0YN8+Guod+daDEN
 cBw4OMu0Lsw9PHT32gqpznRcJfK57c8zW1oVkkHw3xUCO3szOV4QCKmq4GaDw2SyXEJ9
 +I91O8kiH4q0UabPw/Gw8d8eql1PVRTK+XRaw2+Uk69Xb5k4nZGwlMpu5AOSvR8lEbi8
 9Z83I+jVZrZ84kz8x+aPJo3P24dpZyBzGns1+WrVB27QoYcz8pWyW0OdV08k2beUVhC1
 44uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rf/pRRkMpJWC8MipXHM02tfkIdM14rKeYlFz0Jd74A=;
 b=mYI4QXOgs/y8f79ZwTDV3OFWYte9GWORYfWobpZiBnMyH1WTbUjO2Mh8N7GKtM0E3d
 G4VZ452ppN6YzjImnPXPxL9tQI/B+AnEgdKdYN23I7PO04rEAfp64Ayp0ObIxk97aypg
 NBTSwfajKISYpMoIzI+Y0CEz8xYpIb1+eu/XfZTZMi4FyMsJFm5wHnadhYp1/Bjh2vVt
 Tob6WVHqbpSyO7jLINdCZbhNegtlRO8e24foSr2naFoBDjkhHv0Xw6ygZB336EOykdfQ
 ELGDQ1TjVlAVoDHjVLs6Bgh/flYZ5pw760Mg+FqlWbabLnl2yWq6NbVTVF14wuWqUmLJ
 KpDg==
X-Gm-Message-State: AOAM530mmjaWqCX1K3D5GaY8lZn+EmNBCmnlNDDx7xzcgCQEcgd1AJ+V
 mNTx9HAAhyj1A2yo5Kb48iZ6bQbA7O+AaXUHw09PLfYtN6M=
X-Google-Smtp-Source: ABdhPJw/MTkyeezozo2DA2cxnXctn48nGKCx3qH2XX6W0eSOlN508rWrBUzJ9qabZlcymbPhs9P7vwdMKHQ5Xz527MA=
X-Received: by 2002:aa7:cd15:: with SMTP id b21mr6601344edw.114.1608488315066; 
 Sun, 20 Dec 2020 10:18:35 -0800 (PST)
MIME-Version: 1.0
References: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
 <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
In-Reply-To: <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Mon, 21 Dec 2020 07:18:23 +1300
Message-ID: <CAF-5T9EZ34sRrs=o8KiKUBbbUxLbbyZ0_RfOJLOpHcW4n_DbEw@mail.gmail.com>
Subject: Re: Default route on windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Jason,

I did it, but in this case, I got no Internet access

On Sun, Dec 20, 2020 at 1:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Add 0.0.0.0/0 to your AllowedIPs.

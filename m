Return-Path: <SRS0=kp4R=KN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57D3C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 May 2021 01:01:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7DF61073
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 May 2021 01:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7DF61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba0b470e;
	Tue, 18 May 2021 01:01:26 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b873a03e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 May 2021 01:01:25 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id s20so4129216plr.13
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 18:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6KYB5oBl4xt609eHF9ouXBWzy2uxx51Tvt4SmcPpzJQ=;
 b=Hk6EGCpvuLoKnlQ7htgSa46DWb+TMVzeRqb+rERucHWGQz6w2MC2BVVzw9301qDHNa
 8L05+zb27Q+Hygn3T6RfU2el4+Vfa2nrBR9Zp+7vnqphv18a9FyKhniCzakiEghtD5cw
 5znhjsAcbuDN1UfIy2cLPdq616UsqF25CSnN5RFfDcM+k8KQjUP1H18jMWzyVaRpMpUS
 aZuXqIHkJMZKvr84/SH9vK3CFDFHNyv9NrW05pAjW2LYXOzUFikZlrENjtHh74xF/Ch/
 FaCL2qA+udTWW28YDawmWPejKt5nRU3LVkkWQHN+57NoDUhesGOzbR7pwzal5mL0xcQX
 Bckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6KYB5oBl4xt609eHF9ouXBWzy2uxx51Tvt4SmcPpzJQ=;
 b=jERKNytSk2t3eWgcQIc4CJCtZS3wxsfvN7ccn0iJcj03ttwMjf3ZX8GPFxLwci53vF
 S63z8z32Ik9p8GZ8KXw/Y+WLhsHysZH/e7H4HiUTHnL1Plvx3H7cS00gGN9UXqee4e5T
 lPpoIZexCfqP7+LxwuaRCYf9XC0PAb5ShyQCakU/2p4ghgpmN6UEtRooS1TG7x1I/9OB
 T1ju6pd4OmfoO+d5ffH2fR5jkV53kDSiinh0/hdVfSp8MbuR1LK2g1Vr8YrrxzNx25My
 wOGjnzS1yIYIvt2dFT//5v0wK80iEbpCFVrB9YD2nOzZxJ5kRqeACHz8iYXKmx2769Se
 g79w==
X-Gm-Message-State: AOAM530BD7EHgePhHsiFsSOS7Vg+AmVWSTkJqqu56v0YUUWku+84YfCu
 J9M8YWWbdWy8Aorff+tAzcI=
X-Google-Smtp-Source: ABdhPJzy6IDCqaBK0M1myQcVL4f/3c3SnRtaDu1nF5g08pSGSm6M1r/dx0uOKJAL/Kh1IaFLPBKTbg==
X-Received: by 2002:a17:90a:f98c:: with SMTP id
 cq12mr2062454pjb.235.1621299683450; 
 Mon, 17 May 2021 18:01:23 -0700 (PDT)
Received: from Leo-laptop-t470s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q9sm475373pjm.23.2021.05.17.18.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 18:01:22 -0700 (PDT)
Date: Tue, 18 May 2021 09:01:12 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH wireguard-tools] src/show: remove dead offset check code
Message-ID: <YKMR2CAYY9T2P/O6@Leo-laptop-t470s>
References: <20210517091053.886157-1-liuhangbin@gmail.com>
 <CAHmME9rj1dJPNneAuKB3Vx7yXUGoz5aZDD8bR53dTc8yJAUN6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9rj1dJPNneAuKB3Vx7yXUGoz5aZDD8bR53dTc8yJAUN6Q@mail.gmail.com>
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

On Mon, May 17, 2021 at 11:44:08AM +0200, Jason A. Donenfeld wrote:
> The compiler will optimize this out, right? In which case, I like the
> consistency, in case lines are ever reordered or copy and pasted.

Not sure if compiler will optimize. I just got the complain when do covscan
checking.  I'm OK to keep the format.

Thanks
Hangbin

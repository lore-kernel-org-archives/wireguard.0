Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F6ECAAD2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Sep 2022 05:40:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9536f77f;
	Thu, 1 Sep 2022 05:40:22 +0000 (UTC)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 522347df
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Sep 2022 05:40:20 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id 67so16681326vsv.2
 for <wireguard@lists.zx2c4.com>; Wed, 31 Aug 2022 22:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=hKuWVq3me8/d/LCtV55GFKDWCD9vC9D8uRSnU+6fZ68=;
 b=OMH1RxztRfCFTI77W9SYppghefz9+6zrW0E1KZZLnh5qC+CtJobPgtab5Ba7faQhtN
 kOkGJTjdas7BmcKsd/kNpTjkzzaMcc42jRv+Q9P+UvRu0yBlVDSDdlxKUakngqvtZgwG
 8+0BkD9doNr6i8Q1254Yw5PDJ2CbSzbHYpHLpsII9rY/Qn6nBHPKJMEsQniqbfCmctbu
 57baKX9128B+veMEiffmwLVqkZIkYafv8jT5TWUWRRAmpTXTHVm8TuPWIEPa7ug5f6sU
 qJk1R577Kee3MejbTXMKDMRkID4bM5pGFyf/nFDwZf9/u2Rh4IyAJKTr95KCWFBkXmkh
 J0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hKuWVq3me8/d/LCtV55GFKDWCD9vC9D8uRSnU+6fZ68=;
 b=C5Cvk5TeUkh7BFfdHezIam8b+t/vLu/vXPdvz2mV4/WkD3UiPycLn/U3oKEaLWpDir
 ezGP1DYRLULBxescfZyZn+HFTuK0ng9sn9oPexU2q526IJXkmdz277aGj/XAlt8Pq3NQ
 eAXFkEdOPfKFfJZhm1r3Q61Wg2tvwkNs9rMElcly7GGCtYecpIziRZh9troA7TFlBy5j
 Ycdr7U1QkULsv+8+9G8yViDJOh+ll4P+eucqFbdOEodw4Am+7lYyaTvUpQlVhi4zGP6K
 5Xh3N8SQPo7vCnJk+dLKr/2DgmbF5AkSO/93So8mrgh4cjMy1ouHSVu7C/zW5x9D25c7
 9Gtg==
X-Gm-Message-State: ACgBeo2T8XFMgdU3l+57dp+NsY6F4y+Vp/WX+TlxaoZjtIFmGMsABUD3
 6X2BfJUBXOCvkE7+6kwwWSG5DFlL/1t6dJeGA+E=
X-Google-Smtp-Source: AA6agR4J4x6g3CqcxTpMvHiF0WNOIWun4x+nlj+G2+InhBG69qa7JUOg0zjWbhjS0URi1wZAv5gv5Rdr0LFwNWGGPuk=
X-Received: by 2002:a67:e083:0:b0:391:df54:ed3c with SMTP id
 f3-20020a67e083000000b00391df54ed3cmr3773233vsl.45.1662010819458; Wed, 31 Aug
 2022 22:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
 <YwzmY6Q/lJIDZyfz@zx2c4.com>
 <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
In-Reply-To: <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
From: Michael Pro <michael.adm@gmail.com>
Date: Thu, 1 Sep 2022 08:40:07 +0300
Message-ID: <CAA+Mow5Pq7MBUCxvnTUsdnBhwduVh-VywFLoyTNy4G65XcAyvQ@mail.gmail.com>
Subject: Re: FreeBSD current socket-src changed. Wireguard not compiling.
To: Ed Maste <emaste@freebsd.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 kevans@freebsd.org
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

FreeBSD Current (14.0)
http://ftp.freebsd.org/pub/FreeBSD/snapshots/ISO-IMAGES/14.0/
sources from iso or github - no matther
Changes to src are made by commit e7d02be19d40063783d6b8f1ff2bc4c7170fd434
Author Gleb Smirnoff <glebius@FreeBSD.org> Wed, 17 Aug 2022 21:50:32
+0300 (11:50 -0700)

=D1=81=D1=80, 31 =D0=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 21:18, Ed Maste <e=
maste@freebsd.org>:
>
> On Mon, 29 Aug 2022 at 12:18, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On Tue, Aug 23, 2022 at 12:26:21PM +0300, Michael Pro wrote:
> > > Tonight after updating kernel freebsd current I got coredump with
> > > wireguard enabled kernel module.
> > > ...
> > Thanks. Is there a __FreeBSD_version__ change that corresponds?
>
> It is not an exact match, but was bumped to 1400066 shortly after and
> should be a suitable value to check.

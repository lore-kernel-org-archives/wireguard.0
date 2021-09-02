Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54322C676A8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 16:28:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85AFC6109E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 16:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85AFC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9df2350d;
	Thu, 2 Sep 2021 16:26:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4845fa11
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630599991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ac8kYAedvMbpCDMJNz7WcA7klkjbd/VRKdd8BwA7jsw=;
 b=Xhol3IOi5ehaaq0hjq4bWadR267wN8Usm+ukRujXnBsNNSlvQHjgE8TBwi1tDpUPsmb3aQ
 wWS9EcfOjX0qX1ceOixf1kte/FSVBvR0EmE2MIqtd+6GtVCZyIXKlDZl2wlUYqJn/uD9PC
 wsu8eLstTTS/OBWSXNF23S8fna/OJGQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-YHb1IJ9yNceYDvdzARcJAg-1; Thu, 02 Sep 2021 12:26:29 -0400
X-MC-Unique: YHb1IJ9yNceYDvdzARcJAg-1
Received: by mail-ej1-f70.google.com with SMTP id
 bo11-20020a170906d04b00b005d477e1e41fso1189778ejb.11
 for <wireguard@lists.zx2c4.com>; Thu, 02 Sep 2021 09:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ac8kYAedvMbpCDMJNz7WcA7klkjbd/VRKdd8BwA7jsw=;
 b=iX0Q4JArSWwshBSbitJR2DqH531LaPOeMkdvUooDcAzH05vQjUmt6mdGmJwVGltr1/
 O5mQ7+u4uK+NbNxzEn8dn8Jw2HB2PmP8LlpueVO5BKZOMzoo288XVx6SSAgjVEH9zMtv
 zlqyyDE55gE3NXZnH9aAVBxnwumcWMMQ0HcBs1P4ANxrfOH/ffTq4ryumVFZGzCBVvv9
 lal7e0NfqgYbq3twIeiYkk37FdHYw+Gr+A4VVPHBbn+qzTgVpR1LPmlPaVMF35P0RVg5
 kPRxheU1L5ks9HlBQieFkCG2J8vFyp5qhC8UY2KqRn4azsCFt7e9AL85H+eKTTv7Kau4
 nTsA==
X-Gm-Message-State: AOAM532rf+lN7tYUniCrKc58/162YXbMEdvn6fR7sJOplDTwxN1LgDaR
 QQ8q4ViUlbViKONC8UaLWeBHzxv+EXiNbn9VRIbtJRZ7OQJKimQfptNhkklfkGPbMAQlrZ+9XsU
 gHLZPzpqByLNKCnX6Vm5T
X-Received: by 2002:a17:906:d1d1:: with SMTP id
 bs17mr4560403ejb.198.1630599987643; 
 Thu, 02 Sep 2021 09:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyluie7thMHBOxkhpwcIZgyOR2wpOHSgqI0JoSnmxC7CmPRGdZT/Hm2z8vESQeFG7u03d4PJQ==
X-Received: by 2002:a17:906:d1d1:: with SMTP id
 bs17mr4560288ejb.198.1630599986024; 
 Thu, 02 Sep 2021 09:26:26 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id mb14sm1422229ejb.81.2021.09.02.09.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:26:25 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id BC9BF1800EB; Thu,  2 Sep 2021 18:26:23 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, Xiumei Mu
 <xmu@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com
Subject: Re: [PATCH net] wireguard: remove peer cache in netns_pre_exit
In-Reply-To: <YS+GX/Y85bch4gMU@zx2c4.com>
References: <20210901122904.9094-1-liuhangbin@gmail.com>
 <YS+GX/Y85bch4gMU@zx2c4.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 02 Sep 2021 18:26:23 +0200
Message-ID: <877dfzt040.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi Hangbin,
>
> Thanks for the patch and especially for the test. While I see that
> you've pointed to a real problem, I don't think that this particular way
> of fixing it is correct, because it will cause issues for userspace that
> expects to be able to read back the list of peers for, for example,
> keeping track of the latest endpoint addresses or rx/tx transfer
> quantities.
>
> I think the real solution here is to simply clear the endpoint src cache
> and consequently the dst_cache. This is slightly complicated by the fact
> that dst_cache releases dsts lazily, so I needed to add a little utility
> function for that, but that was pretty easy to do.
>
> Can you take a look at the below patch and let me know if it works for
> you and passes other testing you and Toke might be doing with it? (Also,
> please CC the wireguard mailing list in addition to netdev next time?)
> If the patch looks good to you and works well, I'll include it in the
> next series of wireguard patches I send back out to netdev. I'm back
> from travels next week and will begin working on the next series then.

Ran this through the same series of tests as the previous patch, and
indeed it also seems to resolve the issue, so feel free to add:

Tested-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

-Toke


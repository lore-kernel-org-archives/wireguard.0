Return-Path: <SRS0=rqdY=NZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6304C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 13:10:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163CE60E52
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 13:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 163CE60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aef1b51;
	Fri, 3 Sep 2021 13:10:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8595cbb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdJi3DfTaxZifAGejUa63MN7zsGNDj/aFYim+6FiDeE=;
 b=KnRBAaou3ZxueXK7lY8B0wGlgCHwOaiJcl6GFsUy/pb3ZJvNSfzbcptL9fCYeDSW2hkVli
 Wbv3/fNiiTD3/q+mBnqSqorR7eGbo5YlbL6ZX66/VuTX7CCE+aqaGU7yxiwFB+4tMqPL9Y
 iWJvzxKsf4gzvPj06sQ0XM/Js25IFqU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-1fKPWlHTNg2l6Vaqnd_SYg-1; Fri, 03 Sep 2021 09:10:42 -0400
X-MC-Unique: 1fKPWlHTNg2l6Vaqnd_SYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 a23-20020aa7cf17000000b003caffcef4beso2735710edy.5
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 06:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NdJi3DfTaxZifAGejUa63MN7zsGNDj/aFYim+6FiDeE=;
 b=jhgc8YHW2SOWwsnRf8CxPnOYTaK+Tb1WsNHIOclIsrgMPkhUjOzMTvAMJpHwOYb+iW
 zrYEnkiNrcL09TzIdwfPRH5l3M7uRbGXX0us9X1Nowxq/s/LKHAOoYUAOiXAtS5q2zqS
 zfbFpBzDLmD5i6al5AkcQnqicqL1tS//W71Zrp+qPHia2tfk5OSqB/zkNpzo0UDWLCXO
 O+Wyf/4Hd5Um2LknK50yKM525m5A8btuy/KujBtdQCyeql78bs+QQ0K4G5dzWhbbUGQO
 +3iUrq5IOoo7kSrbe5DICb+gaw3DRET23xzVqGBCtEDZLC41bi2NewRUdQBCbYwYyN4N
 dUfQ==
X-Gm-Message-State: AOAM533gvhBqEoXfhYEAlKW8O4F99GasHx9ARoW6767X/vQ076tv3b84
 11/2kbY8mAuUOJBZO5rEUIp8uw/X6YKbIHhiG0ltJn35GfNgeMb7gmKaN2kyVCl0ga3esRZdYIY
 gAUR3Namg9KZh7lHJvzjw
X-Received: by 2002:a17:906:e8a:: with SMTP id
 p10mr4064728ejf.265.1630674640604; 
 Fri, 03 Sep 2021 06:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO0dOkNnbHgz/Kkaj0Zn4EuJ+1cwoPQ8XckLrxVQ3MKPnSGddN0iaeoeTNx7y9tONuno2Gcg==
X-Received: by 2002:a17:906:e8a:: with SMTP id
 p10mr4064625ejf.265.1630674639391; 
 Fri, 03 Sep 2021 06:10:39 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
 by smtp.gmail.com with ESMTPSA id se22sm2782869ejb.32.2021.09.03.06.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:10:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id F274318016F; Fri,  3 Sep 2021 15:10:37 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org, David
 Miller <davem@davemloft.net>, Xiumei Mu <xmu@redhat.com>, Paolo Abeni
 <pabeni@redhat.com>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH net] wireguard: remove peer cache in netns_pre_exit
In-Reply-To: <YTISE6AI3y3Le9ww@Laptop-X1>
References: <20210901122904.9094-1-liuhangbin@gmail.com>
 <YS+GX/Y85bch4gMU@zx2c4.com> <877dfzt040.fsf@toke.dk>
 <YTISE6AI3y3Le9ww@Laptop-X1>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 03 Sep 2021 15:10:37 +0200
Message-ID: <8735qlst2q.fsf@toke.dk>
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

Hangbin Liu <liuhangbin@gmail.com> writes:

> On Thu, Sep 02, 2021 at 06:26:23PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Ran this through the same series of tests as the previous patch, and
>> indeed it also seems to resolve the issue, so feel free to add:
>>=20
>> Tested-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
>
>
> Thanks Toke for the testing during my PTO. I will try also do the test.
> Toke has all my reproducer. So please feel free to send the patch if I
> can't finish the test before next week.

You're welcome - yeah, I ran both the scripts you provided me with, and
Jason's patch fixes the issue in both :)

-Toke


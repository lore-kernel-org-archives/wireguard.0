Return-Path: <SRS0=XOuh=6M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F27C83000
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 09:01:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8202064A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 09:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UxJdrc1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8202064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9352b022;
	Tue, 28 Apr 2020 08:49:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4688ebc
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588064435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxW1qjTd1LnOPfoDLRudR3VIiE6OpaYI7Q4WCzEXVWs=;
 b=UxJdrc1GBAZTo2Nn2G5He3bTAXRM6UZl5UeGDNFHgAkcXkPoPb/h03BKjmEXa3gaEwIIrg
 n3wwVlZqNv7ivApUaCIKNrxxG5x+697spqrepG7gI/8SLS6s7oL6UO+5klSD5gQD/6ikb8
 +ZHNI3GqA6wifAzf/rRmOEr2rKjR2A8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-PT1mNFGhPumULtCwk3R1-w-1; Tue, 28 Apr 2020 05:00:31 -0400
X-MC-Unique: PT1mNFGhPumULtCwk3R1-w-1
Received: by mail-lf1-f71.google.com with SMTP id 85so948006lfa.7
 for <wireguard@lists.zx2c4.com>; Tue, 28 Apr 2020 02:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=mxW1qjTd1LnOPfoDLRudR3VIiE6OpaYI7Q4WCzEXVWs=;
 b=fPXw0b5GlbUpLjJ1gCjk5+xUoQ6Dh5YpG5vOYumw/nv3bKE7cKTd7rThoQj4Mqa48Q
 fZp5Bt2mu73Hb47LQQTgtpLOdBuG0sgAk6GspHRmcUjSCu1J/WbOhUVLCsJWzHfPYLEN
 oDJlNXFbeppe+8lZz2qksrA+7IXQN1Iovr1UoWjhcoGLRpxF0VNj/N/ext4NbjwaBbJM
 ahhdfNoAKU1mGsi833WsPmLSD2Q9jqK17usNOpYfmEIGt690KI6V3sYQ3pp76nfdJWx7
 gANOFkt1+uTT+Y9r4DWIWUMmqii/CMhrwJnmSnBEgHcj1+kM45lQswoiqEnNNAPzckGf
 vLPw==
X-Gm-Message-State: AGi0PuZMpS2LX6buYs3Xp+PCyAyDxIO6WL925VTwxKghK3FzEWP34MiK
 YvNnM1clArwjDSP+POTqrJ7PEuoJClwApOFueG+VEd007lXa5dCiPPG3tflG/OCxvAgsIZiJ1dh
 WVMYChtA2lcK1cK4kDCHg
X-Received: by 2002:a19:c8cf:: with SMTP id
 y198mr17598087lff.197.1588064429243; 
 Tue, 28 Apr 2020 02:00:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJXUUxwttVHq7AAC9XoXgii6tIs1XnC+5s+SRp3/FGEun1yAR8w5nWvnrB5FohYfFlPeUbukg==
X-Received: by 2002:a19:c8cf:: with SMTP id
 y198mr17598071lff.197.1588064428955; 
 Tue, 28 Apr 2020 02:00:28 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id o22sm12399636ljj.100.2020.04.28.02.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 02:00:28 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 5C3AC1814FF; Tue, 28 Apr 2020 11:00:25 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>, "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
Subject: Re: [PATCH net v2] wireguard: use tunnel helpers for decapsulating
 ECN markings
In-Reply-To: <CAHmME9rUCYuBCFbw=yhNPqDDJWD3ZUQ_R9xjQ-yp6DXA9_iScA@mail.gmail.com>
References: <87d07sy81p.fsf@toke.dk> <20200427211619.603544-1-toke@redhat.com>
 <CAHmME9rUCYuBCFbw=yhNPqDDJWD3ZUQ_R9xjQ-yp6DXA9_iScA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 28 Apr 2020 11:00:25 +0200
Message-ID: <874kt4x9w6.fsf@toke.dk>
MIME-Version: 1.0
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

> On Mon, Apr 27, 2020 at 3:16 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
>>
>> WireGuard currently only propagates ECN markings on tunnel decap accordi=
ng
>> to the old RFC3168 specification. However, the spec has since been updat=
ed
>> in RFC6040 to recommend slightly different decapsulation semantics. This
>> was implemented in the kernel as a set of common helpers for ECN
>> decapsulation, so let's just switch over WireGuard to using those, so it
>> can benefit from this enhancement and any future tweaks.
>>
>> RFC6040 also recommends dropping packets on certain combinations of
>> erroneous code points on the inner and outer packet headers which should=
n't
>> appear in normal operation. The helper signals this by a return value > =
1,
>> so also add a handler for this case.
>
> Thanks for the details in your other email and for this v2. I've
> applied this to the wireguard tree and will send things up to net
> later this week with a few other things brewing there.

Thanks!

> By the way, the original code came out of a discussion I had with Dave
> Taht while I was coding this on an airplane many years ago. I read
> some old RFCs, made some changes, he tested them with cake, and told
> me that the behavior looked correct. And that's about as far as I've
> forayed into ECN land with WireGuard. It seems like it might be
> helpful (at some point) to add something to the netns.sh test to make
> sure that all this machinery is actually working and continues to work
> properly as things change in the future.

Yeah, good point. I guess I can look into that too at some point :)

-Toke


Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09461C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:14:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFCE21527
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7fvTs+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFCE21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e2ee59;
	Wed, 17 Jun 2020 23:56:15 +0000 (UTC)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a49e0bf8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:45:31 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q19so1299451eja.7
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=n7fvTs+/AIa8pMpfW6aPzMLlPj+Dgki9bUAxy/WJhTzuhCBbd+H1VjHgPGq499Rpv/
 5d/Fu/pYEKH1b6nUOp+B/0rVShHG5a3F5X6E9yohIERXhGRB+jfz7fG7aLScoIpx8e+F
 hoa3YKo1A1lDCasydfb4WIy1UyVUOIk9DfVXXMnVNv4WGz8gFNusqZ8XbJsGTDUN9Fqb
 G31mdXjKpT3KyemJTlD9XocjfZeFc/GyLV2zWtdzsLpQAbvFvS3y1YSYDd18MIgGQFXl
 /yNkjvwU7T7hVY2TKYobQ4wa9+HTev7V+Zm0ABk5R4hLFzxjXuIxIeh+PmN3kmrE6ePT
 RYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=Yos2o0MhU6QYWw8a0g0p+zvWIpKcfkTM1ae44Mg2XyE2if1xTBUs7/lin2HyOYGc1v
 JoBX20kE0BJ+4c3OCJ0ps1yY2G9ByvIdb3nfLnrjSc5GXUowsm+D1hgB0XC8lFThOwYw
 oZh5oYBDXERvzmoyBlRv1rMWKA+QH9kAW6G15MChAoJH8af+v7gp6NaSlvvsLiFgE7sZ
 6FSEs6oLz+dsrsOAOQXZF6XSGAjS5KXMY2T+wdOflvdu/wuL4C16FID0Ws9PkMAQQhvt
 NzokxDGSQcmryT0jvZUdaqGiT9IDC1vrwZJuYc8ZRKp65wuXbcMin91Y+hfenAWEgd9v
 MqcA==
X-Gm-Message-State: AOAM530rjkOcxQffKUWnUkhbji2JOhy6WI4HmONsdRLBjqI+e2m27moM
 gZTDosKWhIisqO4jB5SaRrg=
X-Google-Smtp-Source: ABdhPJwEiLAyKqBWSBg/9gW1RJJ++WW+xletvVfauJvMuZRCPanBDVczGoSWbdvhRqSEjwIJMjoADg==
X-Received: by 2002:a17:906:1149:: with SMTP id
 i9mr6779545eja.100.1592381013809; 
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Received: from [10.31.1.6] ([194.187.249.54])
 by smtp.gmail.com with ESMTPSA id n16sm12971271ejl.70.2020.06.17.01.03.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
From: Jo -l <joel.voyer@gmail.com>
In-Reply-To: <20200617003711.GD8681@bombadil.infradead.org>
Date: Wed, 17 Jun 2020 10:03:30 +0200
Cc: dsterba@suse.cz, Joe Perches <joe@perches.com>,
 Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Rientjes <rientjes@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-ppp@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-wireless@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 ecryptfs@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-nfs@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29829792-2C3E-44D1-A337-E206F1B6C92A@gmail.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Thu, 18 Jun 2020 01:56:13 +0200
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

Bonjour,
D=C3=A9sol=C3=A9, aucune traduction possible,=20
En fran=C3=A7ais pour comprendre!
Merci
slts

> Le 17 06 2020 =C3=A0 02:37, Matthew Wilcox <willy@infradead.org> a =
=C3=A9crit :
>=20
> On Wed, Jun 17, 2020 at 01:01:30AM +0200, David Sterba wrote:
>> On Tue, Jun 16, 2020 at 11:53:50AM -0700, Joe Perches wrote:
>>> On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
>>>> v4:
>>>> - Break out the memzero_explicit() change as suggested by Dan =
Carpenter
>>>>  so that it can be backported to stable.
>>>> - Drop the "crypto: Remove unnecessary memzero_explicit()" patch =
for
>>>>  now as there can be a bit more discussion on what is best. It will =
be
>>>>  introduced as a separate patch later on after this one is merged.
>>>=20
>>> To this larger audience and last week without reply:
>>> =
https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.came=
l@perches.com/
>>>=20
>>> Are there _any_ fastpath uses of kfree or vfree?
>>=20
>> I'd consider kfree performance critical for cases where it is called
>> under locks. If possible the kfree is moved outside of the critical
>> section, but we have rbtrees or lists that get deleted under locks =
and
>> restructuring the code to do eg. splice and free it outside of the =
lock
>> is not always possible.
>=20
> Not just performance critical, but correctness critical.  Since =
kvfree()
> may allocate from the vmalloc allocator, I really think that kvfree()
> should assert that it's !in_atomic().  Otherwise we can get into =
trouble
> if we end up calling vfree() and have to take the mutex.

Jo-l
joel.voyer@gmail.com




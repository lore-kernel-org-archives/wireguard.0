Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E2DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 14:58:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29FDD22262
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29FDD22262
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 735d7c2b;
	Tue, 5 Jan 2021 14:47:39 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d2d4c58
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 14:47:35 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1609858711; bh=OSBT8mlMLgg/D+xiGXF/qV6iLXYRs6HjBOc3uHBRVCw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PF2znJAO4is2Jt+ZzN3SkFoei1sXD+vQk8yp9V4ebCobeLfVMtcwDQ0JCnGBu25rT
 V5xVb1xqnQjFdFzc5DPgxUSaiiEvA++KaLp+8P+J+9bTphDoMLkHhccn/KJdb2988r
 LGztOVtVGSaspjrAcrQWzH1ImoGGkhh/PZcahEjn9hfG4CiIJ0zVadQ4/PbpTL1Dgu
 GxnVQNVvSUYYDAcFHuoCUyoaVnwJfzmQv2gvuJQrh61QCJ5P6sbFrwieRVhGmxHVJr
 UXAC/4hboGacKa+vgSBN9O/1BZMRL6mVsHKSSd05PivKZResPt4frFL0nlBZ6rJ5Vl
 OOwa7uM5W/wRA==
To: noloader@gmail.com, Silvan Nagl <mail@53c70r.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard not available for CentOS Stream
In-Reply-To: <CAH8yC8kwtW5qMM=vZxLe1VTKwtqy76u4SP8Vtib_nhpdpBWJag@mail.gmail.com>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@53c70r.de>
 <aca7e86f-0c1b-a2c1-7508-67650c5f8806@53c70r.de>
 <CAH8yC8kwtW5qMM=vZxLe1VTKwtqy76u4SP8Vtib_nhpdpBWJag@mail.gmail.com>
Date: Tue, 05 Jan 2021 15:58:30 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87sg7fa0rt.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

Jeffrey Walton <noloader@gmail.com> writes:

> On Tue, Jan 5, 2021 at 8:06 AM Silvan Nagl <mail@53c70r.de> wrote:
>>
>> Thank you for this information.
>> Since Stream is more or less like a very old Fedora version now I am
>> convinced using Fedora Server wont be that bad at all.
>>
>> Gonna test it soon.
>
> Yeah, I think you'll like it.
>
> I got tired of dicking around with all the breaks and workarounds
> caused by Red Hat and CentOS antique software. I also did not feel
> comfortable with abandoned kernels.
>
> I don't understand how Red Hat or CentOS can provide a 2.6 or 3.10
> kernel in good conscience. Even the kernel folks tell you to use a
> modern kernel, because those old kernels get no attention. The new
> kernels get the bug fixes and security updates (and include the bug
> fixes of the old kernels).

The version number for RHEL kernels is completely fictional. IIRC we
backport 1/3 of all patches in each new kernel release, but keep the
version number fixed and do an insane amount of engineering to keep the
internal kernel ABI stable in spite of the backports.

We can argue about whether this is a reasonable thing to do in the first
place (and I'm not sure I'll actually argue that it is), but it's wrong
to think of RHEL kernels as "ancient with no security updates"... :)

-Toke

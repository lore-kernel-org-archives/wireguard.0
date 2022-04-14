Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE48DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Apr 2022 12:25:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f66fd899;
	Thu, 14 Apr 2022 12:25:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7e36c1f5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 12:25:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36C2FB82932
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 12:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0133C385A5
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 12:25:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="RNE5M1wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649939110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gBVmdiWCorX+uFvVK0ZqpWTuLJLgfbGSk7tZCswLl78=;
 b=RNE5M1wf2/YjR+JQHXbENyhld4PfTtIIYyr2Qy/e4iZCBnty9HHvL7Gn6AlLPqGQlM2oXM
 SaQarrfkj0U4fTDm+yEsPl5wFd1c0ohyS2hy8BhHs/4bczKwqRnS/PoSOA07nbDq6ja1Xw
 A0ALvGhB3dgjwVfPAceq83wZLx1thmo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 77dddd7f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 12:25:10 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2ef5380669cso36413837b3.9
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 05:25:09 -0700 (PDT)
X-Gm-Message-State: AOAM531pkdmzhkAlrdEbA82eWsIgO4cgSA2Yj888Si2P+XXSrVedevj7
 5xdBJulwbpvc+ObIhwq43/E5nbuK6zLB+UC4mRY=
X-Google-Smtp-Source: ABdhPJwuXVwCOKYwo+QibHTqhc4CQkpMy0JUNQFxa2fDln4GPipK4lWG3ymV2zEjTuR9mbtmrUzmfm+JjujJJoGgoRc=
X-Received: by 2002:a81:1e81:0:b0:2eb:cdd3:20ee with SMTP id
 e123-20020a811e81000000b002ebcdd320eemr1735758ywe.396.1649939108475; Thu, 14
 Apr 2022 05:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220414104458.3097244-1-razor@blackwall.org>
 <20220414104458.3097244-3-razor@blackwall.org>
 <CAHmME9ouN0O-mfi4d_xVon_SxzE4hbzdD0Zm8hRLS4k5C3dPFw@mail.gmail.com>
 <2607574b-6726-6772-7921-84156393df95@blackwall.org>
In-Reply-To: <2607574b-6726-6772-7921-84156393df95@blackwall.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 14:24:57 +0200
X-Gmail-Original-Message-ID: <CAHmME9pmK_5aSy9CVbFmFYc7RSK8g44NVGQb2thbrz+u6YFPYQ@mail.gmail.com>
Message-ID: <CAHmME9pmK_5aSy9CVbFmFYc7RSK8g44NVGQb2thbrz+u6YFPYQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] wireguard: selftests: add metadata_dst xmit
 selftest
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Netdev <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martynas Pumputis <m@lambda.lt>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
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

On Thu, Apr 14, 2022 at 2:12 PM Nikolay Aleksandrov <razor@blackwall.org> wrote:
> My bad, I completely missed the qemu part.

If you're curious, by the way, there's this running all those tests
for every commit https://www.wireguard.com/build-status/

Jason

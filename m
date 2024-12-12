Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659CC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:43:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5399809b;
	Tue, 20 May 2025 19:35:26 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce61318f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2024 13:06:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso6030165e9.0
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2024 05:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734008800; x=1734613600; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqYxTqAiECe9wyyAXaPuVyEXlxRKQjZazVAEQa5Qpbg=;
 b=OfWNvyk+GpiOQlQC0xuLgTFfDomP+N8zs1f0u/D24bB3M9TyulMyzIcrGKCrg5RvSq
 jhqViv4ZGYM5PMkxYtIh4gOuOVRjb76a6/QqX8JbcGKjbm6J5LBsshil4SIxR99P252l
 WuxpJBSQBilUrdHS3V6zDPu5XJlcBsPBSyOjPYc2sQ+KyOZn802mMvjOZXJRTGJclVae
 eMuf3ujMgadZd5+qitGzqvi5nS4hxxK+Rqh3pgHR8fdADrG3lW0Jaztd9MvBdDMn35kR
 DFXPGKTOIfll/BVjqmFZozQB5GB54aD2flHIaUX8e/gxbemM0ENBnTyivsAED0w0A/Ig
 7Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734008800; x=1734613600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqYxTqAiECe9wyyAXaPuVyEXlxRKQjZazVAEQa5Qpbg=;
 b=gUA2vKCL+pjIK1zXkB96qvO6dBe4WDYyAiqQI7osQx5YR3n3n2lYW11bIQt8Cm4yjF
 rGcYQxxpT9Q21ZLkMBcKVtgF0qAwP60k1HTIg+O0q65ILjRJYaALRmFmPyerO32/3Nep
 HTAV2agvv+SdY7Gunvo0tF/VxXa7HwlYNrVYJYaAyVR4lX8yKROZ5BKfjWNdVuKK6u07
 N2LFky5efk0Gvrr8uvkDUYv0yMakWQXkMMtP2vdM9h0Gc365RzfILwzWIQv8gQGbxzX0
 CqTsyDPdCqTKNWW/ggsgeEN5Ki0zsiOTdTMnON3ONOib47nXoDwbNo7ShgiSSacoXWll
 oN0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnIwlzUXSf8jH+S/axarLPwhAXcd0jOwekCq5U4gACqfSvVmN1sV6HQXXqH51xPeumDtGG7Cf4RVU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw1ZaVqWAAMFzYODA9Ro3R7NozYggV101CwP24rZBG4ixiMxGXW
 CYt0XKUlAR52RgkttxuBsurTwWNYo+Jk2h3TTDBjRF4KGCpFPpkjm4JgUT/DznUHy2c0XtKbqQL
 epobq82Ryyg9KD6mkQx3x4+SkzoI=
X-Gm-Gg: ASbGncu+J8lLSlHSq4uPvot3yiZLzX/rYJfgc3YUxZqiviBCZt2qH2oVIZ5UDP7XG/U
 QmvfJ9ddK9cJETi2if2hXF5pXJUmMvfFCShV2
X-Google-Smtp-Source: AGHT+IEgToBDxS7Y2rJTQaW+KRxkcbBuEM1S3SQpzBBgB7EfM9NZPQ+SlbrHysoSI6mEreAZ9kYV8K51n0HSyiFVXHg=
X-Received: by 2002:a05:600c:3acf:b0:434:f8a0:9dd8 with SMTP id
 5b1f17b1804b1-4361c345006mr53002405e9.1.1734008799513; Thu, 12 Dec 2024
 05:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20241209140151.231257-1-shaw.leon@gmail.com>
 <20241209140151.231257-6-shaw.leon@gmail.com>
 <4a2fe99a-772d-4df1-a8ef-14338682b69e@redhat.com>
In-Reply-To: <4a2fe99a-772d-4df1-a8ef-14338682b69e@redhat.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 12 Dec 2024 21:06:01 +0800
Message-ID: <CABAhCOQnMGm8y5bVj_fg5veJqim1PEEa02oZHqFt7ZPEQMpFzw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 5/5] selftests: net: Add two test cases for
 link netns
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, 
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org, 
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com, 
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org, 
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Dec 12, 2024 at 5:40=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 12/9/24 15:01, Xiao Liang wrote:
> >  - Add test for creating link in another netns when a link of the same
> >    name and ifindex exists in current netns.
> >  - Add test for link netns atomicity - create link directly in target
> >    netns, and no notifications should be generated in current netns.
> >
> > Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
> > ---
> >  tools/testing/selftests/net/Makefile        |  1 +
> >  tools/testing/selftests/net/netns-name.sh   | 10 ++++++
> >  tools/testing/selftests/net/netns_atomic.py | 39 +++++++++++++++++++++
> >  3 files changed, 50 insertions(+)
> >  create mode 100755 tools/testing/selftests/net/netns_atomic.py
> >
> > diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selft=
ests/net/Makefile
> > index cb2fc601de66..f9f7a765d645 100644
> > --- a/tools/testing/selftests/net/Makefile
> > +++ b/tools/testing/selftests/net/Makefile
> > @@ -34,6 +34,7 @@ TEST_PROGS +=3D gre_gso.sh
> >  TEST_PROGS +=3D cmsg_so_mark.sh
> >  TEST_PROGS +=3D cmsg_time.sh cmsg_ipv6.sh
> >  TEST_PROGS +=3D netns-name.sh
> > +TEST_PROGS +=3D netns_atomic.py
> >  TEST_PROGS +=3D nl_netdev.py
> >  TEST_PROGS +=3D srv6_end_dt46_l3vpn_test.sh
> >  TEST_PROGS +=3D srv6_end_dt4_l3vpn_test.sh
> > diff --git a/tools/testing/selftests/net/netns-name.sh b/tools/testing/=
selftests/net/netns-name.sh
> > index 6974474c26f3..0be1905d1f2f 100755
> > --- a/tools/testing/selftests/net/netns-name.sh
> > +++ b/tools/testing/selftests/net/netns-name.sh
> > @@ -78,6 +78,16 @@ ip -netns $NS link show dev $ALT_NAME 2> /dev/null &=
&
> >      fail "Can still find alt-name after move"
> >  ip -netns $test_ns link del $DEV || fail
> >
> > +#
> > +# Test no conflict of the same name/ifindex in different netns
> > +#
> > +ip -netns $NS link add name $DEV index 100 type dummy || fail
> > +ip -netns $NS link add netns $test_ns name $DEV index 100 type dummy |=
|
> > +    fail "Can create in netns without moving"
> > +ip -netns $test_ns link show dev $DEV >> /dev/null || fail "Device not=
 found"
> > +ip -netns $NS link del $DEV || fail
> > +ip -netns $test_ns link del $DEV || fail
> > +
> >  echo -ne "$(basename $0) \t\t\t\t"
> >  if [ $RET_CODE -eq 0 ]; then
> >      echo "[  OK  ]"
> > diff --git a/tools/testing/selftests/net/netns_atomic.py b/tools/testin=
g/selftests/net/netns_atomic.py
> > new file mode 100755
> > index 000000000000..d350a3fc0a91
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/netns_atomic.py
> > @@ -0,0 +1,39 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +import time
> > +
> > +from lib.py import ksft_run, ksft_exit, ksft_true
> > +from lib.py import ip
> > +from lib.py import NetNS, NetNSEnter
> > +from lib.py import RtnlFamily
> > +
> > +
> > +def test_event(ns1, ns2) -> None:
> > +    with NetNSEnter(str(ns1)):
> > +        rtnl =3D RtnlFamily()
> > +
> > +    rtnl.ntf_subscribe("rtnlgrp-link")
> > +
> > +    ip(f"netns set {ns1} 0", ns=3Dstr(ns2))
> > +
> > +    ip(f"link add netns {ns2} link-netnsid 0 dummy1 type dummy")
> > +    ip(f"link add netns {ns2} dummy2 type dummy", ns=3Dstr(ns1))
> > +
> > +    ip("link del dummy1", ns=3Dstr(ns2))
> > +    ip("link del dummy2", ns=3Dstr(ns2))
> > +
> > +    time.sleep(1)
> > +    rtnl.check_ntf()
> > +    ksft_true(rtnl.async_msg_queue.empty(),
> > +              "Received unexpected link notification")
>
> I think we need a much larger coverage here, possibly testing all the
> update drivers and more 'netns', 'link-netnsid', 'peer netns'
> permutations for the devices that allow them.

OK, I will add more cases. But I'm afraid I don't know how to build
valid parameters for all of them, and some seem to require hardware.

>
> Thanks,
>
> Paolo
>

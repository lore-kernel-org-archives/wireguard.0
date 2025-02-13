Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BAEC54EDA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16f36848;
	Tue, 20 May 2025 19:40:59 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72ee9458
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2025 10:01:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38dd011ff8bso516664f8f.0
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2025 02:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739440897; x=1740045697; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzLT98ZLU5P2fWKiTUzwgsTrlPg66ER6fTAj9aLF8fM=;
 b=LnfpVwxuzT/Jp7q/SziGCBFSOpaPcI1gkWoXFUZVPnQg9vv7VSQT3Frt7VqqsTdKQW
 ufhdVuxddsKi/WLde9sHfyXZbK5iPXGBk9vab/zXhD+pvB+SGuNHwqxOnw4VjMJQRJPF
 1g9M9stmMtRTAsO+QV95GA/xYh2itqlxjttwal4L6WG1Pp7N129FSHgGoiEzKWbK0Len
 QOPDvBl8z/qdXrQTbryxmmnYOCT/YW8m9Wltmc1Wqcq3jTVMmU1DN6icV9T7R4SL3dlF
 IMNmhBwAkTVXwcjML8cRqEeO2G9LAVYokAD8Zo1sMHMFsngwzx9LmiAlfjmTeQDWQECS
 Y0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739440897; x=1740045697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzLT98ZLU5P2fWKiTUzwgsTrlPg66ER6fTAj9aLF8fM=;
 b=ngFmW0pwThXNn9ibOO+MWtSc3o3PaBWjTQddNAuYLp4/anic7mrdI0fMWToD/qP0Z2
 zjfX9lnksCKdIfVW0IEimKDL0JJoQLPwPqhldx/9AbfMwHNgbMHVFIaiPlqB08phGTVU
 HejpY9Eg90eUEaPIIO/HEVPKBYyuZejTcwXVTBSn+ZZZe9H6rxdzf+ST8r2F19WRUBrH
 qjkViOw5hRJxCsKb3uWr9/XjMcyyyvCvT7crYXZrlIZ5+3BhvfyOFJisFtp2T9CJmku0
 p+80IFmsGVseudcWzM9tkH/5El/EYqW4UCPYWCCfEeuUVwm1XQ93FyUgd0w/fHoaw2CM
 xj8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRqaUpV4CKIt1H4LFNtG3yVmZLgcfcR5Xj4kLgE9jUPph7ij/PXxkdlaMBO/zD19ew6LxLRuFHjiI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwwajGRscL1N7qvRK0pmzDPXnhlvHPb/uDgXLV1BzyjG81/l3IJ
 gZzr9H20ugoIuoP/8FCgtAyyZqTZESAbRpCWbnu7OEk7U8cmh4pJWvSDPtjZ/s1bZOK6M3KTHDT
 AHLa57W9+v9utNdIt0SeuzBXkP7E=
X-Gm-Gg: ASbGncs+MKbSX82dyfu31u7reldsmqyYSmJObt/RpI4aWbvFosF3LjHwCM0dHyX1DFU
 bcCQhczM7JnUJS9KtaTa5eiLkXPIKjJoSVChLnyiqeI6GhLSLcH+j/7P8mf+AlRp1MKg9M2c=
X-Google-Smtp-Source: AGHT+IGNZlywLnJxQSbfEuVU5lxBk1mvVT9ugQLIpGpywWHBNNSM0YY4phrOkk812RGul4zBJlRkLm/hRcXNfYkCEHg=
X-Received: by 2002:a5d:64e2:0:b0:38f:21eb:5d02 with SMTP id
 ffacd0b85a97d-38f21eb5f2dmr4477949f8f.22.1739440897336; Thu, 13 Feb 2025
 02:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20250210133002.883422-3-shaw.leon@gmail.com>
 <20250213065348.8507-1-kuniyu@amazon.com>
 <CABAhCOTw+CpiwwRGNtDS3gntTQe7XESNzzi6RXd9ju1xO_a5Hw@mail.gmail.com>
 <2c294c0a-26c4-4ec5-992d-a2fd98829b16@redhat.com>
In-Reply-To: <2c294c0a-26c4-4ec5-992d-a2fd98829b16@redhat.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 13 Feb 2025 18:01:00 +0800
X-Gm-Features: AWEUYZkc6f7IS5VLx0dDxpZ4gB9UzsINfw32PuUeMd1tOC9C9cBZAvSRCBGNkQM
Message-ID: <CABAhCOQLHgiwkydm9vQAkVYZRyrCCu=E9Nh=wwkWFXox0x5uvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 02/11] rtnetlink: Pack newlink() params into
 struct
To: Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, alex.aring@gmail.com,
 andrew+netdev@lunn.ch, 
 b.a.t.m.a.n@lists.open-mesh.org, bpf@vger.kernel.org, bridge@lists.linux.dev, 
 davem@davemloft.net, donald.hunter@gmail.com, dsahern@kernel.org, 
 edumazet@google.com, herbert@gondor.apana.org.au, horms@kernel.org, 
 kuba@kernel.org, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-wpan@vger.kernel.org, miquel.raynal@bootlin.com, netdev@vger.kernel.org, 
 osmocom-net-gprs@lists.osmocom.org, shuah@kernel.org, 
 stefan@datenfreihafen.org, steffen.klassert@secunet.com, 
 wireguard@lists.zx2c4.com
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

On Thu, Feb 13, 2025 at 5:17=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 2/13/25 9:36 AM, Xiao Liang wrote:
> > On Thu, Feb 13, 2025 at 2:54=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazo=
n.com> wrote:
> > [...]
> >>> diff --git a/include/linux/if_macvlan.h b/include/linux/if_macvlan.h
> >>> index 523025106a64..0f7281e3e448 100644
> >>> --- a/include/linux/if_macvlan.h
> >>> +++ b/include/linux/if_macvlan.h
> >>> @@ -59,8 +59,10 @@ static inline void macvlan_count_rx(const struct m=
acvlan_dev *vlan,
> >>>
> >>>  extern void macvlan_common_setup(struct net_device *dev);
> >>>
> >>> -extern int macvlan_common_newlink(struct net *src_net, struct net_de=
vice *dev,
> >>> -                               struct nlattr *tb[], struct nlattr *d=
ata[],
> >>> +struct rtnl_newlink_params;
> >>
> >> You can just include <net/rtnetlink.h> and remove it from .c
> >> files, then this forward declaration will be unnecessary.
> >
> > OK. Was not sure if it's desirable to include include/net files from
> > include/linux.
>
> I think we are better of with the forward declaration instead of adding
> more intra header dependencies, which will slow down the build and will
> produces artifacts in the CI runs (increases of reported warning in the
> incremental build, as any warns from the included header will be
> 'propagated' to more files).
>
> >>> +extern int macvlan_common_newlink(struct net_device *dev,
> >>> +                               struct rtnl_newlink_params *params,
> >>>                                 struct netlink_ext_ack *extack);
> >>>
> >>>  extern void macvlan_dellink(struct net_device *dev, struct list_head=
 *head);
> >>
> >>
> >> [...]
> >>> diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
> >>> index bc0069a8b6ea..00c086ca0c11 100644
> >>> --- a/include/net/rtnetlink.h
> >>> +++ b/include/net/rtnetlink.h
> >>> @@ -69,6 +69,42 @@ static inline int rtnl_msg_family(const struct nlm=
sghdr *nlh)
> >>>               return AF_UNSPEC;
> >>>  }
> >>>
> >>> +/**
> >>> + *   struct rtnl_newlink_params - parameters of rtnl_link_ops::newli=
nk()
> >>
> >> The '\t' after '*' should be single '\s'.
> >>
> >> Same for lines below.
> >
> > This is copied from other structs in the same file. Should I change it?
>
> https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/process/mai=
ntainer-netdev.rst#L376
>
> In this series, just use the good formatting for the new code.

Got it. Thanks.

>
> Thanks,
>
> Paolo
>
